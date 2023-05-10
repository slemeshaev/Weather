//
//  LoginViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 01.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func loginViewControllerSignInTapped()
}

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
    
    weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        removeObservers()
    }
    
    // MARK: - IBActions
    @IBAction private func signInButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if username == "admin" && password == "123" {
            delegate?.loginViewControllerSignInTapped()
        } else {
            failureAlertMessage()
        }
    }
    
    @IBAction private func signUpButtonTapped(_ sender: UIButton) {
        print(#function)
    }
    
    // MARK: - Actions
    @objc private func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    // MARK: - Private
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func successAlertMessage(_ username: String) {
        let alertController = UIAlertController(title: "Welcome \(username)",
                                                message: "You have successfully entered!",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    private func failureAlertMessage() {
        let alertController = UIAlertController(title: "Try that again",
                                                message: "Your credentials are incorrect!",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func configureUI() {
        contentView.backgroundColor = UIColor(named: "w.background.color")
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
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
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
}
