//
//  PlayList.swift
//  SpotifyClone
//
//  Created by MAC46 on 14/05/22.
//

import Foundation

struct PlayList: Codable {
    let href: String
    let items: [Item]
}


struct Item: Codable {
    let description: String
    let id: String
    let images: [Image]
    let name: String
}


struct Image: Codable {
    let height: Int?
    let url: String
    let width: Int?
}
