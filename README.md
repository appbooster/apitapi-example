# apitapi-example-ios

Example project to show the usage of ApiTapi and IncentCleaner frameworks.

## Initial project

There are three view controllers:
1) WelcomeViewController – Start/Root screen from which you can go to Paywall or go to log,
2) PaywallViewController – Paywall screen where you can purchase a subscription or go to log.
3) LogViewController – Log screen where you can see the log of the app, refresh or clear it.

There is using Amplitude analytics service integrated via CocoaPods.
Events:
– Launched the first time
– Session start (launched not the first time)
– Welcome screen has shown
– Paywall has shown
– Subscription button pressed

## ApiTapiID integration

This framework can provide a unique device token that helps to use other ApiTapi frameworks. Also, there is the opportunity to reset this device token.
In the example, it will be this provider so we will have the ability to identify the device for purchases tracking and to reset the device token for A/B testing.

### Installation

According to https://github.com/appbooster/apitapi-id-ios/blob/master/README.md

## ApiTapiPurchases integration

You can send info about purchases to ApiTapi service with this framework.
In the example, we will use it after the successful purchase of our test subscription.

### Installation

According to https://github.com/appbooster/apitapi-purchases-ios/blob/master/README.md

## ApiTapiAB integration

You can make A/B tests with this framework.
In the example, we will use it to show users two different variations of paywall screen (old and new) as 50/50 (segmentation is configured in the admin panel).

### Installation

According to https://github.com/appbooster/apitapi-ab-ios/blob/master/README.md

## IncentCleaner integration

You can cut off incent traffic with this framework.
In the example, we will use it to ignore Amplitude analytics service calls for users from incent traffic.

### Installation

According to https://github.com/appbooster/incent-cleaner-ios/blob/master/README.md
You can check the proper installation with `IncentCleanerChecker` according to https://github.com/appbooster/incent-cleaner-checker-ios/blob/master/README.md

==================================================

For a better understanding, we have split integration into separate commits.