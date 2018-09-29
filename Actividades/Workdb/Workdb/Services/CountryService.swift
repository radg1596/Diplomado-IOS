//
//  CountryService.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation

class CountryService {
    let client = Client(baseURLComponents: URLComponents(string: "https://worldb.herokuapp.com")!)
    
    func all(completion: @escaping ([Country]) -> Void)  {
        client.get(path: "/api/countries") { (data) in
            guard let data = data else {return}
            if let result = try? JSONDecoder().decode([Country].self, from: data) {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
    }
}
