//
//  MasterViewController.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 29/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Country]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        setTheme()
        loadData()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        setTheme()
                tableView.reloadData()
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.name
        cell.detailTextLabel?.text = object.iso
        if UserDefaults.standard.bool(forKey: "nightTheme") {
            cell.backgroundColor = UIColor.dark1
            cell.detailTextLabel?.textColor = UIColor.white1
            cell.textLabel?.textColor = UIColor.white1
        }
        else {
            cell.backgroundColor = UIColor.white1
            cell.detailTextLabel?.textColor = UIColor.black
            cell.textLabel?.textColor = UIColor.black
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    func setTheme() {
        if UserDefaults.standard.bool(forKey: "nightTheme") {
            self.navigationController?.navigationBar.barTintColor = UIColor.dark2
            self.navigationController?.navigationBar.tintColor = UIColor.white1
            self.tableView.backgroundColor = UIColor.dark1
        }
        else {
            self.navigationController?.navigationBar.barTintColor = UIColor.dark2
            self.navigationController?.navigationBar.tintColor = UIColor.orange1
       }
        
    }
    
    func loadData() {
        CountryService().all { (countries) in
            print(countries)
            self.objects = countries
            self.tableView.reloadData()
        }
    }

}

