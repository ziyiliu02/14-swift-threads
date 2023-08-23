//
//  LoginViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 23/8/23.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
}
