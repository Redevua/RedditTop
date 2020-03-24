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
    
    init(postsService: PostNetworkService) {
        self.postsService = postsService
    }
    
    func getPost(onNext: @escaping ([PostEntity]) -> Void, onError: @escaping (Error?) -> Void) {
        let postsService = self.postsService
        DispatchQueue(label: "MainDataFetch.getPosts.Dispatch").async {
            postsService.getPosts(onNext: { (posts) in
                DispatchQueue.main.async {
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
