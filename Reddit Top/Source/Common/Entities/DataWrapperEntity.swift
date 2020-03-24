//
//  DataWrapperEntity.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

public struct DataWrapperEntity<T: Codable>: Codable {
    public let data: T
   
    enum CodingKeys: String, CodingKey {
        case data
    }
}
