//
//  RegistrationViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 23/8/23.
//


import FirebaseAuth
import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    init() {}
    
    func register() {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            print("DEBUG: Created user \(userId)")
        }
        
    }
    
}
