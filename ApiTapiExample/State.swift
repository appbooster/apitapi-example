//
//  State.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import Foundation

func log(_ text: String) {
  State.log += "\(text)\n"

  #if DEBUG
  print(text)
  #endif
}

struct State {

  static var hasLaunchedBefore: Bool {
    get {
      return UserDefaults.standard.bool(forKey: #function)
    }
    set(newValue) {
      UserDefaults.standard.set(newValue, forKey: #function)
      UserDefaults.standard.synchronize()
    }
  }

  static var log: String = ""

}
