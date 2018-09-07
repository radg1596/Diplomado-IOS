//
//  OrderTableViewController.swift
//  Restaurante
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit


//Conforma el delegado "AddToOrder"
class OrderTableViewController: UITableViewController, AddToOrderDelegate
{
    var menuItems: [MenuItem] = []
    var orderMinutes: Int?
    
    /*
     Recibe un item de menu, lo inserta en la estructura de la vista
     y después actualiza la table
     */
    func added(menuItem: MenuItem) {
        menuItems.append(menuItem)
        let count = menuItems.count
        let indexPath = IndexPath(row: count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        updateBadgeValue()
    }
    
    //Actualizando el valor del TabBarController correspondiente
    func updateBadgeValue(){
        let badgeValue = menuItems.count>0 ? "\(menuItems.count)" : nil
        navigationController?.tabBarItem.badgeValue = badgeValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    //Creando celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        let item = menuItems[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = String(format: "$%.2f", item.price)
        
        return cell
    }
    
    //Hace editables las celdas
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //Dice cómo se borran los objetos
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            menuItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateBadgeValue()
        }
    }
    
    //Simplemente regresa al menu anterior
    @IBAction func unwindToOrderList(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func submitButtonTapped(_ sender: UIBarButtonItem) {
        //Obteniendo el total de la cuenta
        let orderTotal = menuItems.reduce(0.0) { (result, item) -> Double in
            return result + item.price
        }
        let formatOrder = String(format: "$%.2f", orderTotal)
        //Creando la alerta a desplegar
        let alert = UIAlertController(title: "Comfirm Order", message: "You are about to submit your order with a total of \(formatOrder)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Accept", style: .default, handler: { (action) in
            self.uploadOrder()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        if orderTotal != 0 {
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    //Se encarga de hacer la petición de la orden
    func uploadOrder() {
        let menuIds = menuItems.map {$0.id}
        MenuController.shared.submitOrder(menuIds: menuIds) { (minutes) in
            DispatchQueue.main.async {
                if let timeMinutes = minutes {
                    self.orderMinutes = timeMinutes
                }
                self.performSegue(withIdentifier: "ConfirmationSegue", sender: nil)
            }
        }
    }
    
    /*
     Envia la información necesaria para la siguiente vista
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConfirmationSegue" {
            guard let orderMinutes = self.orderMinutes else {return}
            let orderConfirmationController = segue.destination as? OrderConfirmationViewController
            orderConfirmationController?.minutes = orderMinutes
        }
    }
    
    
}
