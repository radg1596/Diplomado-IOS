//
//  User.swift
//  LabTunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 09/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

class User {
    
    static let useName = "iOSLab"
    static let password = "verysecurepassword"
    static let session = Session.sharedInstance
    static func login(userName: String, password: String) -> Bool {
        if self.useName == userName {
            session.saveSession()
            return true
        }
        else {
            return false
        }
    }
    
    static func fetchSongs() throws {
        guard let token = Session.sharedInstance.token else {
            throw UserError.notSessionAvailable
        }
        debugPrint(token)
    }
    
}




enum UserError: Error {
    case notSessionAvailable
}
