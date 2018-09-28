//
//  photoInfoController.swift
//  SpacePhoto
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import Foundation
struct PhotoInfoController {
    
    func fetchPhotoInfo (completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query = [
            "api_key" : "JDADVD3oXrO5YQ3klQKRR58exDyhA9Co2g041Sun"
        ]
        let url = baseURL.withQueries(query)!
        
        let jsonDecoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data , let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
               // ,let st = String(data: data, encoding: .utf8)
                //{
                  //  print (st)
                completion(photoInfo)
            }
            else {
                print("No se pudieron obtener los datos PhotoInfo")
                completion(nil)
            }
        }
        task.resume()
    }

}
