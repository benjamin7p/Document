//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

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

//let url = URL(string: "https://www.apple.com")!
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let data = data,
//    let string = String(data: data, encoding: .utf8) {
//        print(string)
//    }
//}
//task.resume()


extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather")!

let query: [String: String] = [
    "zip": "84043,us",
    "appid": "628a9b75830bdb44b8d156a663bf98be"
]

let url = baseURL.withQueries(query)!
print(url)
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    if let data = data,
        let string = String(data: data, encoding: .utf8){
        print(string)
    }
    if let response = response {
        print("Respons: \(response)")
    }
    if let error = error {
        print("Error: \(error)")
    }
}

task.resume()
