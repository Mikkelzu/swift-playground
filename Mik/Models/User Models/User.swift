//
//  User.swift
//  Mik
//
//  Created by Michael on 20/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public struct User {
    let username: String
    let userId: String
    let name: (first: String, last: String)
    let dateOfBirth: Date
    let gender: Gender
    let bio: String
    let counts: UserCount
    let joinDate: Date
    let profilePic: URL
}

public enum Gender {
    case male, female
}
