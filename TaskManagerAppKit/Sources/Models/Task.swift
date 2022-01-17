//
//  File.swift
//  
//
//  Created by Sarah Lichter on 1/16/22.
//

import Foundation

public struct Task: Identifiable {
    public let id: UUID = UUID()
    public var title: String
    public var isCompleted: Bool = false
    
    public init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

extension Task: Equatable {
    public static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}
