//
//  Digests.swift
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 06/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import Foundation
import UIKit

class Digests {
    
    class func sha1(string: String) -> String {
        let data = string.data(using: String.Encoding.utf8)!
        let digest = sha1(data: data)
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    class func sha1(data: Data) -> [UInt8] {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        return digest
    }
    
    class func base64(string: String) -> String {
        return String(data: Data(string.utf8).base64EncodedData(), encoding: .utf8) ?? ""
    }
    
    class func base64(image: UIImage) -> String {
        return  UIImagePNGRepresentation(image)?.base64() ?? ""
    }
    
    class func base64(data: Data?) -> String {
        return data?.base64EncodedString(options: .lineLength64Characters) ?? ""
    }
    
    
}

extension Data {
    func base64() -> String? {
        return self.base64EncodedString(options: .lineLength64Characters)
    }
}
