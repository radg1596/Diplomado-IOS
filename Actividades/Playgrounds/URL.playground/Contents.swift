//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let baseUrl = URL(string: "https://itunes.apple.com/search?")!

extension URL {
    func withQueries(_ queries: [String:String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

let query: [String : String] = [
    "term" : "mecano",
    "limit" : "10"
]

let url = baseUrl.withQueries(query)!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    if let data = data, let texto =  String(data: data, encoding: .utf8) {
        print(texto)
    }
    else {
        print("Error")
    }
    
}

task.resume()
