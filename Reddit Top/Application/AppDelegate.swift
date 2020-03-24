//
//  AppDelegate.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var root: AppRoot!
    private var network: NetworkCore!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        network = NetworkCore()
        root = AppRoot(
            application,
            didFinishLaunchingWithOptions: launchOptions,
            window: &window,
            network: network
        )
        return true
    }
}
