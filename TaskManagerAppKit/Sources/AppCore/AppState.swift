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
import TasksCore
import TaskCore

public let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    taskReducer.forEach(
        state: \AppState.tasks,
        action: /AppAction.task(index:action:),
        environment: { _  in TaskEnvironment()}
    ),
    tasksReducer.pullback(
        state: \AppState.appTasks,
        action: /AppAction.tasks,
        environment: { (_: AppEnvironment) in TasksEnvironment() }
    ),
    projectsReducer.pullback(
        state: \AppState.appProjects,
        action: /AppAction.project,
        environment: { (_: AppEnvironment) in ProjectsEnvironment() }
    )
)

public enum AppAction: Equatable {
    public static func == (lhs: AppAction, rhs: AppAction) -> Bool {
        return lhs.self == rhs.self
    }

    case task(index: Int, action: TaskAction)
    case tasks(TasksAction)
    case project(ProjectAction)
}

public struct AppState {
    public var projects: [Project] = []

    public var tasks: [Task] = []

    public init() { }

    public var appProjects: ProjectsState {
        get {
            .init(projects: self.projects)
        }
        set {
            self.projects = newValue.projects
        }
    }

    public var appTasks: TasksState {
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
