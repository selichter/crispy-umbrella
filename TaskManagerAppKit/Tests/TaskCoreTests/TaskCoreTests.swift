//
//  TaskCoreTests.swift
//  
//
//  Created by Sarah Lichter on 1/20/22.
//

import XCTest
import ComposableArchitecture
import Models
import AppCore
@testable import TaskCore

class TaskCoreTests: XCTestCase {

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
        
        store.assert(.send(.task(index: 0, action: .toggleCompleted)) {
            
            $0.tasks[0].isCompleted = true
            
        })
        
    }

}
