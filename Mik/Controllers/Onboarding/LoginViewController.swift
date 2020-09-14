//
//  ViewController.swift
//  Mik
//
//  Created by Michael on 13/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        LoginRegisterViewElements.usernameField.delegate = self
        LoginRegisterViewElements.passwordField.delegate = self
        
        LoginRegisterViewElements.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        LoginRegisterViewElements.registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        LoginRegisterViewElements.privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
        
        LoginRegisterViewElements.termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        
        // tap to dismiss kb
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        view.addGestureRecognizer(tap)
        
        initSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // frames
        LoginRegisterViewElements.headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height  / 3.0
        )
        
        LoginRegisterViewElements.usernameField.frame = CGRect(
            x: 25,
            y: LoginRegisterViewElements.headerView.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginRegisterViewElements.passwordField.frame = CGRect(
            x: 25,
            y: LoginRegisterViewElements.usernameField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginRegisterViewElements.loginButton.frame = CGRect(
            x: 25,
            y: LoginRegisterViewElements.passwordField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginRegisterViewElements.registerButton.frame = CGRect(
            x: 25,
            y: LoginRegisterViewElements.loginButton.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        LoginRegisterViewElements.termsButton.frame = CGRect(
            x: view.left - 100,
            y: view.bottom - 75,
            width: view.width - 10,
            height: 50.0
        )
        
        LoginRegisterViewElements.privacyButton.frame = CGRect(
            x: view.left + 100,
            y: view.bottom - 75,
            width: view.width - 10,
            height: 50.0
        )
        
        LoginRegisterViewElements.headerLabel.frame = CGRect(
            x: 25,
            y: 25,
            width: view.width - 50,
            height: 50
        )
        
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard LoginRegisterViewElements.headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = LoginRegisterViewElements.headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = LoginRegisterViewElements.headerView.bounds
    }
    
    
    private func initSubViews() {
        /*
         Text fields
         */
        view.addSubview(LoginRegisterViewElements.usernameField)
        view.addSubview(LoginRegisterViewElements.passwordField)
        
        /*
         Buttons
         */
        view.addSubview(LoginRegisterViewElements.loginButton)
        view.addSubview(LoginRegisterViewElements.registerButton)
        view.addSubview(LoginRegisterViewElements.termsButton)
        view.addSubview(LoginRegisterViewElements.privacyButton)
        
        /*
         Header props
         */
        view.addSubview(LoginRegisterViewElements.headerView)
        LoginRegisterViewElements.headerView.addSubview(LoginRegisterViewElements.headerLabel)
    }
    
    
    /*
     objc methods
     */
    @objc private func didTapLogin() {
        LoginRegisterViewElements.usernameField.resignFirstResponder()
        LoginRegisterViewElements.passwordField.resignFirstResponder()
        
        guard let username = LoginRegisterViewElements.usernameField.text, !username.isEmpty,
            let password  = LoginRegisterViewElements.passwordField.text, !password.isEmpty, password.count >= 8 else {
                return
        }
        
        // login method funcationality
        
        // Helpers.toBeImplementedAlert(vc: self)
        AuthManager.shared.loginUser(username: username, password: password) {success in
            DispatchQueue.main.async {
                if success {
                    //user logged in
                    self.dismiss(animated: true, completion: nil)
                } else {
                    //error occured
                    let alert = UIAlertController(title: "Error log in", message: "Can't log in :)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @objc private func didTapRegister() {
        
        let vc = RegisterViewController()
        vc.title = "Sign up"
        present(UINavigationController(rootViewController: vc), animated: true)
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
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == LoginRegisterViewElements.usernameField {
            LoginRegisterViewElements.passwordField.becomeFirstResponder()
        } else if textField == LoginRegisterViewElements.passwordField {
            didTapLogin()
        }
        
        return true
    }
}
