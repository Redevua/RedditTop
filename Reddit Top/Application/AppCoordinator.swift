//
//  AppCoordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let network: NetworkCore
    
    init(presentation: UINavigationController, network: NetworkCore) {
        self.network = network
        super.init(presentation: presentation)
    }
    
    override func onStart() {
        performMainFlow()
    }
    
    private func performMainFlow() {
        let mainCoordinator = MainCoordinator(presentation: presentation, network: network)
        mainCoordinator.finish = { [weak self] coordinator in
            self?.removeChild(coordinator: coordinator)
            self?.onStart()
        }
        addChild(coordinator: mainCoordinator)
        mainCoordinator.onStart()
    }
}


