//
//  NetworkEndpoint.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

enum NetworkEndpoint: NetworkEndpointProtocol {
    
    static let baseDomain = "https://www.reddit.com"
   
    case getTopPosts
    
    var url: URL {
        return URL(string: urlString)!
    }
    var urlString: String {
        switch self {
        case .getTopPosts:
            return NetworkEndpoint.baseDomain + "/top.json"
        }
    }
    var method: RequestMethod {
        switch self {
        case .getTopPosts:
            return .GET
        }
    }
}
