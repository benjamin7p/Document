//
//  Prize.swift
//  NobelPrize2
//
//  Created by Benjamin Poulsen PRO on 12/21/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation

struct Prize: Codable {
    let year: String
    let category: String
    var laureates: [Laureate]
    
    enum CodingKeys: String, CodingKey {
        case year
        case category
        case laureates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Prize.CodingKeys.self)
        self.year = try container.decode(String.self, forKey: CodingKeys.year)
        self.category = try container.decode(String.self, forKey: CodingKeys.category)
        self.laureates = try container.decode([Laureate].self, forKey: CodingKeys.laureates)
    }
}
