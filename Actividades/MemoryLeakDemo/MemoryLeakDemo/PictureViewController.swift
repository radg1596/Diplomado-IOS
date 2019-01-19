//
//  ViewController.swift
//  MemoryLeakDemo
//
//  Created by Chris Adamson on 7/16/17.
//  Copyright © 2017 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var model: PictureViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = PictureViewModel()
        model?.delegate = self
        model?.loadImage()
    }
}

extension PictureViewController: PictureViewModelDelegate {
    func modelDidLoadPicture(_ model: PictureViewModel) {
        print ("modelDidLoadPicture")
        imageView.image = model.image
    }
    
}
