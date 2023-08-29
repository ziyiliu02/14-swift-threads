//
//  ImageUploader.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 29/8/23.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        
        let filename = NSUUID().uuidString
        
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("Error")
            return nil 
        }
    }
    
}
