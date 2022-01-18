//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/17/22.
//

import Foundation
import Models
import ComposableArchitecture

public enum ProjectAction {
    case createProject(UUID, String)
}

public struct ProjectsEnvironment {
    public init() {}
}

public struct ProjectsState {
    public var projects: [Project] = []

    public init(projects: [Project]) {
        self.projects = projects
    }
}

extension ProjectsState: Equatable {
    public static func == (lhs: ProjectsState, rhs: ProjectsState) -> Bool {
        return lhs.projects == rhs.projects
    }
}

public let projectsReducer = Reducer<ProjectsState, ProjectAction, ProjectsEnvironment> { state, action, _ in
  switch action {
  case let .createProject(id, name):
      let project = Project(id: id, name: name)
      state.projects.append(project)
      return .none
  }
}
