//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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


struct Circle: CustomStringConvertible {
    let radius: Float
    let color: UIColor
    
    var description: String {
        return "I'm a circle with a radius of \(radius) and I am \(color)"
    }
    
    func diameter() -> Float{
        return radius * 2
        
    }
    
    
}

let newCircle = Circle(radius: 5.0, color: .blue)

print(newCircle)
