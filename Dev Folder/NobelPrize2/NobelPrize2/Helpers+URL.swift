//
//  Helpers+URL.swift
//  NobelPrize2
//
//  Created by Benjamin Poulsen PRO on 12/21/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation


extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
    func withHTTPS() -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        return components?.url
    }
    
}
