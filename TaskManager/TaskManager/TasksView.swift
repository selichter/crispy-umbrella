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
    @State var sheetIsPresented = false
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
                            sheetIsPresented.toggle()
                        }
                }
                .padding(.bottom)
                
                ForEachStore(self.store.scope(state: \.tasks,
                                              action: AppAction.task(index:action:)),
                             content: TaskRow.init(store:)
                                             )
                Spacer()
            }.sheet(isPresented: $sheetIsPresented) {
                AddTask(store: store,
                        sheetIsPresented: $sheetIsPresented,
                        projectId: project.id)
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
