//
//  EditProfileViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 28/8/23.
//

import Foundation
import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    
    func updateUserData() async throws {
        try await uploadProfileImage()
    }
    
    private func uploadProfileImage() async throws {
        guard let image = self.selectedImage else {
            return
        }
        
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else {
            return
        }
        
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
}
