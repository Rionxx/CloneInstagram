//
//  AuthService.swift
//  CloneInstagram
//
//  Created by FX on 2021/09/08.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthService {
    
    static var storeRoot = Firestore.firestore()
    
    static func getUserId(userId: String) -> DocumentReference {
        return storeRoot.collection("users").document(userId)
    }
    
    static func signUp(username: String, email: String, password: String, imageData: Data, onSuccess: @escaping (_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            
            let storageProfileUserId = StorageService.storageProfiled(userId: userId)
            let metadata = StorageMetadata()
            
            metadata.contentType = "image/jpg"
            StorageService.saveProfileImage(userId: userId, username: username, email: email, imageData: imageData, metaData: metadata, storageProfileRef: storageProfileUserId, onSuccess: onSuccess, onError: onError)
        }
    }
}
