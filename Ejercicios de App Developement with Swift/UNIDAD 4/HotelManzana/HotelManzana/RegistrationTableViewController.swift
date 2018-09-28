//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by macbook on 13/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    var registrations: [Registration] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)

        let registration = registrations[indexPath.row]
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        
        // Configure the cell...
        cell.textLabel?.text = registration.firstName + " " + registration.lastName
        
        cell.detailTextLabel?.text = dateFormater.string(from: registration.checkInDate) + "-" + dateFormater.string(from: registration.checkOutDate) + ": " + registration.roomType.name

        return cell
    }
    
    @IBAction func unwindFromAddRegistration (unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationViewController = unwindSegue.source as? AddRegistrationTableViewController_,
            let registration = addRegistrationViewController.registration else {return}
        
        registrations.append(registration)
        tableView.reloadData()
        
    }

}
