//
//  ViewController.swift
//  FlickerSearch
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 11/16/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuserIdemtifier = "FlickrCell"
    fileprivate let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate var searches = [FlickrSearchResults]()
    fileprivate let flickr = Flickr()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController {
    func photoForIndexPath(_ indexPath: IndexPath) -> FlickrPhoto {
        return searches[indexPath.section].searchResults[indexPath.row]
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        
        flickr.searchFlickrForTerm(textField.text!) { (results, error) in
            
            activityIndicator.removeFromSuperview()
            
            if let error = error {
                print("Error searching: \(error)")
                return
            }
            
            if let results = results {
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                self.collectionView.reloadData()
            }
        
        }
        
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
    
}
