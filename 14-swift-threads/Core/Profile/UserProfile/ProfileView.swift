//
//  ProfileView.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 22/8/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User

    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if let user = viewModel.currentUser {
                // buttons + content list view
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: user)
                    
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    UserContentListView(user: user)

                }
            } else {
                Text("Loading Profile..")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
            .environmentObject(AuthViewModel())
    }
}
