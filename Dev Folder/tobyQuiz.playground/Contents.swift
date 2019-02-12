//: A UIKit based Playground for presenting user interface
  import Foundation
import UIKit
import PlaygroundSupport



struct Person: Codable {
    var name: String
    var age: Int
    var birthday: Date
    
    
}

let encoder = JSONEncoder()
let data = try? encoder.encode(Person(name: "Joe", age: 22, birthday: Date()))

let json = String(data: data!, encoding: .utf8)

print(json ?? "")
// double ?? is ni coelesing. if json is nil the just print this blank string. unwrapping with out guard let
// birthday date is how many seconds since year 2000. need to format date.

let newJson = "{\"name\":\"Joe\",\"age\":22,\"birthday\":571676198.76407802}"
// have to do the back slashes to tell the compiler that the following chareter is a special carecter. has to escape so it read the entire line with out jumping out at the first pair of quotes.

let decoder = JSONDecoder()
let person = try? decoder.decode(Person.self, from: newJson.data(using: .utf8)!)

let dateFormatter = DateFormatter()
dateFormatter.timeZone = TimeZone(abbreviation: "MST")
dateFormatter.dateStyle = .long
dateFormatter.timeStyle = .long

let dateString = dateFormatter.string(from: Date())
