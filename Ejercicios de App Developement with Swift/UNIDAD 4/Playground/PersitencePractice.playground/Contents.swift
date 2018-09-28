import UIKit

/*
 
/////Ejemplo de una sola nota
struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mutardm tomato, and pickles", timestamp: Date())

///Obteniendo el directorio
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

////Obteniendo el URL
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

///Codificando y guardando
let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNote)

try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

///Cargando y decodificando

let propertyListDecoder = PropertyListDecoder()

if let retrievedNoteData = try? Data(contentsOf: archiveURL),
    let decodeNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData){
    print(decodeNote)
}
 */


///Ejemplo de array de notas
struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote1 = Note(title: "Grocery run", text: "Pick up mayonnaise, mutardm tomato, and pickles", timestamp: Date())
let newNote2 = Note(title: "Eat", text: "I ate a pizza", timestamp: Date())
let newNote3 = Note(title: "Lunch", text: "I drinked milk", timestamp: Date())

let notes: [Note] = [newNote1, newNote2, newNote3]

///Diretorio (retorna un Array)
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let urlArchive = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

///Creando Encoder
let propertyListEncoder = PropertyListEncoder()
///Codificando nota
let encodedNotes = try? propertyListEncoder.encode(notes)

try? encodedNotes?.write(to: urlArchive, options: .noFileProtection)

///Decodificar y obtener datos

let propertyListDecoder = PropertyListDecoder()

if let retrievedNotes = try? Data(contentsOf: urlArchive), let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotes) {
    print (decodedNotes)
}

