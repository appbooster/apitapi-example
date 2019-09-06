//
//  ApiTapi.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import Foundation
import ApiTapiID
import ApiTapiPurchases
import ApiTapiAB

private let authToken: String = "028d216c7b9bf159b29aa70b"
private let test: String = "paywall"

struct ApiTapi {

  // MARK: Identification

  static var deviceToken: String {
    return ApiTapiID.deviceToken
  }

  static func resetDeviceToken() {
    return ApiTapiID.resetDeviceToken()
  }

  // MARK: Purchases

  private static let purchases: ApiTapiPurchases = ApiTapiPurchases(authToken: authToken,
                                                                    deviceToken: ApiTapiID.deviceToken)

  static func trackPurchase(productId: String,
                            revenue: Double,
                            currency: String?,
                            completion: @escaping (String?) -> Void) {
    purchases.track(productId: productId,
                    revenue: revenue,
                    currency: currency,
                    completion: completion)
  }

  // MARK: A/B Tests

  private static let ab: ApiTapiAB = ApiTapiAB(authToken: authToken,
                                               deviceToken: ApiTapiID.deviceToken)

  static func fetchTests(completion: @escaping (String?) -> Void) {
    ab.fetch(knownKeys: [test],
             completion: completion)
  }

  static var userProperties: [String: Any] {
    return ab.userProperties
  }

  enum Paywall: String {
    case old
    case new
  }

  static var paywall: Paywall {
    return Paywall(rawValue: ab.value(#function, or: Paywall.old.rawValue)) ?? .old
  }

  // MARK: Others

  static func configure() {
    ApiTapiID.log = { text in log(text) }
    purchases.log = { text in log(text) }
    ab.log = { text in log(text) }
  }

}
