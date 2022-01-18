//
//  ProjectsCoreTests.swift
//  
//
//  Created by Sarah Lichter on 1/17/22.
//

import XCTest
import ComposableArchitecture
import Models
import AppCore
@testable import ProjectsCore

class ProjectsCoreTests: XCTestCase {

    func testCreateProjectAddsEntryToProjectInState() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        let projectName = "Ptoject Name"
        let projectId = UUID()

        let expectedProject = Project(id: projectId, name: projectName)

        store.send(.project(.createProject(projectId, projectName))) {
            $0.projects = [expectedProject]

        }
    }

}
