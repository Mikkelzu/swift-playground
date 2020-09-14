//
//  StringExtensions.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

extension String {
     func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}
