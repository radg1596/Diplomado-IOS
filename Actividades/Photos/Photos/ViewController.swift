//
//  ViewController.swift
//  Photos
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 05/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 7
        addButton.layer.borderColor = UIColor(red: 0.60, green: 0.07, blue: 0.70, alpha: 1.0).cgColor
        let rightButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addPhoto))
        rightButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addPhoto() {
        let actionSheet = UIAlertController(title: "Photos", message: "Select a photo", preferredStyle: .actionSheet)
        //Cancelar
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //Galería
        actionSheet.addAction(UIAlertAction(title: "Photos library", style: .default, handler: { (action) in
            let imagePickerView = UIImagePickerController()
            imagePickerView.sourceType = .photoLibrary
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
        }))
        //Camára
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: PickerViewDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("The user canceled the photo selection")
        picker.dismiss(animated: true, completion: nil)
    }
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Photo dictionary")
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {return}
        
        self.imageView.image = image
        self.imageView.isHidden = false
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: IBActions
    @IBAction func selectPhoto(_ sender: UIButton) {
        addPhoto()
    }
    
}

