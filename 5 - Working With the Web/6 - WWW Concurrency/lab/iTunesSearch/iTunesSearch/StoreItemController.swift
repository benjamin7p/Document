//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Benjamin Poulsen PRO on 12/13/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItemController {
    
    func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
        
        let baseUrl = URL(string: "https://itunes.apple.com/search")
        
        guard let url = baseUrl?.withQueries(query) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            print(response!)
            print(String(data: data!, encoding: .utf8)!)
            if let data = data,
                let storeItems = try? jsonDecoder.decode(StoreItem.self, from: data) {
                completion(storeItems.results)
            }
            
            
        }
        task.resume()
        
    }
    

    
}

//let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
//completion(photoInfo) photoinfo = name of struct
//self.title = photoInfo.title
//self.imageView.image = image
//self.descriptionLabel.text = photoInfo.description


