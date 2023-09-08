//
//  AuthService.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 05/09/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("\(String(describing: userSession?.uid))")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch  {
            print("\(error.localizedDescription)")
        }
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(withEmail: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        } catch  {
            print("\(error.localizedDescription)")
        }
    }
    
    
    func signOut() {
        do  {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    
    private func uploadUserData(withEmail email: String, fullname: String, id: String  ) async throws {
        let user = User(fullName: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    private func loadCurrentUserData() {
        Task {
            try await UserService.shared.fetchCurrentUser()
        }
    }
}
