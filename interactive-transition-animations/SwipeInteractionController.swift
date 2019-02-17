//
//  SwipeInteractionController.swift
//  interactive-transition-animations
//
//  Created by Rachel Unthank on 17/02/2019.
//  Copyright © 2019 rachelunthank. All rights reserved.
//

import Foundation
import UIKit

public class SwipeInteractionController: UIPercentDrivenInteractiveTransition {

    var interactionInProgress = false

    private var shouldCompleteTransition = false
    private weak var viewController: UIViewController!

    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
        prepareGestureRecognizer(in: viewController.view)
    }

    private func prepareGestureRecognizer(in view: UIView) {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {

        let translation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview!)
        let verticalMovement = translation.y / gestureRecognizer.view!.superview!.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)

        switch gestureRecognizer.state {
        case .began:
            interactionInProgress = true
            viewController.dismiss(animated: true, completion: nil)
        case .changed:
            shouldCompleteTransition = progress > 0.45
            update(progress)
        case .cancelled:
            interactionInProgress = false
            cancel()
        case .ended:
            interactionInProgress = false
            shouldCompleteTransition ? finish(): cancel()
        default:
            break
        }
    }
}
