//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/16/22.
//

import Foundation
import ComposableArchitecture
import Models

public struct SampleEnvironment {
    public init() {}
}

public struct SampleState {
    public var tasks: [Task] = []
    
    public init(tasks: [Task]) {
        self.tasks = tasks
    }
}

public enum SampleAction {
}

public let sampleReducer = Reducer<SampleState, SampleAction, SampleEnvironment> { state, action, _ in
  switch action {
  }
}



public let appReducer = Reducer.combine(
    sampleReducer.pullback(
        state: \AppState.sampleTasks,
        action: /AppAction.sample,
        environment: { (_: AppEnvironment) in SampleEnvironment() }
    )
)

public enum AppAction {
    case sample(SampleAction)
}

public struct AppState {
    public var tasks: [Task] = [
        Task(title: "First Item"),
        Task(title: "Second Item"),
        Task(title: "Third Item")
    ]
    
    public init() { }

    public var sampleTasks: SampleState {
        get {
            .init(tasks: self.tasks)
        }
        set {
            self.tasks = newValue.tasks
        }
    }
    
}

extension AppState: Equatable {
    public static func == (lhs: AppState, rhs: AppState) -> Bool {
        return lhs.tasks == rhs.tasks
    }
}


public struct AppEnvironment {
    public init() {}
}
