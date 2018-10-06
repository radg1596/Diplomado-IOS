import UIKit

protocol MiProtocolo {
    func Juega()
}

extension String {
    func Saluda()  {
        print("Hola, soy una extensión: \(self)")
    }
}

class  alumnoReprobador: MiProtocolo {
    func Juega() {
        print("Estoy jugando")
    }
}

var alumno = "hola"
alumno.Saluda()
