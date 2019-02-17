//
//  CardViewController.swift
//  interactive-transition-animations
//
//  Created by Rachel Unthank on 17/02/2019.
//  Copyright © 2019 rachelunthank. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handleTap() {
        let revealController = RevealViewController()
        present(revealController, animated: true)
    }
}

