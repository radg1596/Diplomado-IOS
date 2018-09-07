//
//  OrderConfirmationViewController.swift
//  Restaurante
//
//  Created by macbook on 17/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let orderMinutes = minutes {
            timeRemainingLabel.text = "Thank you! please wait \(orderMinutes) minutes"
        }
    }

}
