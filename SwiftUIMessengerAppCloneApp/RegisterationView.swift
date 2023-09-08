//
//  RegisterationView.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 02/09/2023.
//

import SwiftUI

struct RegisterationView: View {
    @StateObject var viewModel = RegiterationViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
            VStack {
                Spacer()
                Image("messenger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                VStack {
                    TextField("Enter your name", text: $viewModel.fullname)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .padding(.horizontal, 24)
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .padding(.horizontal, 24)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .padding(.horizontal, 24)
                }
                Button {
                    Task {
                        try await viewModel.createUser()
                    }
                } label: {
                    Text("Sign up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                Spacer()
                
                Divider()
                
             Button {
                    dismiss()
                } label: {
                    HStack {
                        
                        
                        Text("You have an account?")
                        
                        Text("Sign in")
                            .fontWeight(.semibold)
                    }
                }
                .font(.footnote)
                .padding(.vertical)
                
                
            }
        }
    }


#Preview {
    RegisterationView()
}
