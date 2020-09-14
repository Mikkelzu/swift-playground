//
//  Helpers.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

public class Helpers {
    
    struct UIConstants {
        static let cornerRadius = 8.0
    }
    
    public static func toBeImplementedAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "TBI", message: "To be implemented!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
