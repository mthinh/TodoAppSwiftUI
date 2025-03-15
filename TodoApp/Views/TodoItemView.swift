//
//  TodoItemView.swift
//  TodoApp
//
//  Created by Mai Thinh on 13/3/25.
//

import SwiftUI

struct TodoItemView: View {
    let todo: TodoModel

    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text(todo.title)
        }
        .font(.title2)
        .padding(8)
    }
}

#Preview {
    TodoItemView(todo: TodoModel(title: "hello", isCompleted: true))
}
