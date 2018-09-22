//
//  FishViewController.swift
//  plasticfishes-mvc
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 21/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class FishViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var fishesTableView: UITableView!
    
    var fishesArray = [Fish]()
    
    //MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doFishing()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupView() {
        navigationItem.title = "Plastic Fishes 🐟"
        fishesTableView.register(UINib(nibName: "FishesViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "fishCell")
        fishesTableView.delegate = self
        fishesTableView.dataSource = self
    }
    
    func doFishing() {
        //TODO
        //ServiceAPICALL
        //self.fishesArray = fishes
        fishesArray = FishService.list_all()
    }
    
    //MARK: Table view Protocols Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fishesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fishCell", for: indexPath) as? FishesViewCellTableViewCell else {return UITableViewCell()}
        
        let fish = fishesArray[indexPath.row]
        
        cell.fishTitleLabel.text = fish.name
        cell.fishSubtitleLabel.text = fish.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94.0
    }
    
}
