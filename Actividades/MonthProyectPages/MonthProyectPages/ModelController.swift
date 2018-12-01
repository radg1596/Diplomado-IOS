//
//  ModelController.swift
//  MonthProyectPages
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 11/30/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class ModelController: NSObject {
    
    var pageData: [String] = []
    
    override init() {
        super.init()
        //Create data model
        let dateFormatter = DateFormatter()
        pageData = dateFormatter.monthSymbols
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        
        //Return the data view controller for the given index
        
        if (self.pageData.count == 0 || index >= self.pageData.count) {
            return nil
        }
        //Create a new view controller and pass suitable data
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
        
    }

}

extension ModelController: UIPageViewControllerDataSource {
    
    func indexOfViewController(_ viewControler: DataViewController) -> Int {
        return pageData.index(of: viewControler.dataObject) ?? NSNotFound
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    /////Para tener paginador, contador.....
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        //Total de index
        return self.pageData.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        //Index de inicio
        return 0
    }
    
    
}
