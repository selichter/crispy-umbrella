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

    func testCreateTaskAddsTaskToStateState() {
        let state = AppState()
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        let newTaskTitle = "Do Laundry"
        let taskId = UUID()
        let projectId = UUID()

        let expectedTask = Task(id: taskId, title: newTaskTitle, projectId: projectId)

        store.send(.tasks(.createTask(taskId, newTaskTitle, projectId))) {
            $0.tasks = [expectedTask]

        }
    }
    
    func testToggleCompletedSwitchesTheTasksCompletedState() {
        let newTaskTitle = "Do Laundry"
        let taskId = UUID()
        let projectId = UUID()
        var task = Task(id: taskId,
                        title: newTaskTitle,
                        projectId: projectId)
        
        XCTAssert(!task.isCompleted)
        var state = AppState()
        state.tasks = [task]
        
        task.isCompleted = true
        let completedTask = task
        
        let store = TestStore(
            initialState: state,
            reducer: appReducer,
            environment: AppEnvironment()
        )
        
        store.send(.tasks(.toggleCompleted(taskId))) {
            $0.tasks = [completedTask]
        }
        
    }

}
