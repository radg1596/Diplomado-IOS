//
//  toDo.swift
//  ToDoList
//
//  Created by macbook on 13/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    
    /*
    Se encarga de obtener el arreglo de "ToDos" de la memoria
    interna del iphone. Decodifica la información y retorna dicho arreglo.
    */
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    /*
     Recibe un arreglo de "ToDos"
     Códifica la información y la guarda en la memoria interna del iphone.
     */
    static func saveToDos (_ todos: [ToDo]) {
        let propertyLisEncode = PropertyListEncoder()
        let codedToDos = try? propertyLisEncode.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    /*
     Variable estática que nos indica el directorio donde se
     guardarán los datos
     */
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    /*
     Es la url donde estarán los datos almacenados en memoria
     (persistente)
     */
    static let archiveURL = ToDo.documentDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    /*
    ///DateFormater
     Sirve para formato a la fecha, es una propiedad estática
     */
    static let dueDateFormater: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    /*
     Se encarga de crear un arreglo de ejemplos de "ToDos"
     Retorna dicho arreglo
     */
    static func loadSampleToDos() -> [ToDo] {
        
        let todos = [
            ToDo(title: "Tarea 1", isComplete: false, dueDate: Date(), notes: "Notas 1"),
            ToDo(title: "Tarea 2", isComplete: false, dueDate: Date(), notes: "Notas 2"),
            ToDo(title: "Tarea 3", isComplete: false, dueDate: Date(), notes: "Nota 3")
        ]
        return todos
    }
    
}
