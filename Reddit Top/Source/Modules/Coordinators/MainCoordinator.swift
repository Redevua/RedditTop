//
//  MainCoordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UIViewController

class MainCoordinator: BaseCoordinator {
    
    override func onStart() {
        let view = MainView()
        let viewModel = MainViewModel(dataFetch: Any.self)
        let controller = MainViewController(contentView: view, viewModel: viewModel)
        controller.title = "Top listing"
        presentation.navigationBar.prefersLargeTitles = true
        presentation.setViewControllers([controller], animated: true)
    }
}
