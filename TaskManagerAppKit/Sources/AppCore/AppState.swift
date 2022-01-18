//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/16/22.
//

import Foundation
import ComposableArchitecture
import Models
import ProjectsCore

public struct SampleEnvironment {
    public init() {}
}

public struct SampleState {
    public var tasks: [Task] = []

    public init(tasks: [Task]) {
        self.tasks = tasks
    }
}

public enum SampleAction {}

public let sampleReducer = Reducer<SampleState, SampleAction, SampleEnvironment> { _, action, _ in
  switch action {
  }
}

public let appReducer = Reducer.combine(
    sampleReducer.pullback(
        state: \AppState.sampleTasks,
        action: /AppAction.sample,
        environment: { (_: AppEnvironment) in SampleEnvironment() }
    ),
    projectsReducer.pullback(
        state: \AppState.appProjects,
        action: /AppAction.project,
        environment: { (_: AppEnvironment) in ProjectsEnvironment() }
    )
)

public enum AppAction {
    case sample(SampleAction)
    case project(ProjectAction)
}

public struct AppState {
    public var projects: [Project] = []

    public var tasks: [Task] = [
        Task(title: "First Item"),
        Task(title: "Second Item"),
        Task(title: "Third Item")
    ]

    public init() { }

    public var appProjects: ProjectsState {
        get {
            .init(projects: self.projects)
        }
        set {
            self.projects = newValue.projects
        }
    }

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
        return lhs.tasks == rhs.tasks && lhs.projects == rhs.projects
    }
}

public struct AppEnvironment {
    public init() {}
}
