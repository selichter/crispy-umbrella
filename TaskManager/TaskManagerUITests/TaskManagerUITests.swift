//
//  TaskManagerUITests.swift
//  TaskManagerUITests
//
//  Created by Sarah Lichter on 1/16/22.
//

import XCTest

class TaskManagerUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        app.launch()
    }
    
    func testCreateProjectWorkflow() {
        XCTAssert(app.staticTexts["Projects"].exists)
        app.images["Add"].tap()
        XCTAssert(app.staticTexts["Project Name"].exists)
        let projectName = "Sample Project"
        let projectTextField = app.textFields["projectTextField"]
        projectTextField.doubleTap()
        projectTextField.typeText(projectName)
        app.buttons["Create Project"].tap()
        XCTAssert(app.staticTexts[projectName].exists)
        
    }
}
