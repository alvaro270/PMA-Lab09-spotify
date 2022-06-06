//
//  PlayListDetail.swift
//  SpotifyClone
//
//  Created by MAC46 on 20/05/22.
//

import Foundation

struct PlaylistDetail: Codable {
    let name: String
    let description: String
    let followers: Followers
    let tracks: Tracks
    
}
struct Followers: Codable {
    let total: Int
}

struct Tracks: Codable {
    let items: [ItemsDetail]
}

struct ItemsDetail: Codable {
    let track: Track
}

struct Track: Codable{
    let album: Album
}
struct Album: Codable{
    let name: String
    let artists: [Artists]
    let images: [ImageDetail]
}

struct Artists: Codable {
    let name: String
}

struct ImageDetail: Codable{
    let height: Int?
    let url: String
    let width: Int?
}
