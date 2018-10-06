//
//  CountryService.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

class CountryService {
    
    static let shared = CountryService()
    
    let client = Client(baseURLComponents: URLComponents(string: "https://worldb.herokuapp.com")!)
    
    func all(completion: @escaping ([Country]) -> Void)  {
        //Searching the data on phone storage
        if let sha1Name = UserDefaults.standard.value(forKey: "sha") as? String, let res = CodableStorage<[Country]>.permanent(filename: sha1Name).load() {
            print("Estoy leyendo de UserDefaults, usando el Sha1: \(sha1Name)")
            completion(res)
            return
        }

        //Data is not in phone :(
        //We will get it from the api
        client.get(path: "/api/countries") { (data) in
            guard let data = data, let string = String(data: data, encoding: .utf8) else {return}
            let sha1Name = Digests.sha1(string: string)
            UserDefaults.standard.set(sha1Name, forKey: "sha")
            if let result = try? JSONDecoder().decode([Country].self, from: data) {
                print("Estoy leyendo de la API, el sha1 es: \(sha1Name)")
                //Saving the data in phone
                CodableStorage<[Country]>.permanent(filename: sha1Name).saveData(data: result)
                DispatchQueue.main.async {completion(result)}
                return
            }
        }
    }
    
}
