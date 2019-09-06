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

private let authToken: String = "028d216c7b9bf159b29aa70b"

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

  // MARK: Others

  static func configure() {
    ApiTapiID.log = { text in log(text) }
    purchases.log = { text in log(text) }
  }

}
