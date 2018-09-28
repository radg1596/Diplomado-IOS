//
//  ViewController.swift
//  Contest
//
//  Created by macbook on 15/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func aceptButtonTapped(_ sender: UIButton) {
        
        
        let animacion = { () -> Void in
            UIView.animate(withDuration: 0.05, animations:  {
                let transformRotate = CGAffineTransform(rotationAngle: .pi/16)
                self.emailTextField.transform = transformRotate
                
            }) {(_) in
                UIView.animate(withDuration: 0.05, animations: {
                    self.emailTextField.transform = CGAffineTransform.identity
                })
            }
        }
        
        if (emailTextField.text?.isEmpty)! {
            animacion()
        }
        
        else {
            performSegue(withIdentifier: "show", sender: self)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }



}
