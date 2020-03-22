//
//  MainCoordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UIViewController

final class MainCoordinator: BaseCoordinator {
    
    override func onStart() {
        let controller = MainViewController()
        presentation.setViewControllers([controller], animated: true)
    }
}
