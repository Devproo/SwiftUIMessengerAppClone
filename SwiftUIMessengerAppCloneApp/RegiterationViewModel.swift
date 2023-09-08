//
//  RegiterationViewModel.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 05/09/2023.
//

import SwiftUI

class RegiterationViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
