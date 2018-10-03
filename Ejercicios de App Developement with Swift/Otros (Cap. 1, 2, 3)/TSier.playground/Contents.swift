import Cocoa

func inicializar(num : Int) -> String {
    var pobIn = ""
    for i in 0...num-1 {
        pobIn = Int(num/2) == i ? pobIn + "*" : pobIn + " "
    }
    return pobIn
}

func seleccion(ind : String) -> String {
    let seleccionado = ind == "   " || ind == "***" ? " " : "*"
    return seleccionado
}

func sigGen (pob : String) -> String {
    var nPob : String = ""
    nPob += String( pob[pob.startIndex] )
    for i in 0...pob.count-3 {
        let index = pob.index(pob.startIndex, offsetBy: i)
        let index2 = pob.index(pob.startIndex, offsetBy: i+1)
        let index3 = pob.index(pob.startIndex, offsetBy: i+2)
        let individuos : String = String(pob[index]) + String(pob[index2]) + String(pob[index3])
        nPob += seleccion(ind: individuos)
    }
    nPob += String( pob[pob.index(before: pob.endIndex)] )
    return nPob
}

func principal (numGen: Int) {
    
    var pob : String = inicializar(num: 200)
    
    for _ in 0...numGen {
        print (pob)
        pob = sigGen(pob: pob)
        
    }
    
}

principal(numGen: 100)


