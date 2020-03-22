//
//  BaseCoordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UINavigationController

class BaseCoordinator: Coordinator {
  
    var presentation: UINavigationController
    var finish: ((Coordinator) -> Void)?
    var childCoordinators: [Coordinator] = []
    
    init(presentation: UINavigationController) {
        self.presentation = presentation
    }
    
    func onStart() {
        fatalError("override this mthod if you want using coordinator")
    }
    
    func addChild(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.remove(at: index)
    }
    
    func onBack(animated: Bool) {
        presentation.popViewController(animated: animated)
    }
}

