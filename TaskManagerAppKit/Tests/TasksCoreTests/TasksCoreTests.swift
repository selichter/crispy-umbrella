//
//  TasksCoreTests.swift
//  
//
//  Created by Sarah Lichter on 1/18/22.
//

import XCTest
import ComposableArchitecture
import Models
import AppCore
@testable import TasksCore

class TasksCoreTests: XCTestCase {

    func testAddButtonTappedInsertsEmptyTaskIntoState() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )

        let taskId = UUID()
        let projectId = UUID()

        let expectedTask = Task(id: taskId, title: "", projectId: projectId)

        store.assert(.send(.tasks(.addButtonTapped(taskId, projectId))) {
            $0.tasks = [expectedTask]
            }
         )
    }

}
