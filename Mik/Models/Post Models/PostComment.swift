//
//  PostComment.swift
//  Mik
//
//  Created by Michael on 20/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import Foundation

public struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
