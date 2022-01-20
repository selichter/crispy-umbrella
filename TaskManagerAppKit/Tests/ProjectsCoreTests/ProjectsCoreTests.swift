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

    func testCreateProjectAddsProjectInState() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        let projectName = "Project Name"
        let projectId = UUID()

        let expectedProject = Project(id: projectId, name: projectName)

        store.assert(.send(.project(.createProject(projectId, projectName))) {
            $0.projects = [expectedProject]

        }
                     )
    }

}
