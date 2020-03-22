//
//  Configurable.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

protocol Configurable: AnyObject {}

extension Configurable {
    
    func then(_ configure: (Self) throws -> Void) rethrows -> Self {
        try configure(self)
        return self
    }
}
