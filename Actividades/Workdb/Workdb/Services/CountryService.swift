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
        if let res = CodableStorage<[Country]>.permanent(filename: "countries.json").load() {
            completion(res)
        }
        //Data is not in phone :(
        //We will get it from the api
        client.get(path: "/api/countries") { (data) in
            guard let data = data else {return}
            if let result = try? JSONDecoder().decode([Country].self, from: data) {
                //Saving the data in phone
                CodableStorage<[Country]>.permanent(filename: "countries.json").saveData(data: result)
                DispatchQueue.main.async {completion(result)}
            }
        }
    }
}
