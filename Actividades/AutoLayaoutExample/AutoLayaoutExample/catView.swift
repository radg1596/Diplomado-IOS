//
//  catView.swift
//  AutoLayaoutExample
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 28/09/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class catView: UIView {

    //Imagen del gato
    let imageView: UIImageView = {
        //iv = imageview
        let iv = UIImageView(frame: .zero)
        iv.image = #imageLiteral(resourceName: "tacoCat")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAutoLayout()
    }
    
    func setupAutoLayout() {
        backgroundColor = UIColor(named: "intenseRed")!
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
    }
}
