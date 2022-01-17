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
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ForEach(viewStore.tasks) { task in
                Text(task.title)
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
