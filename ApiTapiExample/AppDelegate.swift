//
//  AppDelegate.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ApiTapi.configure()

    log("[ApiTapiExample] Device token: \(ApiTapi.deviceToken)")

    Analytics.activateAfterApplicationDidFinishLaunching(application,
                                                         launchOptions: launchOptions,
                                                         identifier: ApiTapi.deviceToken)
    
    if State.hasLaunchedBefore {
      Analytics.log(.sessionStart)
    } else {
      Analytics.log(.launchedFirstTime)
      
      State.hasLaunchedBefore = true
    }
    
    return true
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    Analytics.activateAfterApplicationDidBecomeActive(application)
  }

}

