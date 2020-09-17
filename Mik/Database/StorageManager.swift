//
//  StorageManager.swift
//  Mik
//
//  Created by Michael on 14/09/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    
    public enum StorageManagerError: Error {
        case FailedToDownload
    }
    
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(reference: String, completion: @escaping (Result<URL, StorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: {url, error in
            guard let url = url, error == nil else {
                completion(.failure(.FailedToDownload))
                return
            }
            
            completion(.success(url))
        })
    }
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
