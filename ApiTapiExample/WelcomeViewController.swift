//
//  WelcomeViewController.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit
import ApiTapiID

class WelcomeViewController: ShakeToResetDeviceTokenViewController {

  @IBOutlet private weak var toPaywallButton: UIButton!
  @IBOutlet private weak var infoLabel: UILabel!

  private var viewDidAppearOnce: Bool = false

  // MARK: UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    infoLabel.text = "This app demonstrates how ApiTapi works.\n\nCurrent device token is\n\(ApiTapi.deviceToken)\n\nDevice token is used for sending the events to analytics system and for A/B testing.\n\nThere is an A/B test running on the paywall (\"old\" / \"new\" text). Please shake the device to reset the device token. It will mean that user will take part in the test as new user.\n\nWhen subscription is confirmed ApiTapi sends event about a trial start and then about premium start to integrated systems."
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    Analytics.log(.welcomeScreenHasShown)

    if !viewDidAppearOnce {
      viewDidAppearOnce = true

      ApiTapi.fetchTests { [weak self] error in
        guard let self = self else { return }

        if let error = error {
          log("[ApiTapiExample] Fetching tests error: \(error)")

          return
        }

        log("[ApiTapiExample] User properties: \(ApiTapi.userProperties.debugDescription)")

        Analytics.setUserProperties(ApiTapi.userProperties)

        self.toPaywallButton.isEnabled = true
      }
    }
  }

}
