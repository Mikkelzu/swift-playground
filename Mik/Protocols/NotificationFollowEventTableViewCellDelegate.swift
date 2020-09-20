//
//  NotificationFollowEventTableViewCellDelegate.swift
//  Mik
//
//  Created by Michael on 21/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public protocol NotificationFollowEventTableViewCellDelegate: AnyObject {
    func didTapFollowToggleButton(model: UserNotification)
}
