//
//  ProfileInfoHeaderCollectionReusableViewDelegate.swift
//  Mik
//
//  Created by Michael on 21/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}
