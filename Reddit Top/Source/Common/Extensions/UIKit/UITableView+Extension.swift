//
//  UITableView+Extension.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reload() {
        UIView.transition(
            with: self,
            duration: 0.35,
            options: .transitionCrossDissolve,
            animations: {
                self.reloadData()
        })
    }
    
    func reloadWithoutAnimate() {
        UIView.performWithoutAnimation {
            self.reloadSections(.init(arrayLiteral: 0), with: .none)
        }
    }
}
