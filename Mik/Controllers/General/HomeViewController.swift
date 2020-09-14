//
//  ViewController.swift
//  Mik
//
//  Created by Michael on 13/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AuthManager.shared.handleNotAuthenticated(vc: self)
    }
    
    
    
}
