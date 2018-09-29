//
//  CodableStorage.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

enum CodableStorage {
    case persistent (filename: String)
    case cache
    
    func save(data: Codable) {
        switch self {
        case .persistent(let filename):
            //Guardar
            break
        default:
            print("Unavalaible Storage")
        }
    }
}
