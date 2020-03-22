//
//  UIWindow+Extension.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/22/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit.UIWindow

extension UIWindow {
    
    func setRootController(_ controller: UIViewController) {
        self.makeKeyAndVisible()
        self.rootViewController = controller
    }
}
