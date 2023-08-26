//
//  NavigationPushAnimator.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 26.08.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

final class NavigationPushAnimator: NSObject {
    //
}

// MARK: - UIViewControllerAnimatedTransitioning
extension NavigationPushAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        let frame = source.view.frame
        destination.view.frame = frame
        destination.view.transform = CGAffineTransform(translationX: frame.width, y: 0)
    }
}
