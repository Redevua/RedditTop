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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    private func loadData() {
        viewModel.fetch { [weak self] in
            self?.contentView.tableView.reloadData()
        }
    }
    
    private func bind() {
        contentView.tableView.delegate = viewModel
        contentView.tableView.dataSource = viewModel
    }
    
    private func configure() {
        contentView.configure(withCellData: viewModel.cellData)
    }
}

