//
//  AppRoot.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

final class AppRoot {
    
    init(
        _ application: UIApplication,
         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?,
         window: inout UIWindow?
    ) {
        setup(window: &window)
    }
    
    private func setup(window: inout UIWindow?) {
        let presentation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.setRootController(presentation)
        let coordinator = AppCoordinator(presentation: presentation)
        coordinator.onStart()
    }
}
