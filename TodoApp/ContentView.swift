//
//  ContentView.swift
//  TodoApp
//
//  Created by Ontiretse Motlagale on 2026/05/27.
//

import SwiftUI

import Foundation


struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool = false
}

@Observable
class TodoViewModel {
    var todos: [Todo] = []

    func addTodo(title: String) {
        todos.append(Todo(title: title))
    }

    func toggleTodo(id: UUID) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].isDone.toggle()
    }
}


struct ContentView: View {
    @State var vm = TodoViewModel()
    @State private var text = ""

    var body: some View {
        VStack {
            HStack {
                TextField("New todo", text: $text)
                Button("Add") {
                    vm.addTodo(title: text)
                    text = ""
                }
            }
            .padding()

            List {
                ForEach(vm.todos) { todo in
                    HStack {
                        Text(todo.title)
                        Spacer()
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    }
                    .onTapGesture {
                        vm.toggleTodo(id: todo.id)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
