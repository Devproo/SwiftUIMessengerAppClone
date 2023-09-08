//
//  Route.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 08/09/2023.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
