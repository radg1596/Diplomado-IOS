//
//  MenuItem.swift
//  Restaurante
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import Foundation

/*
 Estructuras que definen los items y sus características
 así como la manera en que se comportará para conformar el protocolo
 decodable
 */

struct MenuItem: Decodable {
    
    var id: Int
    var name: String
    var decription: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageURL = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: CodingKeys.id)
        self.name = try container.decode(String.self, forKey: CodingKeys.name)
        self.decription = try container.decode(String.self, forKey: CodingKeys.description)
        self.price = try container.decode(Double.self, forKey: CodingKeys.price)
        self.category = try container.decode(String.self, forKey: CodingKeys.category)
        self.imageURL = try container.decode(URL.self, forKey: CodingKeys.imageURL)
    }
    
}

/*
 Estructura que contiene "items"
 */

struct MenuItems: Decodable {
    let items: [MenuItem]
}
