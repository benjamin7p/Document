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

let query: [String: String] = ["term": "Deftones", "media": "all" ]
let query2: [String: String] = ["term": "pulp+fiction", "media":"all" ]

let baseUrl = URL(string: "https://itunes.apple.com/search")

let url = baseUrl?.withQueries(query)!
let url2 = baseUrl?.withQueries(query2)


let task = URLSession.shared.dataTask(with: url2!) { (data, response, error) in
if let data = data,
    let string = String(data: data, encoding: .utf8) {
    print(string)
    }
}
task.resume()

//PlaygroundPage.current.finishExecution()
