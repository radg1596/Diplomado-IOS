//
//  ViewController.swift
//  AutoLayaoutExample
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 28/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let red = UIColor(named: "intenseRed")!
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        guard let txt = sender.text else {return}
        textLBL.text = txt
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        self.view.backgroundColor = red
    }

    @IBOutlet weak var textLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

