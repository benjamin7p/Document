//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyView: UIView {
    var view = UIView()
    var button = UIButton()
    var isDirty = false
    
    init() {
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    @objc func tapped() {
        isDirty = true
    }
    

}
