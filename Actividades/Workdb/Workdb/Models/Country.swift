//
//  Country.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

struct Country: Codable {
    
    let id: Int
    let name: String
    let iso: String
    let languages: [String]
    
}
