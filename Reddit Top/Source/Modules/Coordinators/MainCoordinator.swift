//
//  MainCoordinator.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UIViewController

protocol MainCoordinatorProtocol {
    func onOpenUrl(atPath path: String?)
}

class MainCoordinator: BaseCoordinator, MainCoordinatorProtocol {
    
    private let network: NetworkCore
    
    init(presentation: UINavigationController, network: NetworkCore) {
        self.network = network
        super.init(presentation: presentation)
    }
    
    override func onStart() {
        let view = MainView()
        let postService = PostNetworkService(newtork: network)
        let dataFetch = MainDataFetch(postsService: postService)
        let viewModel = MainViewModel(coordinator: self, dataFetch: dataFetch)
        let controller = MainViewController(contentView: view, viewModel: viewModel)
        controller.title = "Top listing"
        presentation.setViewControllers([controller], animated: true)
    }
    
    func onOpenUrl(atPath path: String?) {
        guard let path = path, let url = URL(string: path) else {
            return
        }
        let controller = DetailViewController(urlPath: url)
        presentation.present(controller, animated: true)
    }
}
