//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var label: UILabel?
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

         label = UILabel()
        label?.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label?.text = "Hello World!"
        label?.textColor = .black
        
        view.addSubview(label ?? UIView())
        self.view = view
    }
    func animate() {
        UIView.animate(withDuration: 1.0) {
            self.label?.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.label?.alpha = 4
        }
        
    }
    
    func animateBack() {
        
        UIView.animate(withDuration: 1.0) {
            self.label?.transform = .identity
        }
    }
    
}
// Present the view controller in the Live View window

let viewController = MyViewController()

PlaygroundPage.current.liveView = viewController

viewController.animate()

viewController.animateBack()







