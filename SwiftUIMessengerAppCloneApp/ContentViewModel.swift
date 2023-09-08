//
//  ContentViewModel.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 05/09/2023.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables  = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private  func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self ] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }  .store(in: &cancellables)
        
        
    }
}