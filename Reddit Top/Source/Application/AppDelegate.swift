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

    private var coordinator: Coordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //TODO: -generalization
        let presentation  = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.setRootController(presentation)
        coordinator = AppCoordinator(presentation: presentation)
        coordinator?.onStart()
        return true
    }
}
