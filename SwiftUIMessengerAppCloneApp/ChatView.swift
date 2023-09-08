//
//  ChatView.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 04/09/2023.
//

import SwiftUI


struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init (user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 4) {
                    CircularProfileImageView(user: user, size: .large)
                    VStack {
                        Text(user.fullName)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Message")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    
                }
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        ChatMessageCell(message: message)
                        
                    }
                }
            }
          
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("write a message", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
