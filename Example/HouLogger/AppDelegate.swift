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
    UserDefaults.standard.setAPPVersionAndHistory()
    logger.configure([.debug, .fault, .error, .info, .normal], shouldShow: true, shouldCache: true)
    window = UIWindow(frame: UIScreen.main.bounds)
    guard let window = window else { fatalError() }
    window.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    window.makeKeyAndVisible()
    setupLogTextView()
    logD("didFinishLaunchingWithOptions")
    return true
  }
  
  private func setupLogTextView() {
    guard let window = window else { return }
    guard logger.shouldShow else { return }

    logTextView.layer.zPosition = .greatestFiniteMagnitude
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
}

