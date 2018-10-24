//
//  ViewController.swift
//  AppEventCount
//
//  Created by Benjamin Poulsen PRO on 10/23/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
        // Do any additional setup after loading the view, typically from a nib.
        
    

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    var launchCount = 0
    @IBOutlet weak var willResignActiveLabel: UILabel!
    var resingCount = 0
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    var backgroundCount = 0
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    var foregroundCount = 0
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    var activeCount = 0
    @IBOutlet weak var willTerminateLabel: UILabel!
    var terminateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    updateView()
    }
    func updateView() {
        didFinishLaunchingLabel.text = "the app has lauched \(launchCount) time(s)"
        willResignActiveLabel.text = "the app has resinged active \(resingCount) time(s)"
        didEnterBackgroundLabel.text = "the app has entered background \(backgroundCount) time(s)"
        willEnterForegroundLabel.text = "the app has entered foreground \(foregroundCount) time(s)"
        didBecomeActiveLabel.text = "the app has become active \(activeCount) time(s)"
        willTerminateLabel.text = " the app has terminatated \(terminateCount) time(s)"
        
    }
}
