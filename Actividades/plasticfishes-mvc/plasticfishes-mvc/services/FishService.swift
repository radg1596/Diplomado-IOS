//
//  FishService.swift
//  plasticfishes-mvc
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 14/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

struct FishService {
    static func list_all() -> [Fish] {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([Fish].self, from: DataSource().fishes)
        }
        catch {
            //Notify the user or a third party error catcher
            return []
        }
    }
}
