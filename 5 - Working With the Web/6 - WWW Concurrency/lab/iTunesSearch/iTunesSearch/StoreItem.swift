//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Benjamin Poulsen PRO on 12/13/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    var artist: String
    var title: String
    var description: String
    var url: URL
    var longDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case artist
        case title
        case description
        case url
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        artist = try valueContainer.decode(String.self, forKey: CodingKeys.artist)
        title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        
        if let longDescription = try? valueContainer.decode(String.self, forKey: CodingKeys.longDescription)  {
            self.longDescription = longDescription
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            longDescription = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

