//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/16/22.
//

import Foundation

public struct Task: Identifiable {
    public var id: UUID
    public var title: String
    public var isCompleted: Bool
    public var projectId: UUID

    public init(id: UUID = UUID(),
                title: String,
                isCompleted: Bool = false,
                projectId: UUID
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.projectId = projectId
    }
}

extension Task: Equatable {
    public static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}
