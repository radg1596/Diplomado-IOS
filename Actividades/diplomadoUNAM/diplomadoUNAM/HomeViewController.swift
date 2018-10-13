//
//  HomeViewController.swift
//  diplomadoUNAM
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 12/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    /*
    override func loadView() {
        super.loadView()
        let customView = HomeView()
        customView.setFunnyColor()
        view = customView
    }*/
    
    /*
    override func loadView() {
        super.loadView()
        self.view = HomeView()
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        let customView = self.view as! HomeView
        customView.setFunnyColor()
        
        if User.hasSession {
            /*
            let musicSelectionVC = MusicSelectionViewController()
            self.navigationController?.pushViewController(musicSelectionVC, animated: true)
             */
            performSegue(withIdentifier: "showMusic", sender: self)
        }
        else {
            performSegue(withIdentifier: "showLogin", sender: self)
            /*
            let loginVC = LoginViewController()
            self.navigationController?.pushViewController(loginVC, animated: true)
             */
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
