//
//  LabTunesTests.swift
//  LabTunesTests
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 09/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import XCTest
@testable import LabTunes

class LabTunesTests: XCTestCase {

    override func setUp() {
        let session = Session.sharedInstance
        session.token = nil
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testCorrectLogin() {
        XCTAssertTrue(User.login(userName: "username", password: "password"))
    }
    
    func testWrongLogin() {
        XCTAssertFalse(User.login(userName: "Raul", password: "false"))
    }
    
    func testSaveSession() {
        let session = Session.sharedInstance
        let _ = User.login(userName: "username", password: "password")
        XCTAssertNotNil(session.token)
    }
    
    func testWrongSaveSession() {
        let session = Session.sharedInstance
        let _ = User.login(userName: "iOSLa", password: "223")
        XCTAssertNil(session.token)
    }
    
    func testExpectedToken() {
        let _ = User.login(userName: "username", password: "password")
        let session = Session.sharedInstance
        XCTAssertEqual(session.token!, "1234567890", "Token should match")
        XCTAssertNotEqual(session.token!, "23323223", "Token is wrong")
    }

    func testThrowsErrorFetchSongs() {
        XCTAssertThrowsError(try User.fetchSongs())
    }
    
    func testRightFetchSongs() {
        let _ = User.login(userName: "username", password: "password")
        XCTAssertNoThrow(try User.fetchSongs())
    }
}
