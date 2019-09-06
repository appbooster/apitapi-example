//
//  ApiTapi.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import Foundation
import ApiTapiID

struct ApiTapi {

  // MARK: Identification

  static var deviceToken: String {
    return ApiTapiID.deviceToken
  }

  static func resetDeviceToken() {
    return ApiTapiID.resetDeviceToken()
  }

  // MARK: Others

  static func configure() {
    ApiTapiID.log = { text in log(text) }
  }

}
