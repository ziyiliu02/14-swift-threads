//
//  ExploreViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 25/8/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task {
            fetchUsers()
        }
    }

    func fetchUsers() {
        
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.users = snapshot.documents.map { d in
                        return User(id: d.documentID,
                                    fullname: d["fullname"] as? String ?? "",
                                    email: d["email"] as? String ?? "",
                                    username: d["username"] as? String ?? "")
                    }
                }
            }
            
            self.users = self.users.filter { $0.id != currentUid }
            
        }
    }
    
}
