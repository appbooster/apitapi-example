//
//  Analytics.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit
import Amplitude_iOS
import IncentCleaner

private let amplitudeApiKey: String = "72a4d3e2293bb546f92f2e78930ac13c"

enum AnalyticsEvent: String {
  case launchedFirstTime = "Launched the first time"
  case sessionStart = "Session start"
  case welcomeScreenHasShown = "Welcome screen has shown"
  case paywallHasShown = "Paywall has shown"
  case subscriptionButtonPressed = "Subscription button pressed"
}

struct Analytics {

  // MARK: Activation

  static func activate() {
    IncentCleaner.activate()
  }

  static func activateAfterApplicationDidFinishLaunching(_ application: UIApplication,
                                                         launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
                                                         identifier: String) {
    IncentCleaner.doIfNonIncent(type: .initial) {
      Amplitude.instance().initializeApiKey(amplitudeApiKey)
      Amplitude.instance()?.setDeviceId(identifier)
    }
  }

  static func activateAfterApplicationDidBecomeActive(_ application: UIApplication) {}

  // MARK: User properties

  static func setUserProperties(_ props: [String: Any]) {
    IncentCleaner.doIfNonIncent(type: .pre) {
      Amplitude.instance()?.setUserProperties(props)
    }
  }

  // MARK: Events

  static func log(_ event: AnalyticsEvent) {
    IncentCleaner.doIfNonIncent {
      Amplitude.instance().logEvent(event.rawValue)
    }
  }

}
