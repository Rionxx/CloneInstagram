//
//  StorageService.swift
//  CloneInstagram
//
//  Created by FX on 2021/09/08.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class StorageService {
    static var storage = Storage.storage()
    
    static var storageRoot = storage.reference(forURL: "gs://cloneinstagram-4bd37.appspot.com")
    
    static var storageProfile = storageRoot.child("profile")
    
    static func storageProfiledImage(userId: String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    static func saveProfileImage(userId: String, username: String, email: String, imageData: Data, metaData: StorageMetadata, storageProfileRef: StorageReference, onSuccess: @escaping(_ user: User) ->Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        storageProfileRef.putData(imageData, metadata: metaData) { (StorageMetadata, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            storageProfileRef.downloadURL { (url, error) in
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                    }
                }
            }
        }
        
    }
}
