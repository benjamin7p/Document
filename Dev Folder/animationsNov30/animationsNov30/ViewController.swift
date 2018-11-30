//
//  ViewController.swift
//  animationsNov30
//
//  Created by Benjamin Poulsen PRO on 11/30/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var blueView: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))


    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
    }

    @IBAction func play(_ sender: Any) {
        
//        UIView.animate(withDuration: 5) {
//            self.blueView.backgroundColor = .green
//        }
        
//        UIView.animate(withDuration: 5) {
//            self.blueView.center.y += 200
//            self.blueView.frame.size.height = 300
//        }
        
//        UIView.animateKeyframes(withDuration: 6, delay: 0, options: .calculationModeLinear, animations: {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
//                self.blueView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 1.3)
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
//                self.blueView.alpha = 0
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
//                self.blueView.transform = .identity
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
//                self.blueView.alpha = 1
//            })
//        }) { (success) in
//
//        }
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            self.blueView.transform = .identity
        }
        
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        
        animation.values = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.purple.cgColor]
        animation.duration = 6
        animation.repeatCount = 2
        blueView.layer.add(animation, forKey: "backgroundColor")
        
        CATransaction.commit()
        
    }
    
}

