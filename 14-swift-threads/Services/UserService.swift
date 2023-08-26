//
//  UserService.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 26/8/23.
//

import Firebase

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
}
