//
//  CommonCryptoDigetsTests.swift
//  CommonCryptoDigetsTests
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 06/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import XCTest
@testable import CommonCryptoDigets
class CommonCryptoDigetsTests: XCTestCase {
    let lipsum = "Lorem ipsum dolor sit amet consectetuer adipiscing elit. Ultrices sed massa blandit morbi fames euismod non conubia dolor euismod ut posuere consequat lacinia. Dolor ad morbi. Mauris placerat integer blandit. Tortor. Vestibulum porta dignissim pede dis platea. Curabitur scelerisque imperdiet nulla dui enim eget"
    
    func testSha1() {
        let result  = Digests.sha1(string: lipsum)
        XCTAssertEqual("5715e933a51622a79b99c71283b3e6a9596d6735", result)
    }
    
    func testSha1Objc() {
        let result  = CDDigests.sha1String(lipsum)
        XCTAssertEqual("5715e933a51622a79b99c71283b3e6a9596d6735", result)
    }
    
    func testSha1Integrity() {
        let result  = Digests.sha1(string: lipsum)
        let objcResult = CDDigests.sha1String(lipsum)
        XCTAssertEqual(objcResult, result)
    }
}
