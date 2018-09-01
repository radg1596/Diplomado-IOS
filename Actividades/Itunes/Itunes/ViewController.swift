//
//  ViewController.swift
//  Itunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 01/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tracks = [Tracks]()
    let baseUrl = URL(string: "https://itunes.apple.com/search?")!
    
    let query: [String : String] = [
        "term" : "mecano",
        "limit" : "50"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = tracks[indexPath.row].trackName
        let urlImage = URL(string: tracks[indexPath.row].artworkUrl100)!
        let dataImage = try? Data(contentsOf: urlImage)
        cell.imageView?.image = UIImage(data: dataImage!)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let destination = segue.destination as? SecondViewController
            destination?.fromFirstView = tracks[indexPath.row].trackName
        }
    }
    
    func fetchData() {
        
        let url = baseUrl.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let trackList = try? jsonDecoder.decode(Results.self, from: data) {
                var temp: [Tracks] = []
                trackList.results.forEach({ (track) in
                    temp.append(track)
                })
                

                self.tracks = temp
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            else {
                print(error.debugDescription)
            }
        }
        
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tracks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completion) in
            self.tracks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, competionHandler) in
            let text = "Listening: " + self.tracks[indexPath.row].trackName
            
            let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            self.present(activityController, animated: true)
        }
        
        shareAction.backgroundColor = UIColor.orange
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [shareAction, deleteAction])
        return swipeConfiguration
    }

    
}


extension URL {
    func withQueries(_ queries: [String:String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

