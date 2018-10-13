//
//  ActionButton.swift
//  WaterCounter
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 13/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

@IBDesignable
class ActionButton: UIButton {
    
    @IBInspectable var isAddButton: Bool = true
    @IBInspectable var fillColor: UIColor = UIColor.green
    
    private var halfWidth: CGFloat {
        return bounds.width/2
    }
    
    private var halfHight: CGFloat {
        return bounds.height/2
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = 5.0
        
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHight))
        
        if self.isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHight - halfPlusWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth , y: halfHight + halfPlusWidth))
        }

        
        UIColor.white.setStroke()
        
        plusPath.stroke()
        
    }

}
