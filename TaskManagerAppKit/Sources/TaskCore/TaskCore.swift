//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/20/22.
//

import Foundation
import ComposableArchitecture
import Models

public enum TaskAction: Equatable {
    case toggleCompleted
    case taskTitleChanged(String)
}

public struct TaskEnvironment {
    public init() {}
}

public let taskReducer = Reducer<Task, TaskAction, TaskEnvironment> { state, action, _ in
  switch action {
  case .taskTitleChanged(let title):
      state.title = title
      return .none
  case .toggleCompleted:
    state.isCompleted.toggle()
    return .none
  }
}
