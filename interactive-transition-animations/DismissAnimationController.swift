//
//  DismissAnimationController.swift
//  interactive-transition-animations
//
//  Created by Rachel Unthank on 17/02/2019.
//  Copyright © 2019 rachelunthank. All rights reserved.
//

import Foundation
import UIKit

class DismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let interactionController: SwipeInteractionController?

    init(interactionController: SwipeInteractionController?) {
        self.interactionController = interactionController
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let snapshot = fromVC.view.snapshotView(afterScreenUpdates: false)
            else {
                return
        }

        let containerView = transitionContext.containerView
        containerView.insertSubview(toVC.view, at: 0)
        containerView.addSubview(snapshot)
        fromVC.view.isHidden = true

        let duration = transitionDuration(using: transitionContext)

        let screenBounds = UIScreen.main.bounds
        let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
        let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)

        UIView.animate(withDuration: duration,
                       animations: {
                        snapshot.frame = finalFrame
        },
                       completion: { _ in
                        fromVC.view.isHidden = false
                        snapshot.removeFromSuperview()
                        if transitionContext.transitionWasCancelled {
                            toVC.view.removeFromSuperview()
                        }
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
}
