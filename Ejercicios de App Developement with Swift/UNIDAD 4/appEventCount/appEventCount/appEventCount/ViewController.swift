//
//  ViewController.swift
//  appEventCount
//
//  Created by macbook on 08/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ////Etiquetas
    @IBOutlet weak var didFinishLaunchLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var didBecomeInactiveLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var willTerminate: UILabel!
    ///Contadores
    var launchCount = 0
    var activeCount = 0
    var inactiveCount = 0
    var enterBackgroundCount = 0
    var enterForegroundCount = 0
    var terminateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        didFinishLaunchLabel.text = "Lanzada \(launchCount) veces"
        didBecomeActiveLabel.text = "Fue activada \(activeCount) veces"
        didBecomeInactiveLabel.text = "Fue inactiva \(inactiveCount) veces"
        didEnterBackgroundLabel.text = "Entró \(enterBackgroundCount) veces al back"
        willEnterForegroundLabel.text = "Entró \(enterForegroundCount) veces al fore"
        willTerminate.text = "Terminó \(terminateCount)"
    }


}

