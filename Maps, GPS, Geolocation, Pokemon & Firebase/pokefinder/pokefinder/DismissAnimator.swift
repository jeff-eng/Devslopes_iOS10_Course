//
//  DismissAnimator.swift
//  pokefinder
//
//  Created by Jeffrey Eng on 3/9/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject {
    
}

extension DismissAnimator: UIViewControllerAnimatedTransitioning {
    // Specifies how long the animation is
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    // Specifies the actual animation implementation.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Represents the stage on which the animation plays.
        let containerView = transitionContext.containerView
        guard
            // Represents the modal view controller
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            // Represents the parent view controller that sits behind the modal.
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        // Inserts the parent view controller (toVC) behind the modal view controller
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        //Creating the animation
        // Get reference for the bounding rectangle of the screen
        let screenBounds = UIScreen.main.bounds
        // Create a CGPoint in the bottom left corner of the screen
        let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
        // Destination frame of the modal (sits one screen length below the viewable area)
        let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
        // Call method used to animate views. Pass in animation time length, move modal from starting frame to destination frame, and pass in a Boolean into completeTransition to indicate whether the transition finished or needs to be rolled back.
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {fromVC.view.frame  = finalFrame}, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
    

}
