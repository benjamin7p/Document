//
//  NobelService.swift
//  NobelPrize2
//
//  Created by Benjamin Poulsen PRO on 12/21/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation


class NobelService  {
    let url = URL(string: "http://api.nobelprize.org/v1/prize.json?")!
    
    
    func requestData(query: [String: String], completion: @escaping (NobelResponse?) -> Void) {
        let newUrl = url.withQueries(query)!
        let task = URLSession.shared.dataTask(with: newUrl) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                let response = try? jsonDecoder.decode(NobelResponse.self, from: data)
                completion(response)
                
            } else {
                print("Could not load data")
            }
        }
        task.resume()
        
    }
    
}
