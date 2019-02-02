//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


// create a subclass of UIViewController. ass a view propery with the name "Container". in viewDidLoad add the container as a subview of "view"

// as extra credit, add a leading trailing top and bottom constraints to pin the container to the sides of "view". Hint anchors will be your friend

class newView: UIViewController {
    let container: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(container)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([container.topAnchor.constraint(equalTo: view.topAnchor),
                                     container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     container.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
    }
}
