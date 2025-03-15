//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Mai Thinh on 13/3/25.
//

import SwiftUI

struct AddTodoView: View {
  @Environment(\.presentationMode) var presentationMode
  @State var todoValue: String = ""
  @EnvironmentObject var todoListViewModel: TodoListViewModel
  @State var alertTitle: String = ""
  @State var showAlert: Bool = false

  var body: some View {
    ScrollView {
      VStack {
        TextField("Type something here...", text: $todoValue)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(uiColor: UIColor.secondarySystemBackground))
          .cornerRadius(10)
        Button(
          action: saveButtonPressed,
          label: {
            Text("Save".uppercased())
              .foregroundColor(.white)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(Color.accentColor)
              .cornerRadius(10)
          })
      }
      .padding()

    }
    .navigationTitle("Add a todo ✏️")
    .alert(isPresented: $showAlert, content: getAlert)
  }

  func saveButtonPressed() {
    if isValidValue() {
      todoListViewModel.addNewItem(title: todoValue)
      presentationMode.wrappedValue.dismiss()
    }
  }

  func isValidValue() -> Bool {
    if todoValue.count < 3 {
      alertTitle = "Youre new todo item must be at least 3 characters long 🥸"
      showAlert.toggle()
      return false
    }
    return true
  }

  func getAlert() -> Alert {
    return Alert(title: Text(alertTitle))
  }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddTodoView()
            }
            .preferredColorScheme(.light)
            .environmentObject(TodoListViewModel())
            NavigationView {
                AddTodoView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(TodoListViewModel())
        }
    }
}