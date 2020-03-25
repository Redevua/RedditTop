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
    
    func getPosts(withAfter after: String? = nil, onNext: @escaping ((post: [PostEntity], after: String?)) -> Void, onError: @escaping (Error?) -> Void) {
        let network = self.network
        let builder: RequestBuilder
        if let after = after {
            builder = RequestBuilder(endpoint: .getTopPosts, query: ["after" : after])
        } else {
            builder = RequestBuilder(endpoint: .getTopPosts)
        }
        network.fetch(
            withResuestBuilder: builder,
            requestParser: NetworkParser<DataWrapperEntity<BaseChildrentEntity<[BaseChildrentDataEntity<PostEntity>]>>>(),
        onNext: { (value) in
            let posts = value.data.children.map({ $0.data })
            let after = value.data.after
            onNext((posts, after))
        }, onError: { error in
            onError(error)
        })
    }
}
