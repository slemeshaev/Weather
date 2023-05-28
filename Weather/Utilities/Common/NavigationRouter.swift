//
//  NavigationRouter.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 09.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class NavigationRouter {
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Properties
    let navigationController: UINavigationController
    
    // MARK: - Interface
    func start() {
        let loginViewController = LoginViewController.loadFromStoryboard()
        loginViewController.delegate = self
        
        navigationController.pushViewController(loginViewController, animated: false)
    }
}

// MARK: - LoginViewControllerDelegate
extension NavigationRouter: LoginViewControllerDelegate {
    func loginViewControllerSignInTapped() {
        let cityListViewController = CityListViewController.loadFromStoryboard()
        cityListViewController.delegate = self
        
        navigationController.pushViewController(cityListViewController, animated: true)
    }
}

// MARK: - CityListViewControllerDelegate
extension NavigationRouter: CityListViewControllerDelegate {
    func cityListViewControllerAddCityTapped() {
        let addCityViewController = AddCityViewController.loadFromStoryboard()
        navigationController.present(addCityViewController, animated: true)
    }
}
