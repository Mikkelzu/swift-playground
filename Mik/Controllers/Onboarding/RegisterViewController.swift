//
//  RegisterViewController.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y:0 , width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.layer.masksToBounds =  true
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y:0 , width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.layer.masksToBounds =  true
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
    
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.returnKeyType = .continue
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y:0 , width: 10, height: 0))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.layer.masksToBounds =  true
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        // Do any additional setup after loading the view.
        initSubViews()
        
        
        // tap to dismiss kb
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width: view.width - 40, height: 52.0)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10, width: view.width - 40, height: 52.0)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width - 40, height: 52.0)
        signUpButton.frame = CGRect(x: 20, y: passwordField.bottom + 10, width: view.width - 40, height: 52.0)
        
    }
    
    private func initSubViews() {
        view.addSubview(emailField)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)
    }
    
    @objc private func didTapSignUp() {
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty, password.count >= 8,
            let username = usernameField.text, !username.isEmpty else {
                return
        }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
            DispatchQueue.main.async {
                if registered {
                    // good
                } else {
                    // bad
                }
            }
        }
        
    }
    
}


extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapSignUp()
        }
        return true
    }
}
