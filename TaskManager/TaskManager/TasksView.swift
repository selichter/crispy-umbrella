//
//  TasksView.swift
//  TaskManager
//
//  Created by Sarah Lichter on 1/18/22.
//

import SwiftUI
import ComposableArchitecture
import AppCore
import Models

struct TasksView: View {
    let store: Store<AppState, AppAction>
    let project: Project

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                HStack {
                    Text(project.name)
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "plus.circle")
                        .onTapGesture {
                            viewStore.send(.tasks(.addButtonTapped(UUID(), project.id)))
                        }
                }
                .padding(.bottom)

                ForEachStore(self.store.scope(state: \.tasks,
                                              action: AppAction.task(index:action:)),
                             content: TaskRow.init(store:)
                                             )
                Spacer()
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()),
                  project: Project(id: UUID(),
                                   name: "Test Project",
                                   tasks: []))
    }
}
