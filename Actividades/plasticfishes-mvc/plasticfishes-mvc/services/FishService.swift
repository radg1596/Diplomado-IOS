//
//  FishService.swift
//  plasticfishes-mvc
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 14/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

struct FishService {
    static let shared = FishService()
    
    let client = Client(baseURLComponents: URLComponents(string:"https://plasticfishes.herokuapp.com/")!)
    let jsonDecoder = JSONDecoder()
    
    func all() -> [Fish] {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([Fish].self, from: DataSource().fishes)
        }
        catch {
            //Notify the user or a third party error catcher
            return []
        }
    }
    
    func all(_ completion: @escaping ([Fish]) -> Void) {
        client.get(path: "/api/fishes") { (data) in
            guard let jsonData = data else { return }
            let result = try? self.jsonDecoder.decode([Fish].self, from: jsonData)
            completion(result ?? [Fish]())
        }
    }
}
