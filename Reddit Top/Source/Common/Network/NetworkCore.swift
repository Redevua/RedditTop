//
//  NetworkCore.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

final class NetworkCore {
    
    private let session: URLSession = URLSession.shared
    
    private func fetchData<T: Codable>(
        responseModel model: T.Type,
        request: URLRequest,
        completion: @escaping ((data: Data?, response: URLResponse?, error: Error?)) -> Void
    ) {
        session.dataTask(with: request) { (data, response, error) in
            completion((data: data, response: response, error: error))
        }.resume()
    }
    
    func fetch<T: Codable>(
        withResuestBuilder builder: RequestBuilder,
        requestParser parser: NetworkParser<T>,
        onNext: @escaping (T) -> Void,
        onError: @escaping (Error?) -> Void
    ) {
        fetchData(responseModel: T.self, request: builder.request) { [weak self] (data, response, error) in
            guard let self = self, self.validateResponse(response) else {
                onError(error)
                return
            }
            guard let model = try? parser.parse(data: data) else {
                onError(error)
                return
            }
            onNext(model)
        }
    }
    
    private func validateResponse(_ response: URLResponse?) -> Bool {
        print("CECL")
        if let response = response as? HTTPURLResponse {
            return (200...299) ~= response.statusCode
        } else {
            return false
        }
    }
}



