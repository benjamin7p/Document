//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

struct Square: Drawable {
    
    func draw() {
        print(size)
    }
    
    var size: Float
}

protocol Drawable {
    
    
    func draw()
}
let square1 = Square(size: 10)
square1.draw()

