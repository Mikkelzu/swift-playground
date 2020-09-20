//
//  UserNotificationType.swift
//  Mik
//
//  Created by Michael on 21/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public enum UserNotificationType {
    case like(post: UserPost)
    case follow(state: UserFollowState)
}

