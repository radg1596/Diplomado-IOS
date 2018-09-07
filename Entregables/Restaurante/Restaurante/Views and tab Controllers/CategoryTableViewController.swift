//
//  CategoryTableViewController.swift
//  Restaurante
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    //Arreglo de categorías
    var categories: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Se obtienen las categorías del servidor
        MenuController.shared.fetchCategories { (fetchCategories) in
            if let fetchCategories = fetchCategories {
                self.updateUI(with: fetchCategories)
            }
        }
        
    }

    /*
     Se actualizan la tabla con la información obtenida del
     servidor
     */
    func updateUI (with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    /*
     Creando celdas...
     Se llama a la función para configurarlas
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        // Configure the cell...
        configureCell(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    //Se encarga de configurar cada celda
    func configureCell(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString
    }
    
    //Envía los datos a la siguiente vista, una vez que se
    //seleccionó una categoría
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as? MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController?.category = categories[index]
        }
    }

}
