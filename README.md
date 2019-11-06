# HouLogger

[![CI Status](https://img.shields.io/travis/jerome.developer.tw@gmail.com/HouLogger.svg?style=flat)](https://travis-ci.org/jerome.developer.tw@gmail.com/HouLogger)
[![Version](https://img.shields.io/cocoapods/v/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)
[![License](https://img.shields.io/cocoapods/l/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)
[![Platform](https://img.shields.io/cocoapods/p/HouLogger.svg?style=flat)](https://cocoapods.org/pods/HouLogger)

HouLogger is a pretty, pure-Swift library for logging and saving log file in local disk. It provides you a chance to check log in Console APP.

## Features

- [ x ] Log pretty.
- [ x ] Save log in local disk.
- [ x ] Show log on UIWindow.

## Start with HouLogger

* BaseLogger() // Test Target 要測試時用這個
* AdvancedLogger() // APP Target 用這個，此包含 UI 和 Log 檔案儲存。
```swift
// configure in `application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool`
UserDefaults.standard.setAPPVersionAndHistory()
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
2019-11-06 10:03:45.628206+0800 HouLogger_Example[28504:8093524] [default] ⭐️ [📗 Info] [AppDelegate.application(_:didFinishLaunchingWithOptions:):32] > info
2019-11-06 10:03:45.678523+0800 HouLogger_Example[28504:8093524] [default] ⭐️ [🐌 Debug] [AppDelegate.application(_:didFinishLaunchingWithOptions:):33] > debug
2019-11-06 10:03:45.682209+0800 HouLogger_Example[28504:8093524] [default] ⭐️ [🍋 Default] [AppDelegate.application(_:didFinishLaunchingWithOptions:):34] > normal
2019-11-06 10:03:45.685312+0800 HouLogger_Example[28504:8093524] [network] ⭐️ [‼️ Error] [AppDelegate.application(_:didFinishLaunchingWithOptions:):35] > Error String
2019-11-06 10:03:45.698070+0800 HouLogger_Example[28504:8093524] [network] ⭐️ [‼️ Error] [AppDelegate.application(_:didFinishLaunchingWithOptions:):36] > Error: The operation couldn’t be completed. (HouLogger_Example.AppDelegate.APIError error 0.)
2019-11-06 10:03:45.701780+0800 HouLogger_Example[28504:8093524] [test] ⭐️ [❌ Fault] [AppDelegate.application(_:didFinishLaunchingWithOptions:):37] > fault
```
### A More Advanced Example
Show Log Text View and save log file in cache directory
```swift
logger.configure([.debug, .fault, .error, .info, .normal], shouldShow: true, shouldCache: true)
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
