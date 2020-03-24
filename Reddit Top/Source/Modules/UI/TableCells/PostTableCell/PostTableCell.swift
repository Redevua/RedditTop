//
//  PostTableCell.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class PostTableCell: UITableViewCell {
    
    private let dataContainerView: PostContentView = PostContentView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func addElements() {
        addAutolayoutSubview(dataContainerView)
        dataContainerView
            .toSuper(.top, constant: 8)
            .toSuper(.leading, constant: 8)
            .toSuper(.trailing, constant: -8)
            .toSuper(.bottom)
    }
    
    func configure(with postEntity: PostEntity) {
        dataContainerView.configure(with: postEntity)
    }
}
