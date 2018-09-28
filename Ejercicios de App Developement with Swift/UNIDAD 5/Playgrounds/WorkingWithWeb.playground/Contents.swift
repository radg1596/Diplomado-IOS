import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

///Modelo de foto
struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder ) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

/*///Para hacer match en las llaves
struct Report: Codable {
    let creationDate: Date
    let profileID: String
    let readCount: Int
    
    enum codingKeys: String, CodingKey {
        case creationDate = "report_date"
        case profileID = "profile_id"
        case readCount = "read_count"
    }
}*/


///Extension
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//print (url.scheme!) // Protocolo
//print (url.host!) //Dominio

    

func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void ) {
    
    let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query = [
        "api_key": "DEMO_KEY",
        "date": "2011-07-13"
    ]
    let url = baseUrl.withQueries(query)!
    
    
    ///Creando la petición
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            completion(photoInfo)
        }
        else {
            print("No data has been returned or decoded")
            completion(nil)
        }
    }
    ///Enviando
    task.resume()

}

fetchPhotoInfo { (photoInfo) in
    if let photoInfo = photoInfo {
        print(photoInfo)
    }
}



