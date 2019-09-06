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

    infoLabel.text = "This app demonstrates how ApiTapi works.\n\nCurrent device token is\n\(ApiTapi.deviceToken)\n\nDevice token is used for sending the events to analytics system.\n\nWhen subscription is confirmed ApiTapi sends event about a trial start and then about premium start to integrated systems."
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    Analytics.log(.welcomeScreenHasShown)
  }

}
