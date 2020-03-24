//
//  PostEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

struct PostEntity: Codable {
    let title: String
    let thumbnail: String?
    let thumbnailHeight, thumbnailWidth: CGFloat?
    
    let url: String?
    let authorName: String
    let timestamp: Date
    let numComments: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case authorName = "author"
        case timestamp = "created_utc"
        case url
        case numComments = "num_comments"
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
    }
}
