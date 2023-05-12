//
//  UIViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 09.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromStoryboard() -> Self {
        let bundle = Bundle.main
        let identifier = String(describing: self)
        
        let storyboard = UIStoryboard(name: identifier, bundle: bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        
        return viewController as! Self
    }
}
