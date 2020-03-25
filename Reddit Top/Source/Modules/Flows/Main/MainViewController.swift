//
//  MainViewController.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let contentView: UIView & MainViewProtocol
    private let viewModel: MainViewModelProtocol & UITableViewDelegate & UITableViewDataSource
    
    init(
        contentView: UIView & MainViewProtocol,
        viewModel: MainViewModelProtocol & UITableViewDelegate & UITableViewDataSource
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
        bind()
        loadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func loadData() {
        contentView.onLoading(true)
        viewModel.onLoadData { [weak self] in
            self?.contentView.onLoading(false)
            self?.contentView.tableView.reload()
        }
    }
    
    private func bind() {
        contentView.tableView.delegate = viewModel
        contentView.tableView.dataSource = viewModel
        viewModel.delegate = self
    }
    
    private func configure() {
        contentView.configure(withCellData: viewModel.cellData)
        contentView.refreshControl.addTarget(self, action: #selector(refreshWeatherData), for: .valueChanged)
    }
    
    @objc func refreshWeatherData(_ sender: Any) {
        viewModel.onRefresh { [weak self] isReload in
            self?.contentView.refreshControl.endRefreshing()
            if isReload {
                self?.contentView.tableView.reload()
            }
        }
    }
}

//MARK: -MainViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    
    func main(viewModel: MainViewModel, didVisibleLastRow action: Void) {
        viewModel.onAfterLoading { [weak self] in
            self?.contentView.tableView.reloadWithoutAnimate()
        }
    }
}

