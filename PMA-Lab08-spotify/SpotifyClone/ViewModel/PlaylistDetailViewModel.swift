//
//  PlaylistDetailViewModel.swift
//  SpotifyClone
//
//  Created by MAC46 on 20/05/22.
//

import Foundation
class PlaylistDetailViewModel {
    let request: Request = Request()
    
    var playlistDetail: PlaylistDetail? = nil
    
    func getPlaylistDetail(id: String) async {
        let data = await request.getDataFromAPI(url: "users/22qq743gby64ks5dsk7mrkcqa/playlists/\(id)")
        if data != nil {
            if let decoder = try? JSONDecoder().decode(PlaylistDetail.self, from: data!){
                DispatchQueue.main.async(execute: {
                    self.playlistDetail = decoder
                })
            }
        }
    }
}
