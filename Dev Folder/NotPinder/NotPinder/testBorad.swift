//
//  testBorad.swift
//  NotPinder
//
//  Created by Benjamin Poulsen PRO on 4/8/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class testBorad: UIStoryboard {
 
    static let sharedController = testBorad()
    
    override func instantiateInitialViewController() -> UIViewController? {
        let otherView = ViewController()
       let controller = MyCollectionViewController()
        return otherView
    }
    
   
}
