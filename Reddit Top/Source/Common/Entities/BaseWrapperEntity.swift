//
//  BaseWrapperEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

public struct BaseWrapperEntity<T: Codable>: Codable {
    
    public let data: T
    public let meta: BaseMetaEntity?
    
    enum CodingKeys: String, CodingKey {
        case data
        case meta
    }
}

public struct BaseChildrentEntity<T: Codable>: Codable {
    public let children: T
}

public struct BaseChildrentDataEntity<T: Codable>: Codable {
    public let data: T
}
