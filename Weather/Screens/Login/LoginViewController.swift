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
    func loginViewControllerSignUpTapped()
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
    
    // MARK: - Properties
    weak var delegate: LoginViewControllerDelegate?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        animateUI()
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
        if isValidateCredentials() {
            delegate?.loginViewControllerSignInTapped()
        } else {
            failureAlertMessage()
        }
    }
    
    @IBAction private func signUpButtonTapped(_ sender: UIButton) {
        delegate?.loginViewControllerSignUpTapped()
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
    
    private func isValidateCredentials() -> Bool {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {
            return false
        }
        
        if username == "admin" && password == "123" {
            return true
        }
        
        return false
    }
    
    private func failureAlertMessage() {
        let alertController = UIAlertController(title: "Login.Failure.Title".localized,
                                                message: "Login.Failure.Message".localized,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Login.Failure.Cancel".localized, style: .cancel)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func configureUI() {
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        logoImageView.image = UIImage(named: "weather_logo")
        
        titleLabel.text = "Login.LogoTitle".localized
        titleLabel.textColor = Color.ContentPrimary.Text.title
        
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Login.Username.Placeholder".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Color.ContentPrimary.Text.subtitle]
        )
        
        usernameTextField.textContentType = .username
        usernameTextField.backgroundColor = Color.ContentPrimary.placeholder
        usernameTextField.textColor = Color.ContentPrimary.Text.text
        usernameTextField.layer.cornerRadius = 10.0
        
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Login.Password.Placeholder".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Color.ContentPrimary.Text.subtitle]
        )
        
        passwordTextField.textContentType = .password
        passwordTextField.backgroundColor = Color.ContentPrimary.placeholder
        passwordTextField.textColor = Color.ContentPrimary.Text.text
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.isSecureTextEntry = true
        
        let signInAttributedTitle = NSAttributedString(
            string: "Login.SignIn".localized,
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                         NSAttributedString.Key.foregroundColor: Color.ContentPrimary.Text.title])
        signInButton.setAttributedTitle(signInAttributedTitle, for: .normal)
        signInButton.layer.cornerRadius = 10.0
        signInButton.backgroundColor = Color.ContentPrimary.button
        
        let signUpAttributedTitle = NSMutableAttributedString(
            string: "Login.NoAccount".localized,
            attributes: [NSAttributedString.Key.foregroundColor: Color.ContentPrimary.Text.subtitle])
        signUpAttributedTitle.append(NSAttributedString(string: "Login.SignUp".localized, attributes: [NSAttributedString.Key.foregroundColor: Color.ContentPrimary.Text.title]))
        signUpButton.setAttributedTitle(signUpAttributedTitle, for: .normal)
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    private func animateUI() {
        let offsetY = view.bounds.height
        let transformY = CGAffineTransform(translationX: 0, y: offsetY)
        
        usernameTextField.transform = transformY
        passwordTextField.transform = transformY
        signInButton.transform = transformY
        signUpButton.transform = transformY
        
        UIView.animate(
            withDuration: 1,
            delay: 1,
            options: .curveEaseOut,
            animations: {
                self.usernameTextField.transform = .identity
                self.passwordTextField.transform = .identity
                self.signInButton.transform = .identity
                self.signUpButton.transform = .identity
            },
            completion: nil
        )
        
        let offsetX = view.bounds.width
        logoImageView.transform = CGAffineTransform(translationX: -offsetX, y: 0)
        titleLabel.transform = CGAffineTransform(translationX: offsetX, y: 0)
        
        UIView.animate(
            withDuration: 1,
            delay: 1,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: .curveEaseOut,
            animations: {
                self.logoImageView.transform = .identity
                self.titleLabel.transform = .identity
            },
            completion: nil
        )
        
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 1
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        usernameTextField.layer.add(fadeInAnimation, forKey: nil)
        passwordTextField.layer.add(fadeInAnimation, forKey: nil)
        
        let transformAnimation = CASpringAnimation(keyPath: "transform.scale")
        transformAnimation.fromValue = 0
        transformAnimation.toValue = 1
        transformAnimation.stiffness = 200
        transformAnimation.mass = 2
        transformAnimation.duration = 2
        transformAnimation.beginTime = CACurrentMediaTime() + 1
        transformAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        signInButton.layer.add(transformAnimation, forKey: nil)
        signUpButton.layer.add(transformAnimation, forKey: nil)
    }
}
