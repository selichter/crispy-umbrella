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
}

public struct TaskEnvironment {
    public init() {}
}

public let taskReducer = Reducer<Task, TaskAction, TaskEnvironment> { state, action, environment in
  switch action {
  case .toggleCompleted:
    state.isCompleted.toggle()
    return .none
  }
}
