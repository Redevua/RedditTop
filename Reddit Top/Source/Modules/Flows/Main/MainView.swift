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
    
    func configure(withCellData cellData: MainCellData)
}

class MainView: UIView, MainViewProtocol {
    
    let tableView: UITableView = UITableView()
    
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
        tableView.backgroundColor = .white
        tableView.contentInset = .init(top: 0, left: 0, bottom: 24, right: 0)
    }

    private func addElements() {
        addAutolayoutSubview(tableView)
        tableView.toSuperEdges()
    }
    
    func configure(withCellData cellData: MainCellData) {
        tableView.register(cellData.cell, forCellReuseIdentifier: cellData.identifier)
    }
}
