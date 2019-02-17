//
//  RevealViewController.swift
//  interactive-transition-animations
//
//  Created by Rachel Unthank on 17/02/2019.
//  Copyright © 2019 rachelunthank. All rights reserved.
//

import UIKit

class RevealViewController: UIViewController, DismissController {

    var swipeInteractionController: SwipeInteractionController?
    var dismissTransitionDelegate: DismissTransitionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDismissalController()
    }
}
