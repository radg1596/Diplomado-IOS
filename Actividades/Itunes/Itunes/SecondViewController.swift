//
//  SecondViewController.swift
//  Itunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 01/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var fromFirstView: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = fromFirstView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
