//
//  InboxViewModel.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 06/09/2023.
//

import Foundation
import Combine
import Firebase


class  InboxViewModel: ObservableObject {
    @Published  var currentUser: User?
    @Published var recentMesages = [Message]()
    private let service = InboxService()
    
    private var cancellables  = Set<AnyCancellable>()
    init() {
        setSubscribers()
            service.observeRecentMessages()
    }
    private func setSubscribers() {
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
      service.$documentChange.sink { [weak self] changes in
            
        }
    }
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
        for i in 0 ..< messages.count {
            let message = messages[i]
            UserService.fetchUser(withUid: message.chatPartnerId) { user in
                messages[i].user = user
                self.recentMesages.append(messages[i])
            }
        }
    }
}

