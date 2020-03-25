//
//  UIImageView.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

extension UIImageView {
    
    var imageWithFade: UIImage? {
        get {
            return self.image
        }
        set {
            UIView.transition(
                with: self,
                duration: 0.25, options: .transitionCrossDissolve, animations: {
                    self.image = newValue
            },completion: nil )
        }
    }
    
    func setImage(atPath path: String?, contentMode: UIView.ContentMode) {
         self.contentMode = contentMode
        ImageBuilder(imagePath: path).configure { [weak self] (image) in
            self?.imageWithFade = image
        }
    }
}
