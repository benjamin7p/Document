//
//  ViewController.swift
//  scrolling form
//
//  Created by Benjamin Poulsen PRO on 11/1/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

// methods
    
    @objc
    private func keyboardWasShown(_ notification: NSNotification) {
        guard let  info = notification.userInfo, let keyoardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyoardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsets(top: 50.0, left: 75.0, bottom: keyboardSize.height, right: 100.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc
    private func keyboardWillBeHidden(_ noification: NSNotification) {
        let adjustedKeyboardContentInsets = UIEdgeInsets.zero
        
        scrollView.contentInset = adjustedKeyboardContentInsets
        scrollView.scrollIndicatorInsets = adjustedKeyboardContentInsets

    }
    
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

