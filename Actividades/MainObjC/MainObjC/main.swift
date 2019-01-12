//
//  main.swift
//  MainObjC
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 1/11/19.
//  Copyright © 2019 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class MyAplication: UIApplication {
    
    
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        print("Event sent: \(event)")
    }
    
}

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(MyAplication.self), NSStringFromClass(AppDelegate.self))
