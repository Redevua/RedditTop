//
//  NetworkParser.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

final class NetworkParser<T: Codable> {
    
    func parse(
        data: Data?,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .secondsSince1970
    ) throws -> T {
        guard let data = data else {
            throw NetworkParseError.emptyData
        }
        NetworkLogger.log(data: data)
        return try JSONDecoder()
            .then({
                $0.dateDecodingStrategy = dateDecodingStrategy
            })
            .decode(T.self, from: data)
    }
}

//TODO: Generalization
struct NetworkLogger {
    static func log(data: Data) {
        print("RESPONSE \(data.json ?? "empty data")")
    }
}
