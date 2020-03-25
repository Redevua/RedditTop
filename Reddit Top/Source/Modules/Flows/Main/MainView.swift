//
//  MainView.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

protocol MainViewProtocol {
    var tableView: UITableView { get }
    var refreshControl: UIRefreshControl { get }
    
    func onLoading(_ isLoading: Bool)
    func configure(withCellData cellData: MainCellData)
}

class MainView: UIView, MainViewProtocol {
    
    let refreshControl = UIRefreshControl()
    let tableView: UITableView = UITableView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
  
    init() {
        super.init(frame: .zero)
        addElements()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.backgroundColor = Color.bgColor
        tableView.contentInset = .init(top: 0, left: 0, bottom: 12, right: 0)
        tableView.showsVerticalScrollIndicator = false
    }

    private func addElements() {
        tableView.addSubview(refreshControl)
        addAutolayoutSubviews(tableView, activityIndicator)
        tableView.toSuperEdges()
        activityIndicator
            .toSuper(.centerY)
            .toSuper(.centerX)
    }
    
    func configure(withCellData cellData: MainCellData) {
        tableView.register(cellData.cell, forCellReuseIdentifier: cellData.identifier)
    }
    
    func onLoading(_ isLoading: Bool) {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
