//
//  RequestBuilder.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

struct RequestBuilder {
    private let timeout: TimeInterval
    private let endpoint: NetworkEndpoint
    private let cachePolicy: URLRequest.CachePolicy
    private let body: Data?
    private let defaultHeader: [String: String] = [:]
    private let queryItems: [URLQueryItem]?
    private let pathComponents: [String]?
    private var headers: [String: String]?
    
    var composedUrl: URL {
        var url = endpoint.url
        pathComponents?.forEach({ url.appendPathComponent($0) })
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        return urlComponents?.url ?? url
    }
    
    var request: URLRequest {
        var request = URLRequest(
            url: composedUrl,
            cachePolicy: cachePolicy,
            timeoutInterval: timeout
        )
        switch endpoint.method {
        case .GET:
            break
        case .POST, .PATCH, .DELETE:
            request.httpBody = body
        }
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
    
    init(
        endpoint: NetworkEndpoint,
        pathComponents: [String]? = nil,
        query: [String: String]? = nil,
        headers: [String: String] = [:],
        body: Data? = nil,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeout: TimeInterval = 30
    ) {
        self.endpoint = endpoint
        self.cachePolicy = cachePolicy
        self.timeout = timeout
        self.body = body
        self.pathComponents = pathComponents
        self.queryItems = query?.map({ URLQueryItem(name: $0.key, value: $0.value) })
    }
}

struct DataWrapperEntity<T: Codable>: Codable {
    public let data: T
   
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct EmptyEntity: Codable {}
