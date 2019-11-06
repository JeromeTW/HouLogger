//
//  AppDelegate.swift
//  HouLogger
//
//  Created by jerome.developer.tw@gmail.com on 11/05/2019.
//  Copyright (c) 2019 jerome.developer.tw@gmail.com. All rights reserved.
//

import UIKit
import HouLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    logger.configure([.debug, .fault, .error, .info, .normal])
    logD("didFinishLaunchingWithOptions")
    return true
  }
}

