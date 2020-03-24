//
//  PostContentView.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class PostContentView: UIView {
    
    private let thumbnailImageView: UIImageView = UIImageView()
    private let titleLabel: Label = Label(font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    private let userBarView: UserBarView = UserBarView()
    private let stackView: UIStackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        addElemnts()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElemnts() {
        addAutolayoutSubviews(titleLabel, stackView, userBarView)
        stackView.addArrangedSubview(thumbnailImageView)
        titleLabel
            .toSuper(.top, constant: 8)
            .toSuper(.leading, constant: 8)
            .toSuper(.trailing, constant: -4)
        stackView.axis = .vertical
        stackView
            .anchor(.top, to: titleLabel, anchor: .bottom, constant: 6)
            .toSuper(anchors: .leading, .trailing)
            .size(height: 120, priority: 999)
        thumbnailImageView
            .toSuperEdges()
        userBarView
            .anchor(.top, to: thumbnailImageView, anchor: .bottom, constant: 8)
            .anchor(.leading, to: titleLabel, anchor: .leading)
            .anchor(.trailing, to: titleLabel, anchor: .trailing)
            .toSuper(.bottom, constant: -4)
    }
    
    
    private func configure() {
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        titleLabel.numberOfLines = 0
        backgroundColor = .white
        layer.cornerRadius = 6
    }
    
    func configure(with postEntity: PostEntity) {
        titleLabel.configure(text: postEntity.title)
        userBarView.configure(with: postEntity)
        thumbnailImageView.setImage(atPath: postEntity.thumbnail, contentMode: .scaleAspectFill)
        thumbnailImageView.isHidden = (postEntity.thumbnail ?? "") == UIImage.defaultImage
    }
}

extension Int {
    var string: String {
        String(self)
    }
}

