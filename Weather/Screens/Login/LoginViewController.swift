//
//  LoginViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 01.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - IBActions
    @IBAction private func signInButtonTapped(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction private func signUpButtonTapped(_ sender: UIButton) {
        print(#function)
    }
    
    // MARK: - Private
    private func configureUI() {
        contentView.backgroundColor = UIColor(named: "w.background.color")
        
        logoImageView.image = UIImage(named: "weather_logo")
        
        titleLabel.text = "Weather"
        titleLabel.textColor = UIColor(named: "w.title.color")
        
        usernameTextField.placeholder = "Username"
        usernameTextField.textContentType = .username
        
        passwordTextField.placeholder = "Password"
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        let signInAttributedTitle = NSAttributedString(
            string: "Sign In",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                         NSAttributedString.Key.foregroundColor: UIColor(named: "w.title.color")!])
        signInButton.setAttributedTitle(signInAttributedTitle, for: .normal)
        signInButton.layer.cornerRadius = 10.0
        signInButton.backgroundColor = UIColor(named: "w.button.color")
        
        let signUpAttributedTitle = NSMutableAttributedString(
            string: "Don’t have an account? ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "w.subtitle.color")!])
        signUpAttributedTitle.append(NSAttributedString(string: "Sign up", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "w.title.color")!]))
        signUpButton.setAttributedTitle(signUpAttributedTitle, for: .normal)
    }
}
