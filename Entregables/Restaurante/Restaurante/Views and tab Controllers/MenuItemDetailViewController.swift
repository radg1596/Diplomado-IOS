//
//  MenuItemDetailViewController.swift
//  Restaurante
//
//  Created by macbook on 16/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    var menuItem: MenuItem!
    var delegate: AddToOrderDelegate?
    
    //Actualizando la interfaz grafica
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.decription
        //Hacer redondeado el botón
        addToOrderButton.layer.cornerRadius = 5.0
        //Obteniendo imagen
        MenuController.shared.fetchImage(imageURL: menuItem.imageURL) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegate()
        // Do any additional setup after loading the view.
    }
    
    //Animación para cuando se agrega una orden
    @IBAction func AddToOrderButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            let scale = CGAffineTransform(scaleX: 3.0, y: 3.0)
            let originalSize = CGAffineTransform.identity
            self.addToOrderButton.transform = scale
            self.addToOrderButton.transform = originalSize
        }
        delegate?.added(menuItem: menuItem)
    }
    
    //Configuramos el delegado
    func setupDelegate() {
        if let navController = tabBarController?.viewControllers?.last as? UINavigationController, let orderTableController = navController.viewControllers.first as? OrderTableViewController {
            delegate = orderTableController
        }
    }
    
}
