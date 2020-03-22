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
    
    enum NetworkResponse {
        case success(model: Codable)
        case failure(error: Error?)
    }
    
    private func fetchData<T: Codable>(
        responseModel model: T.Type,
        request: URLRequest,
        completion: @escaping ((data: Data?, response: URLResponse?, error: Error?)) -> Void
    ) {
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion((data: data, response: response, error: error))
            }
        }.resume()
    }
    
    private func fetch<T: Codable>(
        withResuestBuilder builder: RequestBuilder,
        requestParser parser: NetworkParser<T>,
        completion: @escaping (NetworkResponse) -> Void
    ) {
        fetchData(responseModel: T.self, request: builder.request) { [weak self] (data, response, error) in
            guard let self = self, self.validateResponse(response) else {
                completion(.failure(error: error))
                return
            }
            guard let model = try? parser.parse(data: data) else {
                completion(.failure(error: error))
                return
            }
            completion(.success(model: model))
        }
    }
    
    private func validateResponse(_ response: URLResponse?) -> Bool {
        if let response = response as? HTTPURLResponse {
            return (200...299) ~= response.statusCode
        } else {
            return false
        }
    }
}


