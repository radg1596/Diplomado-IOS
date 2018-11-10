//
//  NetworkTests.swift
//  LabTunesTests
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 09/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import XCTest

@testable import LabTunes

class NetworkTest: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        print("")
        sessionUnderTest = URLSession(configuration: .default)
        
    }
    
    func testValidCallToItunes() {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        var statusCode: Int?
        var responseError: Error?
        let promise = expectation(description: "Handler Invoked")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testSlowValidCallToItunes() {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                XCTFail("\(error.localizedDescription)")
            }
            else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                }
                else{
                    XCTFail("Status Code \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testValidCallToItunesB() {
        var resultSongs = [Song]()
        let promise = expectation(description: "There are songs")
        Music.fetchSongs(songName: "queen") { (songs) in
            resultSongs = songs
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(resultSongs.count, 0)
    }
    
}
