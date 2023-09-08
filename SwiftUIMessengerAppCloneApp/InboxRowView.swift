//
//  InboxRowView.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 03/09/2023.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: message.user, size: .medium)
            
            VStack(alignment: .leading){
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
                   }
          
             HStack {
                 Text(message.timestampString)
                        .foregroundColor(Color(.systemGray))
                    Image(systemName: "chevron.right")
                }
             .font(.footnote)
             .foregroundColor(.gray)
            
            }
        
        .frame(height: 72)
        
        
    }
}
//
//#Preview {
//    InboxRowView()
//}
