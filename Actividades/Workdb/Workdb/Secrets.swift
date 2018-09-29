//
//  Secrets.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

enum Secrets {
    
    static let apiService = "worldb.herokuapp.com"
    case auToken
    
    var value: String {
        switch self {
        case .auToken:
            return ""//SANKeychain.password(forService: Secretes. apiService, account: Secrets.apiService)
        }
    }
    
    func set(value: String) {
    }
}
