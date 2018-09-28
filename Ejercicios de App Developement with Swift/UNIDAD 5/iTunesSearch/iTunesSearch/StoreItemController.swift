//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItemController {
    
    ///Escaping significa que el código se ejecutará después del retorno de la función
    func fetchItems(matching query: [String:String], completion: @escaping(StoreItems?) -> Void) {
        ///Creando el URL
        let urlBase = URL(string: "https://itunes.apple.com/search?")!
        guard let url = urlBase.withQueries(queries: query) else {
            print("No se pudo crear el URL")
            return
        }
        ////Haciendo la consulta
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let datosDeco = try? jsonDecoder.decode(StoreItems.self, from: data) {
                completion(datosDeco)
            }
            else {
                print("No se pudieron obtener los datos")
                completion(nil)
            }
        }
        task.resume()
    }
    
}
