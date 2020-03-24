//
//  MainCellData.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

struct MainCellData {
    let cell: AnyClass = PostTableCell.self
    let identifier: String = String(describing: PostTableCell.self)
}
