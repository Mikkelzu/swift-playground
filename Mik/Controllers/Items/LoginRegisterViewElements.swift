//
//  LoginViewElements.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

public class LoginRegisterViewElements {
    
    struct Constants {
         static let cornerRadius: CGFloat = 8.0
     }
    
    public static let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textAlignment = .center
        return label
    }()
    
    public static let usernameField: UITextField = {
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
    
    public static let emailField: UITextField = {
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
    
    
    public static let passwordField: UITextField = {
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
    
    public static let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public static let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public static let loginLabelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap here to log in!", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    public static let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("New? Create an account!", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    public static let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        header.backgroundColor = .secondarySystemBackground
        return header
    }()
    
    
    public static let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    public static let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
}
