//
//  Session.swift
//  LabTunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 09/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation


//Esto es Singleton
class Session: NSObject {
    var token: String?
    static let sharedInstance = Session()
    
    //No se pueden crear instancias
    override private init() {
        super.init()
    }
    
    func saveSession() {
        token = "1234567890"
    }
}
