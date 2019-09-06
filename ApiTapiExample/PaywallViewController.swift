//
//  PaywallViewController.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit

private let productIdentifier: String = "sub.apitapi.example"

class PaywallViewController: UIViewController {

  @IBOutlet private weak var testLabel: UILabel!
  @IBOutlet private weak var purchaseButton: UIButton!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!

  private var viewDidAppearOnce: Bool = false

  // MARK: UIViewController

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    Analytics.log(.paywallHasShown)

    if !viewDidAppearOnce {
      viewDidAppearOnce = true

      Store.retrieveProducts([productIdentifier],
                             onSuccess: { [weak self] in
                              self?.purchaseButton.isEnabled = true
        },
                             onFailure: { [weak self] error in
                              log("[ApiTapiExample] Retrieving products error: \(error)")

                              self?.navigationController?.popViewController(animated: true)
      })
    }
  }

  // MARK: Actions

  @IBAction
  private func purchase() {
    Analytics.log(.subscriptionButtonPressed)

    change(isActive: true)

    Store.purchase(productIdentifier,
                   onSuccess: { [weak self] in
                    log("[ApiTapiExample] Purchase success")

                    self?.change(isActive: false)
      },
                   onFailure: { [weak self] error in
                    log("[ApiTapiExample] Purchase failed: \(error)")

                    self?.change(isActive: false)
    })
  }

  // MARK: Others

  private func change(isActive: Bool) {
    purchaseButton.isHidden = isActive
    activityIndicatorView.isHidden = !isActive
  }

}
