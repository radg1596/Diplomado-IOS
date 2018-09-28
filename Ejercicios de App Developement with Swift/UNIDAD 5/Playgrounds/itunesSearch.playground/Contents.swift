import UIKit
import PlaygroundSupport

////Cuidado!!!, Los CodingKeys Deben coincidir exactamente o los datos no son obtenidos

PlaygroundPage.current.needsIndefiniteExecution = true
/////Estructura auxiliar para un arreglo de items
struct StoreItems: Decodable {
    let results: [StoreItem]
    let resultCount: Int
}

/////Estructura/Modelo
struct StoreItem: Decodable {
    var collection: String
    var artist: String
    var kind: String
    
    ///Sirve para el match entre mis variables y los nombres del servidor
    enum CodingKeys: String, CodingKey {
        case collection = "collectionName"
        case artist = "artistName"
        case kind = "kind"
    }
    ///Aquí se hace el match
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.collection = try values.decode(String.self, forKey: CodingKeys.collection)
        self.artist = try values.decode(String.self, forKey: CodingKeys.artist)
        self.kind = try values.decode(String.self, forKey: CodingKeys.kind)
        
    }
    
}

///URL Extensión para hacer consultas
extension URL {
    func withQueries (queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        components?.queryItems = queries.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        
        return components?.url
    }
}

///Consultas
let query =  [
    "term" : "Avalanch",
    "media" : "music"]

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
        if let data = data//, let datosDeco = try? jsonDecoder.decode(StoreItems.self, from: data) {
            , let con = String(data: data, encoding: .utf8) {
            //completion(datosDeco)
            print(con)
            PlaygroundPage.current.finishExecution()
        }
        else {
            print("No se pudieron obtener los datos")
            completion(nil)
            PlaygroundPage.current.finishExecution()
        }
    }
    task.resume()
}

////Llamando a la función, recibe una consulta y ejecuta el closure que recibe un objeto storeItems
fetchItems(matching: query) { (storeItems) in
    if let storeItems = storeItems {
        print(storeItems)
    }
}

/*

///URLBase
let urlBase = URL(string: "https://itunes.apple.com/search?")!

///URL
let url = urlBase.withQueries(queries: query)!

//Creando task
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    let jsonDecoder = JSONDecoder()
    if let data = data//, let string = String(data: data, encoding: .utf8) {
        , let Item = try? jsonDecoder.decode(StoreItems.self, from: data) {
        print(Item)
        PlaygroundPage.current.finishExecution()
    }
    else {print("Datos no obtenidos"); PlaygroundPage.current.finishExecution()}
}
task.resume()
 
 */


