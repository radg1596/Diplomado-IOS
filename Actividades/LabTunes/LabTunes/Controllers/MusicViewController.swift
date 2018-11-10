//
//  MusicViewController.swift
//  LabTunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 10/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        downloadSongs()
    }
    
    /**
     Get the songs from the service
     */
    func downloadSongs() {
        Music.fetchSongs { (results: [Song]) in
            self.songs = results
            self.tableView.reloadData()
        }
    }
    
    func downloadSongsBy(name: String) {
        Music.fetchSongs(songName: name) { (results: [Song]) in
            self.songs = results
            self.tableView.reloadData()
        }
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Songs"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }

}


/**
 DATA SOURCE
 */
extension MusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let song = songs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        
        //Configure cell
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
}

extension MusicViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        downloadSongsBy(name: text)
    }
    
}
