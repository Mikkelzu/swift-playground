//
//  Models.swift
//  Mik
//
//  Created by Michael on 17/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

enum Gender {
    case male, female
}

struct User {
    let username: String
    let userId: String
    let name: (first: String, last: String)
    let dateOfBirth: Date
    let gender: Gender
    let bio: String
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType {
    case photo, video
}

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

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}

struct PostLike {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}
