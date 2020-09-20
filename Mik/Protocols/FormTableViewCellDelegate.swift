//
//  FormTableViewCellDelegate.swift
//  Mik
//
//  Created by Michael on 21/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel)
}
