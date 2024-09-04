//
//  TokenStorage.swift
//  MusicAppClone
//
//  Created by temp_name on 9/3/24.
//

import Foundation

struct TokenStorage {
    static let shared: TokenStorage = TokenStorage()
    
    private init() { }
    
    func saveToKeychain(value: String, key: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                        kSecAttrAccount as String: key,
                                        kSecValueData as String: data]
            SecItemDelete(query as CFDictionary)
            let status = SecItemAdd(query as CFDictionary, nil)
            return status == errSecSuccess
        }
        return false
    }
    
    func loadFromKeychain(key: String) -> String? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecReturnData as String: kCFBooleanTrue as Any]
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == noErr {
            if let retrievedData = dataTypeRef as? Data {
                return String(data: retrievedData, encoding: .utf8)
            }
        }
        return nil
    }
    
    func deleteFromKeychain(key: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
