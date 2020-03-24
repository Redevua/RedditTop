//
//  Int+Extension.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

extension Int {
    
    var formatNumber: String {

        let n = self
        let num = abs(Double(n))
        let sign = (n < 0) ? "-" : ""

        switch num {

        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted.forTrailingZero)b"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted.forTrailingZero)m"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted.forTrailingZero)k"

        case 0...:
            return "\(n)"

        default:
            return "\(sign)\(n)"

        }
    }

}
