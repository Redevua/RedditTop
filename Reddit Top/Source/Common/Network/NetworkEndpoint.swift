//
//  NetworkEndpoint.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

enum NetworkEndpoint: NetworkEndpointProtocol {
    
    case getTop
    
    var url: URL {
        return URL(string: urlString)!
    }
    var urlString: String {
        switch self {
        case .getTop:
            return "//....."
        }
    }
    var method: RequestMethod {
        switch self {
        case .getTop:
            return .GET
        }
    }
}
