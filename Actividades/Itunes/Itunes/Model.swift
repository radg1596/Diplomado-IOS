//
//  Model.swift
//  Itunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 01/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

struct Tracks: Codable {
    var artistName: String
    var trackName: String
    var artworkUrl100: String
}

struct Results: Codable {
    var resultCount: Int
    var results: [Tracks]
}
