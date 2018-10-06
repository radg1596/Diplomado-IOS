//
//  SettingThemeUIViewController.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class SettingThemeUIViewController: UIViewController {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBAction
    func chageTheme(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "nightTheme")
        loadTheme()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        themeSwitch.isOn = UserDefaults.standard.bool(forKey: "nightTheme")
        if UserDefaults.standard.bool(forKey: "nightTheme") {
            self.view.backgroundColor = UIColor.dark1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTheme()
    }
    
    func loadTheme() {
        if UserDefaults.standard.bool(forKey: "nightTheme") {
            self.view.backgroundColor = UIColor.dark1
        }
        else {
            self.view.backgroundColor = UIColor.white1
        }
    }

}
