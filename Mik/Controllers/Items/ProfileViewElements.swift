//
//  ProfileViewElements.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

public class ProfileViewElements {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    public static let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.masksToBounds =  true
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
}
