import Foundation
/*
 struct Persona: CustomStringConvertible {
 let name: String
 var edad: Int
 
 init(name: String, edad: Int) {
 self.name = name
 self.edad = edad
 }
 var description: String {
 return "Soy \(name) y tengo \(edad)"
 }
 }
 
 let yo: Persona = Persona(name: "Ricardo", edad: 21)
 print (yo)
 */

/*
//////Ejemplo de protocolos, empleados y codable
struct Empleado: Equatable, Comparable, Codable {
    let nombre: String
    let apellidos: String
    var puesto: String
    var tel: Int
    static func == (lhs: Empleado, rhs: Empleado ) -> Bool {
        return lhs.nombre == rhs.nombre && lhs.apellidos == rhs.apellidos
    }
    static func < (lhs: Empleado, rhs: Empleado) -> Bool {
        return lhs.nombre > rhs.nombre
    }
}

struct Company {
    var name: String
    var empleados: [Empleado]
}
let emp1 = Empleado(nombre: "Dicardo", apellidos: "Gonzalez", puesto: "1", tel: 123)
let emp2 = Empleado(nombre: "Ricardo", apellidos: "Desiderio", puesto: "1", tel: 123)

let empleados = [emp1, emp2]

let ordenado = empleados.sorted(by: <)

//for emp in ordenado {
//    print (emp)
//}

let ben = Empleado(nombre: "Ben", apellidos: "Atkins", puesto: "Front desk", tel: 1234)

let jsonEncoder = JSONEncoder()

if let jsonData = try? jsonEncoder.encode(ben),
    let jsonString = String(data: jsonData, encoding: .utf8)
{
    print (jsonString)
}
*/

///Crear protocolos

protocol FullyName {
    var fullName: String {get}
    
    func sayFullName()
}

struct Person: FullyName {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func sayFullName() {
        print(self.fullName)
    }
}

let ben = Person(firstName: "Ben", lastName: "Diez")
ben.sayFullName()
