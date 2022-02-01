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
    public var filterTasks: [Task] = []

    public init(tasks: [Task]) {
        self.tasks = tasks
        self.filterTasks = tasks
    }
}

public enum TasksAction: Equatable {
    case addButtonTapped(UUID, UUID)
    case filterByProject(UUID)
}

public let tasksReducer = Reducer<TasksState, TasksAction, TasksEnvironment> { state, action, _ in
  switch action {
  case let .addButtonTapped(taskId, projectId):
      state.tasks.insert(Task(id: taskId,
                              title: "",
                              projectId: projectId),
                         at: 0)
      return .none
//      test
  case let .filterByProject(projectId):
      state.filterTasks = state.tasks.filter { $0.projectId == projectId }
      return .none
  }
}

public enum Filter {
    case all
    case active
    case completed
    case byProject(UUID)
}
