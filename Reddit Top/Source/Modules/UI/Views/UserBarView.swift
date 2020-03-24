//
//  UserBarView.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class UserBarView: UIView {
    
    private let imageViewView: UIImageView = UIImageView()
    private let authorNameLabel: Label = Label(textColor: .darkGray, font: .systemFont(ofSize: 18, weight: .medium))
    private let timeAgoLabel: Label = Label(textColor: .lightGray, font: .systemFont(ofSize: 12, weight: .regular))
    
    init() {
        super.init(frame: .zero)
        addElements()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        imageViewView.layer.cornerRadius = 20
        imageViewView.backgroundColor = .orange
    }
    
    private func addElements() {
        addAutolayoutSubviews(imageViewView, authorNameLabel, timeAgoLabel)
        imageViewView
            .toSuper(anchors: .top, .bottom, .leading)
            .size(40)
        authorNameLabel
            .anchor(.top, to: imageViewView, anchor: .top, constant: 0)
            .anchor(.leading, to: imageViewView, anchor: .trailing, constant: 12)
            .toSuper(.trailing, constant: -12)
        timeAgoLabel
            .anchor(.top, to: authorNameLabel, anchor: .bottom, constant: 2)
            .anchor(.leading, to: authorNameLabel, anchor: .leading, constant: 2)
            .anchor(.trailing, to: authorNameLabel, anchor: .trailing)
    }
    
    func configure(with postEntity: PostEntity) {
        timeAgoLabel.configure(text: String(postEntity.timestamp))
        authorNameLabel.configure(text: postEntity.authorName)
        imageViewView.image = postEntity.thumbnail
    }
}
