//
//  ProfileThreadFilter.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 23/8/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
