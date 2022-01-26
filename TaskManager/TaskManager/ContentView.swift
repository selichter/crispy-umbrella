//
//  ContentView.swift
//  TaskManager
//
//  Created by Sarah Lichter on 1/16/22.
//

import SwiftUI
import Models
import AppCore
import ComposableArchitecture

struct ContentView: View {
    let store: Store<AppState, AppAction>
    @State var sheetIsPresented = false

    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Projects")
                            .font(.largeTitle)
                        Spacer()
                        Image(systemName: "plus.circle")
                            .onTapGesture {
                                sheetIsPresented.toggle()
                            }
                    }

                    ForEach(viewStore.projects) { project in
                        NavigationLink(destination: TasksView(store: store, project: project)) {
                            Text(project.name)
                        }
                    }
                    Spacer()
                }.sheet(isPresented: $sheetIsPresented) {
                    AddProject(store: store, sheetIsPresented: $sheetIsPresented)
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()))
    }
}
