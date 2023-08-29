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
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Properties
    let navigationController: NavigationController
    
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
    
    func loginViewControllerSignUpTapped() {
        let signUpViewController = SignUpViewController.loadFromStoryboard()
        
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}

// MARK: - CityListViewControllerDelegate
extension NavigationRouter: CityListViewControllerDelegate {
    func cityListViewControllerAddCityTapped() {
        let addCityViewController = AddCityViewController.loadFromStoryboard()
        addCityViewController.delegate = self
        
        navigationController.pushViewController(addCityViewController, animated: true)
    }
    
    func cityListViewControllerForecastFor(city: City) {
        let forecastViewController = ForecastViewController.loadFromStoryboard()
        forecastViewController.city = city
        
        navigationController.pushViewController(forecastViewController, animated: true)
    }
    
    func cityListViewControllerLogOutTapped() {
        navigationController.popToRootViewController(animated: true)
    }
}

// MARK: - AddCityViewControllerDelegate
extension NavigationRouter: AddCityViewControllerDelegate {
    func addCityViewControllerDidSelect(_ city: City) {
        navigationController.popViewController(animated: true)
        
        if let cityListViewController = navigationController.viewControllers.last as? CityListViewController {
            cityListViewController.updateTable(with: city)
        }
    }
}
