//
//  Data+Extension.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

extension Data {

    var json: String? {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8) {
            return JSONString
        } else {
            return nil
        }
    }
}
