//
//  ViewController.swift
//  MonthProyectPages
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 11/30/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageViewController: UIPageViewController?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let startingViewController: DataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        
        let viewControllers = [startingViewController]
        
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in})
        
        //Data source
        self.pageViewController?.dataSource = self.modelController
        
        //Add child
        self.addChild(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController!.view.frame = self.view.frame
        self.pageViewController!.didMove(toParent: self)
        
    }
    
    lazy var modelController = ModelController()
    
    ///Nota: Hacer Singleton -> Variable shared estática y volver private el init()
    
//    ////////////Implementación Lazy de una variable/////////////////////////
//
//    var modelController: ModelController {
//        if _modelController == nil {
//            _modelController = ModelController()
//        }
//        return _modelController!
//    }
//
//    var _modelController: ModelController? = nil
//
//    //////////////////////////////////////////////////////

}

