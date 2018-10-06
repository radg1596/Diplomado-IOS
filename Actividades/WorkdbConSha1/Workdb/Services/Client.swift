//
//  Client.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.

import Foundation
typealias dataHandler = (Data?) -> Void

struct Client {
    
    let baseURLComponents: URLComponents
    
    
    func get(path: String, sucessHandler: dataHandler?) {
        request("GET", path: path, completionHandler: sucessHandler)
    }
    
    
    func request(_ method: String, path: String, completionHandler: dataHandler?) {
        var requestURLComponents = baseURLComponents
        requestURLComponents.path = path
        var request = URLRequest(url: requestURLComponents.url!)
        request.httpMethod = method
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {return}
            guard let httpResponse =  response as? HTTPURLResponse else {return}
            if httpResponse.statusCode == 200, let handler = completionHandler {
                //Se regresa a el proceso principal...
                DispatchQueue.main.async {
                    handler(data)
                }
            }
        }
        task.resume()
    }
    
}
