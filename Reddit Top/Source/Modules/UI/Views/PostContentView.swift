//
//  PostContentView.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class PostContentView: UIView {
    
    private let titleLabel: Label = Label(font: UIFont.systemFont(ofSize: 26, weight: .semibold))
    private let userBarView: UserBarView = UserBarView()
    
    init() {
        super.init(frame: .zero)
        addElemnts()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElemnts() {
        addAutolayoutSubviews(titleLabel, userBarView)
        titleLabel
            .toSuper(.top, constant: 4)
            .toSuper(.leading, constant: 4)
            .toSuper(.trailing, constant: -4)
        userBarView
            .anchor(.top, to: titleLabel, anchor: .bottom, constant: 16)
            .anchor(.leading, to: titleLabel, anchor: .leading)
            .anchor(.trailing, to: titleLabel, anchor: .trailing)
            .toSuper(.bottom, constant: -4)
    }
    
    private func configure() {
        titleLabel.numberOfLines = 0
        backgroundColor = .white
        layer.cornerRadius = 6
    }
    
    func configure(with postEntity: PostEntity) {
        titleLabel.configure(text: postEntity.title)
        userBarView.configure(with: postEntity)
    }
}

extension Int {
    var string: String {
        String(self)
    }
}

