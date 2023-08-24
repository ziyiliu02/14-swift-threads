//
//  _4_swift_threadsApp.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 22/8/23.
//

import FirebaseCore
import SwiftUI

@main
struct _4_swift_threadsApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
