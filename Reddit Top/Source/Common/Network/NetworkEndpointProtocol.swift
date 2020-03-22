//
//  NetworkEndpointProtocol.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

protocol NetworkEndpointProtocol {
    var urlString: String { get }
    var method: RequestMethod { get }
}
