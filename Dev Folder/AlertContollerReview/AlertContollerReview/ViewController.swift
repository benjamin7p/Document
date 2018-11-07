//
//  ViewController.swift
//  AlertContollerReview
//
//  Created by Benjamin Poulsen PRO on 11/7/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func alertTapped(_ sender: Any) {
        // show an alert controller that will display a list of options to choose from
        let alertContoller = UIAlertController(title: "Title", message: "This is my message", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertContoller.addAction(cancel)
        
        let delete = UIAlertAction(title: "delete", style: .destructive) { (UIAlertAction) in
            self.view.backgroundColor = .black
        }
        alertContoller.addAction(delete)
        
        present(alertContoller, animated: true) {
            print("Im done")
        }
    }
    
}

