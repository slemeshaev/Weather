//
//  UIViewController+Internal.swift
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
    
    func configureNavigationBarWithTitle(_ title: String) {
        navigationController?.navigationBar.isHidden = false
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.ContentPrimary.Text.text]
        navigationBarAppearance.backgroundColor = UIColor.white
        
        navigationItem.title = title
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true
    }
}
