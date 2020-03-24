//
//  MainViewModel.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

protocol MainViewModelProtocol {
    var cellData: MainCellData { get }
    func fetch(completion: @escaping () -> Void)
}

class MainViewModel: NSObject, MainViewModelProtocol {
    
    var posts: [PostEntity] = []
    let cellData: MainCellData = MainCellData()
    
    init(dataFetch: Any) {
        
    }
    
    func fetch(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.posts.append(
                contentsOf: [
                    PostEntity(
                        title: "asihushfuahfuiha^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Andrea KJjs",
                        timestamp: 7878768
                    ),
                    PostEntity(
                        title: "GHghdsgahdga shdahs^&*6786gfg j jdfjsh jfhs jhjfhdfjhdjhj fjhdjfhjhh dg f",
                        thumbnail: nil,
                        authorName: "Maata Bmma",
                        timestamp: 324232
                    ),
                    PostEntity(
                        title: "asihushfuahfuiha^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Ajjds Ytee",
                        timestamp: 3423
                    ),
                    PostEntity(
                        title: "NAyhdsd sdjhaj jaljshda jjhjahs ^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Managa KJjs",
                        timestamp: 423423
                    ),
                    PostEntity(
                        title: "asihushfuahfuiha^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Andrea KJjs",
                        timestamp: 7878768
                    ),
                    PostEntity(
                        title: "GHghdsgahdga shdahs^&*6786gfg j jdfjsh jfhs jhjfhdfjhdjhj fjhdjfhjhh dg f",
                        thumbnail: nil,
                        authorName: "Maata Bmma",
                        timestamp: 324232
                    ),
                    PostEntity(
                        title: "asihushfuahfuiha^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Ajjds Ytee",
                        timestamp: 3423
                    ),
                    PostEntity(
                        title: "NAyhdsd sdjhaj jaljshda jjhjahs ^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Managa KJjs",
                        timestamp: 423423
                    ),
                    PostEntity(
                        title: "asihushfuahfuiha^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Andrea KJjs",
                        timestamp: 7878768
                    ),
                    PostEntity(
                        title: "GHghdsgahdga shdahs^&*6786gfg j jdfjsh jfhs jhjfhdfjhdjhj fjhdjfhjhh dg f",
                        thumbnail: nil,
                        authorName: "Maata Bmma",
                        timestamp: 324232
                    ),
                    PostEntity(
                        title: "asihushfuahfuiha^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Ajjds Ytee",
                        timestamp: 3423
                    ),
                    PostEntity(
                        title: "NAyhdsd sdjhaj jaljshda jjhjahs ^&*6786gfg hytf ygg gh hfghdg f",
                        thumbnail: nil,
                        authorName: "Managa KJjs",
                        timestamp: 423423
                    )
                ]
            )
            completion()
        }
    }
}

//MARK: -UITableViewDataSource
extension MainViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellData.identifier, for: indexPath) as? PostTableCell else {
            fatalError("fatall error register \(cellData.identifier)")
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }
}

//MARK: -UITableViewDelegate
extension MainViewModel: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        cellData.cellHeight
//    }
}

