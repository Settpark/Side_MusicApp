//
//  AuthorizationResponseDTO.swift
//  MusicAppClone
//
//  Created by temp_name on 9/4/24.
//

import Foundation


struct AuthorizationResponseDTO: Decodable {
    var access_token: String
    var token_type: String
    var expires_in: Int
    
    init(
        access_token: String,
        token_type: String,
        expires_in: Int) {
        self.access_token = access_token
        self.token_type = token_type
        self.expires_in = expires_in
    }
}
