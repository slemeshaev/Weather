//
//  NavigationController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 27.08.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate
extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return NavigationPushAnimator()
        } else if operation == .pop {
            return NavigationPopAnimator()
        }
        
        return nil
    }
}
