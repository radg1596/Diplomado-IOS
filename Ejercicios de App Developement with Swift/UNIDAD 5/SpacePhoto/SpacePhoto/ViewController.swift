//
//  ViewController.swift
//  SpacePhoto
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /////Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    let photoInfoController = PhotoInfoController()
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = image
                    self.titleLabel.text = "Title: " + photoInfo.title
                    self.descriptionLabel.text = "Description: " + photoInfo.description
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        titleLabel.text = ""
        descriptionLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

