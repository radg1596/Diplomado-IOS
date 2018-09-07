//
//  MenuController.swift
//  Restaurante
//
//  Created by macbook on 17/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import Foundation
import UIKit

/*
 Controlador para los servicios web
 */

class MenuController {
    //URL base
    let baseURL = URL(string:"http://localhost:8090/")!
    //Como hay diversas funciones, esta variable da acceso a funciones compartidas
    static let shared = MenuController()
   
    /*
     Recibe un closure como parámetro
     Obtiene las categorías disponibles en el servidor, después las decodifica, y al final se las pasa al closure y después
        lo ejecuta
     */
    func fetchCategories( completion: @escaping([String]?) -> Void ) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        ///Creando petición
        let task = URLSession.shared.dataTask(with: categoryURL) { (data, response, error) in
            if let data = data, let jsonDic = try? JSONSerialization.jsonObject(with: data) as? [String:Any], let categories = jsonDic?["categories"] as? [String] {
                completion(categories)
            }
            else {
                print("No pudieron obtenerse las categorias")
                completion(nil)
            }
        }
        task.resume()
    }
    /*
     Recibe una categoría (String) y un closure como parámetros
     Agrega consultas a la URLbase, después obtiene los datos del
     servidor, los decodifica y al final se los envía al closure, para después ejecutarlo...
     */
    
    func fetchMenuItems(categoryName: String, completion: @escaping ([MenuItem]?) -> Void ) {
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        ///Creando petición
        let task = URLSession.shared.dataTask(with: menuURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data) {
                completion(menuItems.items)
            }
            else {
                print ("No se obtuvieron los items de menu")
                completion(nil)
            }
        }
        task.resume()
    }
    
    /*
     Recibe un arreglo de Items y un closure como parámetros
     Toma la utl base y después hace una peticion al servidor
     Obtiene el tiempo de preparación, se lo envía al closure y al final lo ejecuta
     */
    func submitOrder(menuIds: [Int], completion: @escaping (Int?) -> Void ) {
        print (menuIds)
        let orderURL = baseURL.appendingPathComponent("order")
        var resquest = URLRequest(url: orderURL)
        resquest.httpMethod = "POST"
        resquest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        ///Creando el JSON
        let data = [ "menuIds" : menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        resquest.httpBody = jsonData
        ///Creando petición
        let task = URLSession.shared.dataTask(with: resquest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data) {
                completion(preparationTime.prepTime)
            }
            else {
                print("No se pudo obtener el tiempo de preparación")
                completion(nil)
            }
        }
        task.resume()
    }
    
    /*
     Recibe el URL de una imagen y un closure como parámetro
     Obtiene la imagen del servidor y después se la envía al closure, para después ejecutarlo...
     */
    func fetchImage(imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let data = data,  let image = UIImage(data: data) {
                completion(image)
            }
            else {
                completion(nil)
                print("No se pudo obtener la imagen")
            }
        }
        task.resume()
    }
    
    
}
