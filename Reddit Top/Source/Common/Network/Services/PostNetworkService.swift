//
//  PostNetworkService.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

class PostNetworkService {
    
    private let network: NetworkCore
    
    init(newtork: NetworkCore) {
        self.network = newtork
    }
    
    func getPosts(onNext: @escaping ([PostEntity]) -> Void, onError: @escaping (Error?) -> Void) {
        let network = self.network
        network.fetch(
            withResuestBuilder: RequestBuilder(endpoint: .getTopPosts),
            requestParser: NetworkParser<DataWrapperEntity<BaseChildrentEntity<[BaseChildrentDataEntity<PostEntity>]>>>(),
        onNext: { (value) in
            let posts = value.data.children.map({ $0.data })
            onNext(posts)
        }, onError: { error in
            onError(error)
        })
    }
}
