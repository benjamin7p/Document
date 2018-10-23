import UIKit

var str = "Hello, playground"

struct Animal: CustomStringConvertible {
    var description: String {
        
       
        return "Animal(color: \(color), (height: \(height), age: \(age)"
    }
    
    let color: UIColor
    let height: Int
    let age: Int
}

let animal = Animal(color: .brown, height: 24, age: 2)
print(animal)
