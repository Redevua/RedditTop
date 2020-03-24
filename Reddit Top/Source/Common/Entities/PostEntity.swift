//
//  PostEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UIImage

struct PostEntity: Codable {
    let title: String
    let thumbnail: String?
    let imageUrl: String?
    let authorName: String
    let timestamp: Int64
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case authorName = "author_fullname"
        case timestamp = "created_utc"
        case imageUrl = "url"
    }
}
