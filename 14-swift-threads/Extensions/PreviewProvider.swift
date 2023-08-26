//
//  PreviewProvider.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 25/8/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Lee Hsien Loong", email: "lhl@email.com", username: "leehsienloong")
    
    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
}
