//
//  LabTunesUITests.swift
//  LabTunesUITests
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 09/11/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

import XCTest


//Pruebas de interfaz
class LabTunesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testAppLogin() {
        let app = XCUIApplication()
        let nameTextField = app.textFields["usernametextfield"]
        nameTextField.tap()
        nameTextField.typeText("username")
        
        let passwordTextField = app.secureTextFields["passwordtextfield"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        let loginButton = app.buttons["loginbutton"]
        loginButton.tap()
        XCTAssertTrue(app.isDisplayingMusic)
    }
    
    

}

extension XCUIApplication {
    var isDisplayingMusic: Bool {
        return otherElements["MusicView"].exists
    }
}
