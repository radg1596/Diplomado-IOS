//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by macbook on 13/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController, TodoCellDelegate {
    
    func checkMarkTapped(sender: ToDoCell) {
        
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = todos[indexPath.row]
            todo.isComplete = !todo.isComplete
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }
    
    var todos = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Cargando o inicializando datos
        if let savedTodos = ToDo.loadToDos() {
            todos = savedTodos
        }
        else {
            todos = ToDo.loadSampleToDos()
        }
        ///Botones Editar/Hecho
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem?.title = "Editar"
    }

    /*
     Modifico al español los títulos de los botones
     */
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if self.isEditing {
            self.editButtonItem.title = "Hecho"
        }
        else {
            self.editButtonItem.title = "Editar"
        }
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    /*
     Crea una celda para cada "ToDo"
     */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
       let todo = todos[indexPath.row]

        // Configure the cell...
        cell.titleLabel?.text = todo.title
        cell.delegate = self
        if todo.isComplete {
            cell.isCompleteButton.setImage(#imageLiteral(resourceName: "checked.png"), for: .normal)
        }
        else {
            cell.isCompleteButton.setImage(#imageLiteral(resourceName: "unchecked.png"), for: .normal)
        }
        return cell
    }
    
    // Indica que podemos editar todas las celdas
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Para borrar celdas
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            ToDo.saveToDos(todos)
        }
    }
    
    /*
     Función para realizar un unwind segue.
     Inserta nuevos elementos o reescribe según sea el caso
     */
    
    @IBAction func unWindToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as? ToDoViewController
        
        if let todo = sourceViewController?.todo {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                todos [selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                let newIndexPath = IndexPath(row: todos.count, section: 0)
                todos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        ToDo.saveToDos(todos)
    }
    
    /*
     Función que envía el ToDo a modificar...
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails" else {return}
        
        let todoViewController = segue.destination as? ToDoViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let selectedTodo = todos[indexPath.row]
        todoViewController?.todo = selectedTodo
    }
    
    /*
     Modificamos el título del botón de eliminar celdas...
     */
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Eliminar"
    }

}
