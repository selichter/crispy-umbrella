//
//  TaskRow.swift
//  TaskManager
//
//  Created by Sarah Lichter on 1/19/22.
//

import SwiftUI
import ComposableArchitecture
import AppCore
import Models
import TaskCore

struct TaskRow: View {
    let store: Store<Task, TaskAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
                HStack {
                    Button(action: { viewStore.send(.toggleCompleted) }) {
                        Image(systemName: viewStore.isCompleted ? "circle.fill" : "circle")
                    }
                    
                    Text(viewStore.title)
                }
        }
    }
}
