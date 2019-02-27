//
//  Laureates.swift
//  NobelPrize2
//
//  Created by Benjamin Poulsen PRO on 12/21/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation

struct Laureate: Codable {
    let id: String
    let firstname: String
    let surname: String
    let motivation: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case surname
        case motivation
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Laureate.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.firstname = try container.decode(String.self, forKey: CodingKeys.firstname)
        self.surname = try container.decode(String.self, forKey: CodingKeys.surname)
        self.motivation = try container.decode(String.self, forKey: CodingKeys.motivation)
    }
}


