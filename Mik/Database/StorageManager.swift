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


