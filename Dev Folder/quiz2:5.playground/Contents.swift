//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport




class DeckOfCardsController {
    
    static func performNetworkRequest(for url: URL, completion: ((Data?, Error?)-> Void)? = nil){
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let completion = completion {
                completion(data, error)
            }
        }
        
        session.resume()
    }
    
    
    
    let newURL = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
    
    func shuffle() {
        
    }

}





