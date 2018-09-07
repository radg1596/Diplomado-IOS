//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by macbook on 13/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    /////Outlets
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var datePickerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    ///Botón guardar
    @IBOutlet weak var saveButton: UIBarButtonItem!
    ///todo
    var todo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            tittleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            datePicker.date = todo.dueDate
            notesTextView.text = todo.notes
            selectImageForButton()
            
        }
        else {
            datePicker.date = Date().addingTimeInterval(60*60*24)
            selectImageForButton()
        }
        
        updateDateLabel(date: datePicker.date)
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     No recibe parámetros
     Desactiva ó activa el botón de guardar dependiendo si el
     título de la tarea es nulo
     */
    func updateSaveButtonState() {
        let text = tittleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    /*
     Recibe un UItextField
     Actualiza el estado botón de guardar cuando hay un cambio en el tittleTextField
     */
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    ///Fechas
    func updateDateLabel(date: Date) {
            datePickerLabel.text = ToDo.dueDateFormater.string(from: date)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDateLabel(date: sender.date)
    }
    
    
    
    @IBAction func returnPressed(_ sender: UITextField) {
        tittleTextField.resignFirstResponder()
    }
    
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
        selectImageForButton()
    }
    
    func selectImageForButton() {
    
        if isCompleteButton.isSelected{
            isCompleteButton.setImage(#imageLiteral(resourceName: "checked.png"), for: .normal)
        }
        else {
            isCompleteButton.setImage(#imageLiteral(resourceName: "unchecked.png"), for: .normal)
        }
    }
    
    /*
     Prepara los datos antes de que se realize el
     unwind segue
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return}
        
        let tittle = tittleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let date = datePicker.date
        let notes = notesTextView.text
    
        todo = ToDo(title: tittle, isComplete: isComplete, dueDate: date, notes: notes)
        
    }
    
    
}
