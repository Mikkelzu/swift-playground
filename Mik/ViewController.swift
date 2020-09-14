//
//  ViewController.swift
//  Mik
//
//  Created by Michael on 13/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        LoginViewElements.usernameField.delegate = self
        LoginViewElements.passwordField.delegate = self
        
        LoginViewElements.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        LoginViewElements.registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        LoginViewElements.privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
        
        LoginViewElements.termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        
        // tap to dismiss kb
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        view.addGestureRecognizer(tap)
        
        initSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // frames
        LoginViewElements.headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height  / 3.0
        )
        
        LoginViewElements.usernameField.frame = CGRect(
            x: 25,
            y: LoginViewElements.headerView.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginViewElements.passwordField.frame = CGRect(
            x: 25,
            y: LoginViewElements.usernameField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginViewElements.loginButton.frame = CGRect(
            x: 25,
            y: LoginViewElements.passwordField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginViewElements.registerButton.frame = CGRect(
            x: 25,
            y: LoginViewElements.loginButton.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginViewElements.termsButton.frame = CGRect(
            x: view.left - 100,
            y: view.bottom - 75,
            width: view.width - 10,
            height: 50.0
        )
        
        LoginViewElements.privacyButton.frame = CGRect(
            x: view.left + 100,
            y: view.bottom - 75,
            width: view.width - 10,
            height: 50.0
        )
        
        LoginViewElements.headerLabel.frame = CGRect(
            x: 25,
            y: 25,
            width: view.width - 50,
            height: 50
        )
        
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard LoginViewElements.headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = LoginViewElements.headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = LoginViewElements.headerView.bounds
    }
    
    
    private func initSubViews() {
        /*
         Text fields
         */
        view.addSubview(LoginViewElements.usernameField)
        view.addSubview(LoginViewElements.passwordField)
        
        /*
         Buttons
         */
        view.addSubview(LoginViewElements.loginButton)
        view.addSubview(LoginViewElements.registerButton)
        view.addSubview(LoginViewElements.termsButton)
        view.addSubview(LoginViewElements.privacyButton)
        
        /*
         Header props
         */
        view.addSubview(LoginViewElements.headerView)
        LoginViewElements.headerView.addSubview(LoginViewElements.headerLabel)
    }
    
    
    /*
     objc methods
     */
    @objc private func didTapLogin() {
        LoginViewElements.usernameField.resignFirstResponder()
        LoginViewElements.passwordField.resignFirstResponder()
        
        guard let username = LoginViewElements.usernameField.text, !username.isEmpty,
            let password  = LoginViewElements.passwordField.text, !password.isEmpty, password.count >= 8 else {
                return
        }
        
        // login method funcationality
        
        // Helpers.toBeImplementedAlert(vc: self)
        
        print(AuthManager.shared.loginUser(username: username, password: password))
    }
    
    @objc private func didTapRegister() {
        Helpers.toBeImplementedAlert(vc: self)
    }
    
    @objc private func didTapPrivacy() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        
        present(vc, animated: true )
    }
    
    @objc private func didTapTerms() {
        guard let url = URL(string: "https://help.instagram.com/478745558852511") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        
        present(vc, animated: true )
    }
}

/*
 TextField extension to login
 */
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == LoginViewElements.usernameField {
            LoginViewElements.passwordField.becomeFirstResponder()
        } else if textField == LoginViewElements.passwordField {
            didTapLogin()
        }
        
        return true
    }
}
