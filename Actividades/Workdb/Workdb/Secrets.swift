//
//  Secrets.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation
import SAMKeychain

enum Secrets {
    
    static let apiService = "com.herokuapp.worldb"
    case auToken
    case userToken (key: String)
    
    var value: String? {
        switch self {
        case .auToken:
            return SAMKeychain.password(forService: Secrets.apiService, account: "api")
        case .userToken(key: let key):
            return SAMKeychain.password(forService: Secrets.apiService, account: key)

        }
    }
    
    func set(_ value: String) -> Bool {
        switch self {
        case .auToken:
            return SAMKeychain.setPassword(value, forService: Secrets.apiService, account: "api")
        case .userToken(key: let key):
            return SAMKeychain.setPassword(value, forService: Secrets.apiService, account: key)
        }
    }
    
    func delete() -> Bool {
        switch self {
        case .auToken:
            return SAMKeychain.deletePassword(forService: Secrets.apiService, account: "api")
        case .userToken(key: let key):
            return SAMKeychain.deletePassword(forService: Secrets.apiService, account: key)
        }
    }
}
