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
                duration: 0.5, options: .transitionCrossDissolve, animations: {
                    self.image = newValue
            },completion: nil )
        }
    }
    
    func setImage(atPath path: String?, contentMode: UIView.ContentMode){
        image = nil
        ImageBuilder(imagePath: path).configure { [weak self] (image) in
            self?.contentMode = contentMode
            self?.imageWithFade = image
        }
    }
}
