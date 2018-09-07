//
//  AddToOrderDelegate.swift
//  Restaurante
//
//  Created by macbook on 17/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

/*
 Protocolo para agregar una orden. Quién lo conforme deberá
 tener una función para agregar un item.
 */

import Foundation
protocol AddToOrderDelegate {
    func added(menuItem: MenuItem)
}
