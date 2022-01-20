//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/18/22.
//

import Foundation
import ComposableArchitecture
import Models

public struct TasksEnvironment {
    public init() {}
}

public struct TasksState {
    public var tasks: [Task] = []

    public init(tasks: [Task]) {
        self.tasks = tasks
    }
}

public enum TasksAction: Equatable {
    case createTask(UUID, String, UUID)
}

public let tasksReducer = Reducer<TasksState, TasksAction, TasksEnvironment> { state, action, _ in
  switch action {
  case let .createTask(id, taskTitle, projectId):
      let task = Task(id: id, title: taskTitle, projectId: projectId)
      state.tasks.append(task)
      return .none

  }
}
