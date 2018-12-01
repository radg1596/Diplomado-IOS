//
//  DataViewController.swift
//  MonthProyectPages
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 11/30/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel.text = dataObject
    }

}
