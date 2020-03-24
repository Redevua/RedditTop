//
//  DetailViewController.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/25/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import Foundation
import SafariServices

class DetailViewController: SFSafariViewController {
    
    init(urlPath url: URL) {
        super.init(url: url, configuration: .init())
        configure()
    }
    
    private func configure() {
        preferredControlTintColor = .black
        modalPresentationStyle = .automatic
    }
}
