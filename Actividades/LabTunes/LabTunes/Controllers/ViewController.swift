//
//  ViewController.swift
//  LabTunes
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 09/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    @IBAction func loginButtonWasTouchInside(_ sender: UIButton) {
        guard let username = userNameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        if User.login(userName: username, password: password) {
            performSegue(withIdentifier: "loginSuccess", sender: self)
        }
        else {
            //Alert
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

