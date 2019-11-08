# HouLogger

[![CI Status](https://img.shields.io/travis/jerome.developer.tw@gmail.com/HouLogger.svg?style=flat)](https://travis-ci.org/jerome.developer.tw@gmail.com/HouLogger)
[![Version](https://img.shields.io/cocoapods/v/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)
[![License](https://img.shields.io/cocoapods/l/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)
[![Platform](https://img.shields.io/cocoapods/p/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/HouLogger.svg)](https://cocoapods.org/pods/HouLogger)
[![CocoaPods](https://img.shields.io/cocoapods/dt/HouLogger.svg)](https://cocoapods.org/pods/HouLogger)
[![CocoaPods](https://img.shields.io/cocoapods/at/HouLogger.svg)](https://cocoapods.org/pods/HouLogger)
[![Platforms](https://img.shields.io/cocoapods/p/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)
[![Swift](http://img.shields.io/badge/swift-5.0-brightgreen.svg)](https://cocoapods.org/pods/HouLogger)
[![License](https://img.shields.io/cocoapods/l/HouLogger.svg?style=flat)](#license)

HouLogger is a pretty, lightweight, pure-Swift library for logging and saving log file in local disk.

## Features

- [x] Log pretty.
- [x] Save log in local disk.
- [x] Show log on UIWindow.
- [x] Record user APP version.
- [x] Record user updated APP version History. e.g 1.0 -> 1.1 -> 1.5
- [x] Record user device infomation.

## Start with HouLogger

### Two import classes
1. BaseLogger: Just Log
1. AdvancedLogger: Sub class of BaseLogger. And it provides the ability to save log in files and show log on UIWindow and UIView
1. LogTextView: Show Log UIView.

```swift
// configure in `application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool`
UserDefaults.standard.setAPPVersionAndHistory() // NOTE: Do not forget this line.
logger.configure([.debug, .fault, .error, .info, .normal])

// Usage
logI("info")
logD("debug")
logN("normal")
logE("Error String", theOSLog: .network)
logE(APIError.invalidURL, theOSLog: .network)
logF("fault", theOSLog: .test)
```

Print
```
⭐️😂: user
⭐️💩: AppDelegate [33], [application(_:didFinishLaunchingWithOptions:)]: code
⭐️🦋: #36, 12:57:26 PM: issue
⭐️❌: AppDelegate [35], [application(_:didFinishLaunchingWithOptions:)]: this is an error, error: The operation couldn’t be completed. (HouLogger_Example.AppDelegate.APIError error 0.)
```
### A More Advanced Example
#### Show Log Text View and save log file in cache directory
```swift
logger.configure(shouldShow: true, shouldCache: true)
```

Add LogTextView in your UIWindow/UIView
E.g
```swift
if #available(iOS 11.0, *) {
      window.addSubview(logTextView, constraints: [
        UIView.anchorConstraintEqual(from: \UIView.topAnchor, to: \UIView.safeAreaLayoutGuide.topAnchor, constant: .defaultMargin),
        UIView.anchorConstraintEqual(from: \UIView.leadingAnchor, to: \UIView.safeAreaLayoutGuide.leadingAnchor, constant: .defaultMargin),
        UIView.anchorConstraintEqual(from: \UIView.bottomAnchor, to: \UIView.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat.defaultMargin.negativeValue),
        UIView.anchorConstraintEqual(from: \UIView.trailingAnchor, to: \UIView.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat.defaultMargin.negativeValue),
      ])
    } else {
      window.addSubview(logTextView, constraints: [
        UIView.anchorConstraintEqual(with: \UIView.topAnchor, constant: .defaultMargin),
        UIView.anchorConstraintEqual(with: \UIView.leadingAnchor, constant: .defaultMargin),
        UIView.anchorConstraintEqual(with: \UIView.bottomAnchor, constant: CGFloat.defaultMargin.negativeValue),
        UIView.anchorConstraintEqual(with: \UIView.trailingAnchor, constant: CGFloat.defaultMargin.negativeValue),
      ])
    }
  }
```
## Requirements

- iOS 10.0+
- Swift 4.0+

## Installation

HouLogger is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HouLogger'
```

## Author

jerome.developer.tw@gmail.com

## License

HouLogger is available under the MIT license. See the LICENSE file for more info.
