//
//  SelectRoomTypeTableViewController.swift
//  HotelManzana
//
//  Created by macbook on 13/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate {
    func didSelect (roomType: RoomType)
}

class SelectRoomTypeTableViewController: UITableViewController {
    
    var delegate: SelectRoomTypeTableViewControllerDelegate?
    
    var roomType: RoomType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomType.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        let roomType = RoomType.all[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
    
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        roomType = RoomType.all[indexPath.row]
        delegate?.didSelect(roomType: roomType!)
        tableView.reloadData()
        
    }
    

}
