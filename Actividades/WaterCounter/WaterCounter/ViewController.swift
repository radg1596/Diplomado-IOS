//
//  ViewController.swift
//  WaterCounter
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 13/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func addGlassOfWater(_ sender: ActionButton) {
        counterView.counter += 1
    }
    
    
    @IBAction func minusGlassOfWater(_ sender: ActionButton) {
        counterView.counter -= 1
    }
    

}

