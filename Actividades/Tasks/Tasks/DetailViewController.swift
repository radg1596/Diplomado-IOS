//
//  DetailViewController.swift
//  Tasks
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 1/26/19.
//  Copyright © 2019 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController:  UIViewController {
    
    var task: NSManagedObject!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
    }
    
    
    @IBAction func saveTask(_ sender: Any) {
        guard let description = textView.text else {return}
        save(description: description)
    }
    
    
    func save(description: String){
        self.task.setValue(description, forKey: "definition")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do{
            try managedContext.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func getDetail() {
        textView.text = task.value(forKeyPath: "definition") as? String
    }
    
}
