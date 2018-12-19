//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
PlaygroundPage.current.needsIndefiniteExecution = true


struct Laureate: Codable {
    let id: String
    let firstname: String
    let surname: String
    let motivation: String
}

struct Prize: Codable {
    let year: String
    let category: String
    let laureates: [Laureate]
}
struct NobelResponse: Codable {
    let prizes: [Prize]
}
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
    
}

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
let newCLass = NobelService()
newCLass.requestData(query: ["year": "2016", "category": "physics"], completion: { response in
    print(response)
})


PlaygroundPage.current.finishExecution()



