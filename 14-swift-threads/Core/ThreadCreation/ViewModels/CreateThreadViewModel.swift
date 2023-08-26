//
//  CreateThreadViewModel.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 26/8/23.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        
        guard let newThread = try? Firestore.Encoder().encode(thread) else {
            return 
        }
        
        let db = Firestore.firestore()
        
        db.collection("threads").addDocument(data: newThread)
    }
    
}
