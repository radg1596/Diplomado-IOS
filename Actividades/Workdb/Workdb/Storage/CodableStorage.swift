//
//  CodableStorage.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

enum CodableStorage<T> where T: Codable {
    case permanent (filename: String)
    case cache
    
    var filePath: URL?{
        switch self {
        case .permanent(filename: let filename):
            StorageType.permanent.ensureExists()
            var filePath = StorageType.permanent.folder
            filePath.appendPathComponent(filename)
            return filePath
        default:
            print("Unaviable storage")
            return nil
        }
    }
    
    func load() -> T? {
        switch self {
        case .permanent(_):
            if let data = try? Data(contentsOf: self.filePath!) {
                return try? JSONDecoder().decode(T.self, from: data)
            }
        default:
            print("Unaviable")
        }
        return nil
    }
    
    func saveData(data dataSource: T) {
        switch self {
        case .permanent(_):
            if let data = try? JSONEncoder().encode(dataSource) {
                try? data.write(to: self.filePath!)
            }
        default:
            print("Unavailable storage")
        }
    }
    
}
