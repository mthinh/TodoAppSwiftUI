//
//  NavigationView.swift
//  TodoApp
//
//  Created by Mai Thinh on 13/3/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    var body: some View {
        ZStack {
            if(todoListViewModel.items.isEmpty) {
                EmptyView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(todoListViewModel.items) { todo in
                        TodoItemView(todo: todo)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    todoListViewModel.updateItem(todo: todo)
                                }
                            }
                    }
                    .onDelete(perform: todoListViewModel.deleteItem)
                    .onMove(perform: todoListViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddTodoView())
        )
        Spacer()
        
    }

}



struct ListView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView {
            ListView()
        }
        .environmentObject(TodoListViewModel())
    }
}
