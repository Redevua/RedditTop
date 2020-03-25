//
//  ImageBuilder.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

struct ImageBuilder {
    
    let imagePath: String?
    
    func configure(onNext: @escaping (UIImage?) -> Void) {
        let imagePath = self.imagePath
        DispatchQueue.global(qos: .userInteractive).async { 
            guard let path = imagePath,
                let url = URL(string: path),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) else {
                    return
            }
            DispatchQueue.main.async {
                onNext(image)
            }
        }
    }
}
