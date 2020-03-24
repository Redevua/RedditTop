//
//  BaseMetaEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

public struct BaseMetaEntity: Codable {
    
    public let currentPage: Int
    public let totalPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case totalPage = "total_page"
    }
}
