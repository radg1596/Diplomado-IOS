//
//  SquareView.swift
//  SimpleLines
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 13/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import UIKit

class SquareView: UIView {

    override func draw(_ rect: CGRect) {
        //Context = Lienzo de pintado
        let context = UIGraphicsGetCurrentContext()
        /*
         //Linea
         context?.setStrokeColor(UIColor.black.cgColor)
         context?.setLineWidth(1)
         context?.move(to: CGPoint(x: 0, y: 0))
         context?.addLine(to: CGPoint(x: 100, y: 100))
         context?.addLine(to: CGPoint(x: 100, y: frame.height))
         */
        
        /*
        //Cuadrado
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(2)
        context?.move(to: CGPoint(x: 10, y: 0))
        context?.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        context?.addQuadCurve(to: CGPoint(x: frame.width, y: 10), control: CGPoint(x: frame.width, y: 0))
        context?.addLine(to: CGPoint(x: frame.width, y: frame.height - 10))
        context?.addQuadCurve(to: CGPoint(x: frame.width - 10, y: frame.height), control: CGPoint(x: frame.width, y: frame.height))
        context?.addLine(to: CGPoint(x: 10, y: frame.height))
        context?.addQuadCurve(to: CGPoint(x: 0, y: frame.height - 10), control: CGPoint(x: 0, y: frame.height))
        context?.addLine(to: CGPoint(x: 0, y: 10))
                context?.addQuadCurve(to: CGPoint(x: 10, y: 0), control: CGPoint(x: 0, y: 0))
 
         */
        
        //Usando curvas de Bezier
       let aPath = UIBezierPath()
        aPath.lineWidth = 4
        aPath.move(to: CGPoint(x: 10, y: 0))
        aPath.addLine(to: CGPoint(x: frame.width - 10, y: 0))
        aPath.addQuadCurve(to: CGPoint(x: frame.width, y: 10), controlPoint: CGPoint(x: frame.width, y: 0))
        aPath.addLine(to: CGPoint(x: frame.width, y: frame.height - 10))
        aPath.addQuadCurve(to: CGPoint(x: frame.width - 10, y: frame.height), controlPoint: CGPoint(x: frame.width, y: frame.height))
        aPath.addLine(to: CGPoint(x: 10, y: frame.height))
        aPath.addQuadCurve(to: CGPoint(x: 0, y: frame.height - 10), controlPoint: CGPoint(x: 0, y: frame.height))
        aPath.addLine(to: CGPoint(x: 0, y: 10))
        aPath.addQuadCurve(to: CGPoint(x: 10, y: 0), controlPoint: CGPoint(x: 0, y: 0))
        UIColor.black.set()
        aPath.stroke()
        
        //Dibujar
        context?.strokePath()
    }

}
