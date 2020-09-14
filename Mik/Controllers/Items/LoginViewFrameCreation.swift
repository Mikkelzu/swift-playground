//
//  LoginViewFrameCreation.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

public class LoginViewFrameCreation: UIView {
    
    public func createFrames() {
        
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
    }
}
