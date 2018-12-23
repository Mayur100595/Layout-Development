//
//  ViewController.swift
//  Layout Development
//
//  Created by Mayur Patel on 24/12/18.
//  Copyright © 2018 Mayur Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view_statusBar:UIView?
    @IBOutlet weak var const_StatusBarHeight:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let statusbarHeight = UIApplication.shared.statusBarFrame.size.height
        const_StatusBarHeight?.constant = statusbarHeight
    }
}

