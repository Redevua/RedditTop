//
//  MainViewModel.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

protocol MainViewModelProtocol {
    var cellData: MainCellData { get }
    func fetch(completion: @escaping () -> Void)
}

class MainViewModel: NSObject, MainViewModelProtocol {
    
    var posts: [PostEntity] = []
    var cellData: MainCellData = MainCellData()
    private var cellHeights: [IndexPath : CGFloat] = [:]
    private let dataFetch: MainDataFetch
    private let coordinator: Coordinator
    
    init(coordinator: Coordinator, dataFetch: MainDataFetch) {
        self.dataFetch = dataFetch
        self.coordinator = coordinator
    }
    
    func fetch(completion: @escaping () -> Void) {
        dataFetch.getPost(onNext: { [weak self] (posts) in
            self?.posts = posts
            completion()
        }, onError: { [weak self] error in
            self?.coordinator.onError(error: error)
        })
    }
}

//MARK: -UITableViewDataSource
extension MainViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellData.identifier, for: indexPath) as? PostTableCell else {
            fatalError("fatall error register \(cellData.identifier)")
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.height
    }
}

//MARK: -UITableViewDelegate
extension MainViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath, default: UITableView.automaticDimension]
    }
}

