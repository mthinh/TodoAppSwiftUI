//
//  TodoModel.swift
//  TodoApp
//
//  Created by Mai Thinh on 13/3/25.
//

import Foundation

struct TodoModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoModel {
        return TodoModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
