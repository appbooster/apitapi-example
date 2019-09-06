//
//  LogViewController.swift
//  ApiTapiExample
//
//  Created by Appbooster on 04/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {

  @IBOutlet private weak var textView: UITextView!

  // MARK: UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    refresh()
  }

  // MARK: Actions

  @IBAction
  private func close() {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }

  @IBAction
  private func refresh() {
    textView.text = State.log
  }

  @IBAction
  private func clear() {
    State.log = ""

    refresh()
  }

}
