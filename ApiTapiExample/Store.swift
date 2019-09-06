//
//  Store.swift
//  ApiTapiExample
//
//  Created by Appbooster on 03/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import Foundation
import StoreKit

class Store: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {

  private static let shared: Store = Store()

  private var products: [SKProduct] = []

  private var onSuccess: (() -> Void)?
  private var onFailure: ((String) -> Void)?

  // MARK: NSObject

  private override init() {
    super.init()
    
    SKPaymentQueue.default().add(self)
  }

  // MARK: SKProductsRequestDelegate

  func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
    products = response.products

    onSuccess?()
    onSuccess = nil
  }

  func request(_ request: SKRequest, didFailWithError error: Error) {
    onFailure?(error.localizedDescription)
    onFailure = nil
  }

  // MARK: SKPaymentTransactionObserver

  func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    for transaction in transactions {
      switch transaction.transactionState {
      case .purchased:
        SKPaymentQueue.default().finishTransaction(transaction)

        onSuccess?()
        onSuccess = nil
      case .failed:
        SKPaymentQueue.default().finishTransaction(transaction)

        onFailure?(transaction.error?.localizedDescription ?? "")
        onFailure = nil
      case .restored:
        SKPaymentQueue.default().finishTransaction(transaction)
      case .deferred, .purchasing:
        break
      default:
        break
      }
    }
  }

  // MARK: Others

  static func retrieveProducts(_ productIdentifiers: Set<String>,
                               onSuccess: @escaping () -> Void,
                               onFailure: @escaping (String) -> Void) {
    shared.onSuccess = onSuccess
    shared.onFailure = onFailure

    let productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
    productsRequest.delegate = shared
    productsRequest.start()
  }

  static func productInfoBy(_ productIdentifier: String) -> (revenue: Double, currency: String?) {
    guard let product = shared.products.first(where: { $0.productIdentifier == productIdentifier }) else {
      return (0.0, nil)
    }

    return (product.price.doubleValue, product.priceLocale.currencyCode)
  }

  static func purchase(_ productIdentifier: String,
                       onSuccess: @escaping () -> Void,
                       onFailure: @escaping (String) -> Void) {
    guard SKPaymentQueue.canMakePayments() else {
      onFailure("Can not make payments")

      return
    }

    guard let product = shared.products.first(where: { $0.productIdentifier == productIdentifier }) else {
      onFailure("There is no product with identifier: \(productIdentifier)")

      return
    }

    shared.onSuccess = onSuccess
    shared.onFailure = onFailure

    let payment = SKPayment(product: product)
    SKPaymentQueue.default().add(payment)
  }

}
