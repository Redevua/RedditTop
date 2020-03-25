//
//  PostsBuilder.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/25/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation

struct PostsBuilder {

    static func buildPosts(from posts: [PostEntity], completion: @escaping ([PostEntity]) -> Void) {
        var newPosts: [PostEntity] = []
        let group = DispatchGroup()
        for post in posts {
            group.enter()
            PostsBuilder.buildPost(from: post) { (newPost) in
                newPosts.append(newPost)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            completion(newPosts)
        }
    }
    
    static func buildPost(from post: PostEntity, completion: @escaping (PostEntity) -> Void) {
        ImageBuilder(imagePath: post.thumbnail).build { (image) in
            guard let image = image else {
                completion(post)
                return
            }
            let updatedPost = post.with(image: image)
            completion(updatedPost)
        }
    }
}
