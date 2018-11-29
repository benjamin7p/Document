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
            UIView.animate(withDuration: 0.2, animations: {
                self.email.transform = CGAffineTransform(translationX: 0, y: -6)
            }){(_) in
                UIView.animate(withDuration: 0.2) {
                    self.email.transform = CGAffineTransform(translationX: 0, y: 6)
                    self.email.transform = CGAffineTransform.identity
                }
            }
        } else if email?.text != "" {
            performSegue(withIdentifier: "toEntered", sender: nil)
        }
    }
}



