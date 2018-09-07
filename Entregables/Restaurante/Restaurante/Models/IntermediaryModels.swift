//
//  IntermediaryModels.swift
//  Restaurante
//
//  Created by macbook on 17/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import Foundation

/*
 Modelos intermedios que nos servirán para conectar
 el servidor con los datos del programa
 */
struct Categories: Codable {
    let categories: [String]
}
struct PreparationTime: Decodable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
