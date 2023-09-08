//
//  SwiftUIMessengerAppCloneAppApp.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 02/09/2023.
//
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SwiftUIMessengerAppCloneAppApp: App {
   
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
               ContentView()
            }
        }
    }
}
