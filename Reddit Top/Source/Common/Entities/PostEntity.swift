//
//  PostEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

struct PostEntity: Equatable {
    
    let title: String
    let thumbnail: String?
    let image: UIImage?
    let url: String?
    let authorName: String
    let timestamp: Date
    let numComments: Int
}

extension PostEntity: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case authorName = "author"
        case timestamp = "created_utc"
        case url
        case numComments = "num_comments"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        thumbnail = try? container.decode(String.self, forKey: .thumbnail)
        url = try? container.decode(String.self, forKey: .url)
        authorName = try container.decode(String.self, forKey: .authorName)
        timestamp = try container.decode(Date.self, forKey: .timestamp)
        numComments = try container.decode(Int.self, forKey: .timestamp)
        image = nil
    }
}

extension PostEntity {
    
    func with(image: UIImage) -> PostEntity {
        return .init(
            title: title,
            thumbnail: thumbnail,
            image: image,
            url: url,
            authorName: authorName,
            timestamp: timestamp,
            numComments: numComments
        )
    }
}
