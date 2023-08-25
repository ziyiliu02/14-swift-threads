//
//  User.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 24/8/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String? = nil
    var bio: String? = nil
}
