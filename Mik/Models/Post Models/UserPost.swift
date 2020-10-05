//
//  UserPost.swift
//  Mik
//
//  Created by Michael on 20/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let postUrl: URL // either video or full resolution photo
    let createdDate: Date
    let taggedUsers: [String]
}
