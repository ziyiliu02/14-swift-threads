//
//  ContentViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 23/8/23.
//

import Firebase
import FirebaseAuth
import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // this removes session locally and updates routing 
    }
    
}
