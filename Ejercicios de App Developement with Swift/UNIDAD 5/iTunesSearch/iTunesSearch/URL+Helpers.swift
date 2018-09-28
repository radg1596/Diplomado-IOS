//
//  URL+Helpers.swift
//  iTunesSearch
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

///URL Extensión para hacer consultas
extension URL {
    func withQueries (queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        components?.queryItems = queries.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        
        return components?.url
    }
}
