//
//  AddTask.swift
//  TaskManager
//
//  Created by Sarah Lichter on 1/18/22.
//

import SwiftUI
import ComposableArchitecture
import AppCore

struct AddTask: View {
    let store: Store<AppState, AppAction>
    @State private var taskTitle: String = ""
    @Binding var sheetIsPresented: Bool
    let projectId: UUID
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Text("Task")
                TextField("", text: $taskTitle,
                                        onEditingChanged: { changing in
                                          if !changing {
                                              self.taskTitle = self.taskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
                                          }})
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("taskTitleTextField")
                Button("Add Task") {
                    viewStore.send(.tasks(.createTask(UUID(), taskTitle, projectId)))
                    sheetIsPresented.toggle()
                    
                }
               Spacer()
            }.padding(16)
        }

    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()),
                sheetIsPresented: .constant(true),
                projectId: UUID())
    }
}
