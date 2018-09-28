import UIKit

///Extendiendo UIColor
extension UIColor {
    static var favoriteColor: UIColor {
        return UIColor(red: 0.5, green: 0.1, blue: 0.5, alpha: 1.0)
    }
}

///Extendiendo String
extension String {
    
    mutating func pluralize() -> String {
        return self + "s"
    }
}

var apple = "apple"
//print(apple.pluralize())



