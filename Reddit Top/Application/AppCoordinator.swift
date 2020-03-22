//
//  AppCoordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    override func onStart() {
        performMainFlow()
    }
    
    private func performMainFlow() {
        let mainCoordinator = MainCoordinator(presentation: presentation)
        mainCoordinator.finish = { [weak self] coordinator in
            self?.removeChild(coordinator: coordinator)
            self?.onStart()
        }
        addChild(coordinator: mainCoordinator)
        mainCoordinator.onStart()
    }
}


