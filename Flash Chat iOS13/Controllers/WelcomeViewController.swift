//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let titleText = "⚡️FlashChat"
//        titleLabel.text = ""
//        var charIndex = 0
//        for char in titleText{
//            Timer.scheduledTimer(withTimeInterval: 0.2 * Double(charIndex), repeats: false) { _ in
//                self.titleLabel.text?.append(char)
//            }
//            charIndex += 1
//        }
   
        
// animation using cocoapods
        titleLabel.text = K.title
       
    }
    
    

}
