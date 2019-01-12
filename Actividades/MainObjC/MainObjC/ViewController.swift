//
//  ViewController.swift
//  MainObjC
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 1/11/19.
//  Copyright © 2019 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Singleton.shared.delegate = self
    }
    
}

