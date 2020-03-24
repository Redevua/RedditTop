//
//  BaseMetaEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

struct BaseMetaEntity: Codable {
    
    let currentPage: Int
    let totalPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case totalPage = "total_page"
    }
}
