//
//  Constants.swift
//  SwiftUIMessengerAppCloneApp
//
//  Created by ipeerless on 07/09/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FirestoreConstants {
   static let UserCollection =  Firestore.firestore().collection("users")
  static  let MessagesCollection = Firestore.firestore().collection("messages")
    
    
}
