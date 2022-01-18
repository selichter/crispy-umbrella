//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/17/22.
//

import Foundation

public struct Project: Identifiable {
    public let id: UUID
    public let name: String
    public var tasks: [Task]

    public init(id: UUID = UUID(), name: String, tasks: [Task] = []) {
        self.id = id
        self.name = name
        self.tasks = tasks
    }

}

extension Project: Equatable {
    public static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.tasks == rhs.tasks
    }
}
