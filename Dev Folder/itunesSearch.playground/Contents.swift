//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

let query: [String: String] = ["term": "Thrice", "media": "all" ]
let query2: [String: String] = ["term": "pulp+fiction", "media":"all" ]

let baseUrl = URL(string: "https://itunes.apple.com/search")

let url = baseUrl?.withQueries(query)!
let url2 = baseUrl?.withQueries(query2)


let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}
task.resume()

PlaygroundPage.current.finishExecution()


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


func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
    
    let baseUrl = URL(string: "https://itunes.apple.com/search")
    
    guard let url = baseUrl?.withQueries(query) else {
        completion(nil)
        print("unable to build URL with supplied queries")
        return
    }
    
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        if let data = data,
            let storedItems = try?
                decoder.decode(StoreItems.self, from: data) {
            completion(storedItems.results)
        } else {
            print("Either no data was returned, or data was not serialized")
            completion(nil)
            return
        }
    }
    task.resume()
}
struct StoreItems: Codable {
    let results: [StoreItem]
}


