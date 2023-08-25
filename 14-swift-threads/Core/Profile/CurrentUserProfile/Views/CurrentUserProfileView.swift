//
//  CurrentUserProfileView.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 25/8/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if let user = viewModel.currentUser {
                    // buttons + content list view
                    VStack(spacing: 20) {
                        
                        ProfileHeaderView(user: user)
                        
                        Button {
                            
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(width: 352, height: 32)
                                .background(.white)
                                .cornerRadius(8)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                }
                        }
                        
                        UserContentListView()

                    }
                } else {
                    Text("Loading Profile..")
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        viewModel.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .foregroundColor(.black)
            .padding(.horizontal)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
            .environmentObject(AuthViewModel())
    }
}
