//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//Ejecución infinita
//PlaygroundPage.current.needsIndefiniteExecution

//Generamos el frame
let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
//Creamos la vista
let liveView = UIView(frame: liveViewFrame)
//Volvemos la vista del playground la vista creada
liveView.backgroundColor = UIColor.yellow


//Otro view
let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = UIColor.white
//Agregando una subvista
liveView.addSubview(square)

/*
UIView.animate(withDuration: 3.0) {
    square.backgroundColor = UIColor.orange
    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
}*/

/*
UIView.animate(withDuration: 3.0, animations: {
    square.backgroundColor = UIColor.orange
    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)}) { (_) in
        UIView.animate(withDuration: 3.0, animations: {
            square.backgroundColor = UIColor.yellow
            square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        })
}*/

/*

UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
    square.backgroundColor = UIColor.orange
    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
}, completion: nil)*/

UIView.animate(withDuration: 3.0, animations: {
    square.backgroundColor = UIColor.blue
    
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
    let combo = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
    square.transform = combo
}) {(_) in
    UIView.animate(withDuration: 2.0, animations: {
        square.transform = CGAffineTransform.identity
    })
    
}

PlaygroundPage.current.liveView = liveView
