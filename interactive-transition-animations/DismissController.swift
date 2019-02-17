//
//  DismissController.swift
//  interactive-transition-animations
//
//  Created by Rachel Unthank on 17/02/2019.
//  Copyright © 2019 rachelunthank. All rights reserved.
//

import Foundation
import UIKit

public protocol DismissController: class {

    var swipeInteractionController: SwipeInteractionController? { get set }
    var dismissTransitionDelegate: DismissTransitionDelegate? { get set }

    func setUpDismissalController()

}

extension DismissController where Self: UIViewController {

    public func setUpDismissalController() {
        dismissTransitionDelegate = DismissTransitionDelegate()

        if let transitionDelegate = dismissTransitionDelegate {
            transitioningDelegate = transitionDelegate

        }
        swipeInteractionController = SwipeInteractionController(viewController: self)
    }
}
