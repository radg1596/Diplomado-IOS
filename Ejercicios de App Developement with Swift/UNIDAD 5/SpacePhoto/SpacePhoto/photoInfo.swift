//
//  photoInfo.swift
//  SpacePhoto
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    
    enum Keys: String, CodingKey {
        case title
        case description = "explanation"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:
            Keys.self)
        self.title = try valueContainer.decode(String.self, forKey: Keys.title)
        self.description = try valueContainer.decode(String.self, forKey: Keys.description)
        self.url = try valueContainer.decode(URL.self, forKey: Keys.url)
    }
}
