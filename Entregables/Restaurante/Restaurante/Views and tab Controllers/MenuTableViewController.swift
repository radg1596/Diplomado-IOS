//
//  MenuTableViewController.swift
//  Restaurante
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var category: String!
    var menuItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.capitalized
        //Obtiene los items de menú de la categoría seleccionada
        MenuController.shared.fetchMenuItems(categoryName: category) { (fetchMenuItems) in
            if let fetchMenuItems = fetchMenuItems {
                self.updateUI(with: fetchMenuItems)
            }
        }
    }
    //Actualiza la tabla con los datos
    //obtenidos del servidor
    func updateUI (with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    //Creando celdas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)

        // Configure the cell...
        configureCell(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    //Configurando las celdas
    func configureCell(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        cell.imageView?.image = #imageLiteral(resourceName: "Solid_gray")
        //Obteniendo la imagen
        MenuController.shared.fetchImage(imageURL: menuItem.imageURL) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath != indexPath {
                        return
                    }
                    cell.imageView?.image = image
                }
            }
        }
    }

    /*
     Prepara datos para enviar a la vista de detalle de
     cada alimento
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as? MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
                menuItemDetailViewController?.menuItem = menuItems[index]
        }
    }
    
    //Modificando la altura de las celdas
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
