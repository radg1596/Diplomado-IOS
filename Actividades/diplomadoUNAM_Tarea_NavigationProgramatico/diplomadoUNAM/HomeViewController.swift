//
//  HomeViewController.swift
//  diplomadoUNAM
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 12/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        self.view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let customView = self.view as! HomeView
        customView.setFunnyColor()
        
        if User.hasSession {
            let musicSelectionVC = MusicSelectionViewController()
            self.navigationController?.pushViewController(musicSelectionVC, animated: true)
        }
        else {
            let loginVC = LoginViewController()
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        
    }

}
