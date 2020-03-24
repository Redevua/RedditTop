//
//  Label.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

class Label: UILabel {
    
    init(textColor: UIColor = .darkText, font: UIFont = .systemFont(ofSize: 14)) {
        super.init(frame: .zero)
        self.textColor = textColor
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        self.text = text
    }
}
