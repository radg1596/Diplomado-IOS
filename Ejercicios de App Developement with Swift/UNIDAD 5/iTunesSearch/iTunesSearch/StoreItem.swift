//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation
/////Estructura auxiliar para un arreglo de items
struct StoreItems: Decodable {
    let results: [StoreItem]
    let resultCount: Int
}

/////Estructura/Modelo
struct StoreItem: Decodable {
    var collection: String
    var artist: String
    var track: String
    var trackViewUrl: URL
    
    ///Sirve para el match entre mis variables y los nombres del servidor
    enum CodingKeys: String, CodingKey {
        case collection = "collectionName"
        case artist = "artistName"
        case track = "trackName"
        case trackViewUrl = "artworkUrl100"
    }
    ///Aquí se hace el match
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.collection = try values.decode(String.self, forKey: CodingKeys.collection)
        self.artist = try values.decode(String.self, forKey: CodingKeys.artist)
        self.track = try values.decode(String.self, forKey: CodingKeys.track)
        self.trackViewUrl = try values.decode(URL.self, forKey: CodingKeys.trackViewUrl)
    }
    
}
