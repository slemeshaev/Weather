//
//  NavigationPopAnimator.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 27.08.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

final class NavigationPopAnimator: NSObject {
}

// MARK: - UIViewControllerAnimatedTransitioning
extension NavigationPopAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame
        
        let translation = CGAffineTransform(translationX: -200, y: 0)
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        destination.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .calculationModePaced,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.4,
                    animations: {
                        let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                        let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        source.view.transform = translation.concatenating(scale)
                    })
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.4,
                    relativeDuration: 0.4,
                    animations: {
                        source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
                    })
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.6,
                    relativeDuration: 0.4,
                    animations: {
                        destination.view.transform = .identity
                    })
            }) { finished in
                let isFinished = finished && !transitionContext.transitionWasCancelled
                
                if isFinished {
                    source.removeFromParent()
                } else if transitionContext.transitionWasCancelled {
                    destination.view.transform = .identity
                }
                
                transitionContext.completeTransition(isFinished)
            }
    }
}
