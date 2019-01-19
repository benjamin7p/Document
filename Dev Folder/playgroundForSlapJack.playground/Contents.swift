//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


let url = URL(string: "https://deckofcardsapi.com/api/deck/new/")!




let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}
task.resume()

