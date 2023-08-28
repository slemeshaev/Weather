//
//  InteractiveTransition.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 28.08.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class InteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Properties
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handleScreenEdgeGesture(_:))
            )
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    
    private var shouldFinish: Bool = false
    
    // MARK: - Actions
    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer){
        switch recognizer.state {
            case .began:
                hasStarted = true
                viewController?.navigationController?.popViewController(animated: true)
            case .changed:
                let translation = recognizer.translation(in: recognizer.view)
                let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
                let progress = max(0, min(1, relativeTranslation))
                shouldFinish = progress > 0.33
                update(progress)
            case .ended:
                hasStarted = false
                shouldFinish ? finish() : cancel()
            case .cancelled:
                hasStarted = false
                cancel()
            default:
                return
        }
    }
}
