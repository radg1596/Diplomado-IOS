import UIKit

extension Data {
    mutating func append(string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

let boudary = NSUUID().uuidString
var data = Data()

data.append(string: "yolo")
data.append(string: "yolo")
data.append(string: "yolo")
data.append(string: "yolo")
print(data)

