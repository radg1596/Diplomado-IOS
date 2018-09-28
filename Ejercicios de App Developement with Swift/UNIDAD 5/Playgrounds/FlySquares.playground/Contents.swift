import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)

let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white

///Frame pequeño
let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor =  .purple
liveView.addSubview(square)

/*
///Animación
UIView.animate(withDuration: 3.0, animations:  {
    square.backgroundColor = .orange
    square.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
}) {(_) in
///La accion que se ejecuta después
///Animación para regresar al cuadro original
    UIView.animate(withDuration: 3.0) {
        square.backgroundColor = .purple
        square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
} */

/*
///Agregar delays y custom options
UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
    square.backgroundColor = .orange
    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
}, completion: nil)
*/

///Animación con transformaciones
UIView.animate(withDuration: 2.0, animations: {
    square.backgroundColor = .orange
    ////La propiedad escalar
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    ////La propiedad rotar
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    ///La propiedad transladar
    let translateTransform = CGAffineTransform(translationX: 200, y: 20)
    ///Concatenando tranformaciones
    let comboTranform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
    
    square.transform = comboTranform
} ) { (_) in
    ////Función identidad
    UIView.animate(withDuration: 2.0, animations: {
        square.transform = CGAffineTransform.identity
    })
}






PlaygroundPage.current.liveView = liveView
