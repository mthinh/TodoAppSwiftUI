//
//  TodoViewModel.swift
//  TodoApp
//
//  Created by Mai Thinh on 13/3/25.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var items: [TodoModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "todo_list"

    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([TodoModel].self, from: data)
        else {
            return
        }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewItem(title: String) {
        items.append(TodoModel(title: title, isCompleted: false))
    }
    
    func updateItem(todo: TodoModel) {
        if let index = items.firstIndex(where: { $0.id == todo.id
        }) {
            items[index] = todo.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
