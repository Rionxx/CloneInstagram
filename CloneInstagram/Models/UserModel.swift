//
//  UserModel.swift
//  CloneInstagram
//
//  Created by FX on 2021/09/08.
//

import Foundation

struct User: Encodable, Decodable {
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var searchName: [String]
    var bio: String
    
    
}
