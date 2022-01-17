//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Sarah Lichter on 1/16/22.
//

import SwiftUI
import ComposableArchitecture
import AppCore


@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(
                initialState: AppState(),
                reducer: appReducer,
                environment: AppEnvironment()
              )
            )
        }
    }
}
