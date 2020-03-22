//
//  Coordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UINavigationController

protocol Coordinator: AnyObject {
    
    var presentation: UINavigationController { get }
    var finish: ((Coordinator) -> Void)? { get set }

    func addChild(coordinator: Coordinator)
    func removeChild(coordinator: Coordinator)
    func onStart()
    func onBack(animated: Bool)
}
