//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Mai Thinh on 13/3/25.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var todoListViewModel: TodoListViewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(todoListViewModel)
        }
    }
}
