//
//  EmojiTableViewController.swift
//  emojiDictionary
//
//  Created by macbook on 10/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = []
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        
        if let documentEmojis = Emoji.loadFromFile() {
            emojis = documentEmojis
        }
        else {
            emojis = Emoji.loadeSampleEmojis()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return emojis.count
        }
        else {
            return 0
        }
        
        
    }

    ///Crear celdas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojis[indexPath.row]

        // Configure the cell...
        cell.update(with: emoji)
        cell.showsReorderControl = true
        
        return cell
    }
    
    //Reaccionar al tap de una selda
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let emoji = emojis[indexPath.row]
       //print ("\(emoji.symbol) \(indexPath)")
    }
    
    
    //Animación de que se está editando
    /*
     @IBAction func editButton(_ sender: Any) {
     let tableViewEditingMode = tableView.isEditing
     tableView.setEditing(!tableViewEditingMode, animated: true)
     }
     */
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
    
    
    ///La magia para mover las celdas, reinsertar en algún lugar
    ///específico de la tabla
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
            emojis.insert(movedEmoji, at: to.row)
        Emoji.saveToFile(emojis: emojis)
        tableView.reloadData()
    }
    
    ///Borrar el indicador de delete
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
            return .delete
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            Emoji.saveToFile(emojis: emojis)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let nav = segue.destination as! UINavigationController
            let addEmojiTableViewController = nav.viewControllers.first as! AddEditEmojiTableViewController
            addEmojiTableViewController.emoji = emoji
            
        }
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else {return}
        
        let sourceViewController = segue.source as! AddEditEmojiTableViewController
        
        if let emoji = sourceViewController.emoji {
            
            if let selectIndexPath = tableView.indexPathForSelectedRow {
                emojis[selectIndexPath.row] = emoji
                tableView.reloadRows(at: [selectIndexPath], with: .none)
                Emoji.saveToFile(emojis: emojis)
            }
                
            else {
                let newIndexPath = IndexPath(row: emojis.count, section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                Emoji.saveToFile(emojis: emojis)
            }
            
        }
    }


}
