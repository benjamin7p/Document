//
//  ViewController.swift
//  AppEventCount
//
//  Created by Benjamin Poulsen PRO on 10/23/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    var launchCount = 0
    @IBOutlet weak var willResignActiveLabel: UILabel!
    
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    
}

