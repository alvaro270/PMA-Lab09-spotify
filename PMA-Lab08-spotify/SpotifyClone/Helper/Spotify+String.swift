//
//  Spotify+String.swift
//  SpotifyClone
//
//  Created by MAC46 on 14/05/22.
//

import Foundation

class HelperString {
    
    static let imageProfileLink = "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1523174184657069&height=300&width=300&ext=1655075694&hash=AeTbiXena9OzIzUYKHY"
    
    static func getURLFromString(url: String) -> URL? {
        guard let url = URL(string: url) else { return nil }
        
        return url
    }
    
    static func setFormatNumber(number: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) else {return "" }
        return formattedNumber
    }
}
