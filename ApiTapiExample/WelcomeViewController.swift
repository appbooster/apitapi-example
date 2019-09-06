//
//  WelcomeViewController.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

  @IBOutlet private weak var toPaywallButton: UIButton!
  @IBOutlet private weak var infoLabel: UILabel!

  private var viewDidAppearOnce: Bool = false

  // MARK: UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    infoLabel.text = "This app demonstrates how ApiTapi works."
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    Analytics.log(.welcomeScreenHasShown)
  }

}
