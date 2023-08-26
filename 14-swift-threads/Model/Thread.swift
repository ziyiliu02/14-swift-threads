//
//  Thread.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 26/8/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString 
    }
    
    var user: User? 
}
