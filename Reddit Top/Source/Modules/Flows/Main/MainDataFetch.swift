//
//  MainDataFetch.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

class MainDataFetch {
    
    private let postsService: PostNetworkService
    private var after: String?
    
    init(postsService: PostNetworkService) {
        self.postsService = postsService
    }
    
    func getPost(onNext: @escaping ([PostEntity]) -> Void, onError: @escaping (Error?) -> Void) {
        let postsService = self.postsService
        DispatchQueue(label: "MainDataFetch.getPosts.Dispatch").async {
            postsService.getPosts(onNext: { [weak self] (value) in
                PostsBuilder.buildPosts(from: value.post) { (posts) in
                    self?.after = value.after
                    onNext(posts)
                }
                }, onError: { error in
                    DispatchQueue.main.async {
                        onError(error)
                    }
            })
        }
    }
    
    func getPostWithAfter(onNext: @escaping ([PostEntity]) -> Void, onError: @escaping (Error?) -> Void) {
        let postsService = self.postsService
        let after = self.after
        DispatchQueue(label: "MainDataFetch.getPostWithAfter.Dispatch").async {
            postsService.getPosts(withAfter: after, onNext: { [weak self] (value) in
                PostsBuilder.buildPosts(from: value.post) { (posts) in
                    self?.after = value.after
                    onNext(posts)
                }
                }, onError: { error in
                    DispatchQueue.main.async {
                        onError(error)
                    }
            })
        }
    }
}

