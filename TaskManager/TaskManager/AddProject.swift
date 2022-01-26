//
//  AddProject.swift
//  TaskManager
//
//  Created by Sarah Lichter on 1/18/22.
//

import SwiftUI
import ComposableArchitecture
import AppCore

struct AddProject: View {
    let store: Store<AppState, AppAction>
    @State private var projectName: String = ""
    @Binding var sheetIsPresented: Bool

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Text("Project Name")
                TextField("", text: $projectName,
                                        onEditingChanged: { changing in
                                          if !changing {
                                              self.projectName = self.projectName.trimmingCharacters(in: .whitespacesAndNewlines)
                                          }})
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("projectTextField")
                Button("Create Project") {
                    viewStore.send(.project(.createProject(UUID(), projectName)))
                    sheetIsPresented.toggle()

                }
               Spacer()
            }.padding(16)
        }

    }
}

struct AddProject_Previews: PreviewProvider {
    static var previews: some View {
        AddProject(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()), sheetIsPresented: .constant(true))
    }
}
