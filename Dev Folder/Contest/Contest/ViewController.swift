//
//  ViewController.swift
//  Contest
//
//  Created by Benjamin Poulsen PRO on 11/28/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var email: UITextField!
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        if email?.text == "" {
            UIView.animate(withDuration: 0.5) {
                self.email.transform = CGAffineTransform(rotationAngle: 0.5)
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.email.transform = .identity
        }
    }
}



