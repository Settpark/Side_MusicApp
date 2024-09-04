//
//  Service.swift
//  MusicAppClone
//
//  Created by temp_name on 9/3/24.
//

import Foundation

protocol ServicesType {
    var authorizationService: AuthorizationServiceType { get }
}

struct Services: ServicesType {
    
    var authorizationService: AuthorizationServiceType
    
    init() {
        authorizationService = AuthorizationService()
    }
}

struct StubServices: ServicesType {
    
    var authorizationService: AuthorizationServiceType
    
    init() {
        authorizationService = StubAuthorizationService()
    }
}
