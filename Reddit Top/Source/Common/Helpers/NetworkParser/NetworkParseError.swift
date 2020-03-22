//
//  NetworkParseError.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

enum NetworkParseError: Error {
    case emptyData
}

extension NetworkParseError {
    var errorDescription: String? {
        return localizedDescription
    }
}
