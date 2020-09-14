//
//  AuthManager.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    public func loginUser(username: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
            guard authResult != nil, error == nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(email: email, username: username) { canCreate in
            if canCreate {
                // create and insert
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // cant create
                        completion(false)
                        return
                    }
                    
                    //insert
                    DatabaseManager.shared.insertNewUser(email: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                        } else {
                            completion(false)
                        }
                    }
                }
            } else {
                // username or email doesnt exist
                completion(false)
            }
        }
    }
    
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    public func handleNotAuthenticated(vc: UIViewController) {
        //check auth status
        if Auth.auth().currentUser == nil {
            // show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            vc.present(loginVC, animated: false)
        }
    }
}
