//
//  DismissTransitionDelegate.swift
//  interactive-transition-animations
//
//  Created by Rachel Unthank on 17/02/2019.
//  Copyright © 2019 rachelunthank. All rights reserved.
//

import Foundation
import UIKit

public class DismissTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let revealVC = dismissed as? DismissController else {
            return nil
        }
        return DismissAnimationController(interactionController: revealVC.swipeInteractionController)
    }

    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let animator = animator as? DismissAnimationController,
            let interactionController = animator.interactionController,
            interactionController.interactionInProgress
            else {
                return nil
        }
        return interactionController
    }
}
