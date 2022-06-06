//
//  Request.swift
//  SpotifyClone
//
//  Created by MAC46 on 14/05/22.
//

import Foundation
class Request {
    
    let token = "BQDBzS-JSVPnYbOZDxTplCJHUovUZHCx0xgmS1rsO5LoTCCaUhXLCxG-wP6Prw88GiPjYVzCJVYbZKI1cQOOgj7i7s-GfoCdtJ2sXNXb5kVo8lsF2vTiPcWZYuctUebjcV-vPi-KnfkEwp1bCmoExV1bAqGm-3gH59CRzXRtYMYX_l3VCw"
    let BASE_URL = "https://api.spotify.com/v1/"
    
    // ojo si un type tiene el signo ? es pq puede ser nil
    //en este caso estamos diciendo que nuestra funcion retorne un Data o nil
    func getDataFromAPI(url: String) async -> Data? {
            do {
                var request = URLRequest(url: HelperString.getURLFromString(url: "\(BASE_URL)\(url)")!)
                request.httpMethod = "GET"
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                
                let (data, _) = try await URLSession.shared.data(for: request)
                
                return data
            } catch {
                return nil
            }
        }
}
