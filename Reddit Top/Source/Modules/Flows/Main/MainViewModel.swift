//
//  MainViewModel.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit
import Combine

protocol MainViewModelProtocol: class {
   
    var cellData: MainCellData { get }
    var posts: [PostEntity] { get }
    var delegate: MainViewModelDelegate? { get set }
    
    func onLoadData(completion: @escaping () -> Void)
    func onAfterLoading(completion: @escaping () -> Void)
    func onRefresh(completion: @escaping (_ isReload: Bool) -> Void)
}

protocol MainViewModelDelegate: class {
    func main(viewModel: MainViewModel, didVisibleLastRow action: Void)
}

class MainViewModel: NSObject, MainViewModelProtocol {

    var posts: [PostEntity] = []
    var cellData: MainCellData = MainCellData()
    weak var delegate: MainViewModelDelegate?
    private var cellHeights: [IndexPath : CGFloat] = [:]
    private let dataFetch: MainDataFetch
    private let coordinator: Coordinator & MainCoordinatorProtocol
  
    init(coordinator: Coordinator & MainCoordinatorProtocol, dataFetch: MainDataFetch) {
        self.dataFetch = dataFetch
        self.coordinator = coordinator
    }
    
    func onLoadData(completion: @escaping () -> Void) {
        dataFetch.getPost(onNext: { [weak self] (posts) in
            self?.posts = posts
            completion()
        }, onError: { [weak self] error in
            self?.coordinator.onError(error: error)
            completion()
        })
    }
    
    func onRefresh(completion: @escaping (_ isReload: Bool) -> Void) {
        dataFetch.getPost(onNext: { [weak self] (posts) in
            if self?.posts == posts {
                completion(false)
            } else {
                self?.posts = posts
                completion(true)
            }
        }, onError: { [weak self] error in
            self?.coordinator.onError(error: error)
            completion(false)
        })
    }
    
    func onAfterLoading(completion: @escaping () -> Void) {
        dataFetch.getPostWithAfter(onNext: { [weak self] (posts) in
            self?.posts.append(contentsOf: posts)
            completion()
        }, onError: { [weak self] error in
            self?.coordinator.onError(error: error)
            completion()
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
        if isLastVisibleCell(at: indexPath) {
            delegate?.main(viewModel: self, didVisibleLastRow: ())
        }
        cellHeights[indexPath] = cell.frame.height
    }
    
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        let lastIndex = posts.count - 1
        return lastIndex == indexPath.row
    }
}

//MARK: -UITableViewDelegate
extension MainViewModel: UITableViewDelegate {

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath] ?? UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath] ?? UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator.onOpenUrl(atPath: posts[indexPath.row].url)
    }
}

