//
//  CreateThreadView.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 22/8/23.
//

import SwiftUI

struct CreateThreadView: View {
    
    @State private var caption = ""
    @StateObject var viewModel = CreateThreadViewModel()
    @EnvironmentObject var AuthViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView()
                    
                    if let user = AuthViewModel.currentUser {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.username)
                                .fontWeight(.semibold)
                            
                            TextField("Start a thread", text: $caption, axis: .vertical)
                        }
                        .font(.footnote)
                    }
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        viewModel.uploadThread(caption: caption)
                        dismiss()
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct CreateThreadView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadView()
            .environmentObject(AuthViewModel())
    }
}
