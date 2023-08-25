//
//  AuthViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 24/8/23.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User? 
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            fetchUser()
        }
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.uploadUserData(withEmail: email, fullname: fullname, username: username, id: userId)
        }
    }
    
    private func uploadUserData(withEmail email: String, fullname: String, username: String, id: String) {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        
        guard let userData = try? Firestore.Encoder().encode(user) else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(userData)
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // this removes session locally and updates routing
        self.currentUser = nil
    }
    
    func fetchUser() {
        guard let userId = self.userSession?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.currentUser = User(id: data["id"] as? String ?? "",
                                         fullname: data["fullname"] as? String ?? "",
                                         email: data["email"] as? String ?? "",
                                         username: data["username"] as? String ?? "")
            }
        }
    }
    
}
