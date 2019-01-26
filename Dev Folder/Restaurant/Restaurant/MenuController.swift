//
//  MenuController.swift
//  Restaurant
//
//  Created by Benjamin Poulsen PRO on 1/4/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation

class MenuContoller {
    
    static let shared = MenuContoller()
    
    let baseURL = URL(string: "http://localhost:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL) { (data, response, error) in
            if let data = data,
                let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let categories = jsonDictionary? ["categories"] as? [String] {
                completion(categories)
            } else { completion(nil)
                
            }
            
        }
        task.resume()
    }
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL) { (data, response, error ) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data) {
                completion(menuItems.items)
            } else {
                completion(nil)
            }
            
        }
        task.resume()
    }
    
    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void) {
        
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data: [String: [Int]] = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let preperationTime = try? jsonDecoder.decode(PreperationTime.self, from: data) {
                completion(preperationTime.prepTime)
            } else {
                completion(nil)
            }
            
        }
        task.resume()
    }
    
}