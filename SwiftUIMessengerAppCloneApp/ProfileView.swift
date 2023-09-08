//
//  ProfileView.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 03/09/2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
@StateObject var viewModel = ProfileViewModel()
    var  user: User?
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ZStack(alignment:. bottomTrailing) {
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let profileImage = viewModel.profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }else {
                                CircularProfileImageView(user: user, size: .large)
                            }
                            
                        }
                        
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 18, height: 18)
                            
                            Circle()
                                .fill(.black)
                                .frame(width: 12, height: 12)
                            
                        }
                        
                    }
                    
                    Text(user?.fullName  ?? User.MOCK_USER.fullName )
                }
                .padding()
                
                List {
                    Section {
                        ForEach(SettingsOptionsViewModel.allCases) { option in
                            HStack {
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(option.imageBackgroundColor)
                                Text(option.title)
                                    .font(.subheadline)
                            }
                        }
                    }
                    Section {
                        Button("Log out") {
                            AuthService.shared.signOut()
                        }
                        Button("Create Account") {
                            
                        }
                    }
                    .foregroundStyle(.red)
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                  
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundStyle(Color(.systemBlue))
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
       ProfileView(user: User.MOCK_USER)
    }
      
  
    
}
