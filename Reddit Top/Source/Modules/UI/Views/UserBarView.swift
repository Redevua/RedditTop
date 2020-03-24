//
//  UserBarView.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class UserBarView: UIView {
    
    private let commentsImageView: UIImageView = UIImageView()
    private let authorNameLabel: Label = Label(
        textColor: .darkGray,
        font: .systemFont(ofSize: 16, weight: .medium)
    )
    private let commentsCountLabel: Label = Label(
        textColor: .lightGray,
        font: .systemFont(ofSize: 14, weight: .medium)
    )
    private let timeAgoLabel: Label = Label(
        textColor: .lightGray,
        font: .systemFont(ofSize: 12, weight: .regular)
    )
    
    init() {
        super.init(frame: .zero)
        addElements()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        commentsImageView.image = UIImage(named: "ic_comments")?.tintColor(with: .lightGray)
    }
    
    private func addElements() {
        addAutolayoutSubviews(
            authorNameLabel,
            timeAgoLabel,
            commentsImageView,
            commentsCountLabel
        )
        authorNameLabel
            .toSuper(anchors: .top, .leading, .trailing)
        timeAgoLabel
            .anchor(.top, to: authorNameLabel, anchor: .bottom, constant: 2)
            .anchor(.leading, to: authorNameLabel, anchor: .leading)
            .anchor(.trailing, to: authorNameLabel, anchor: .trailing)
        commentsImageView
            .toSuper(.trailing, constant: -4)
            .anchor(.top, to: authorNameLabel, anchor: .bottom, constant: 2)
            .anchor(.centerY, to: timeAgoLabel, anchor: .centerY)
            .size(16)
            .toSuper(.bottom, constant: -2)
        commentsCountLabel
            .anchor(.trailing, to: commentsImageView, anchor: .leading, constant: -2)
            .anchor(.centerY, to: commentsImageView, anchor: .centerY, constant: -1)
    }
    
    func configure(with postEntity: PostEntity) {
        authorNameLabel.configure(text: postEntity.authorName)
        commentsCountLabel.configure(text: postEntity.numComments.formatNumber)
        DispatchQueue.global(qos: .userInitiated).async {
            let timeAgo = postEntity.timestamp.getElapsedInterval()
            DispatchQueue.main.async { [weak self] in
                self?.timeAgoLabel.configure(text: timeAgo)
            }
        }
    }
}
