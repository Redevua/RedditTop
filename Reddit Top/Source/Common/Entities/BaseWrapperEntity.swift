//
//  BaseWrapperEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

struct BaseWrapperEntity<T: Codable>: Codable {
    
    let data: T
    let meta: BaseMetaEntity?
    
    enum CodingKeys: String, CodingKey {
        case data
        case meta
    }
}
