//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Ontiretse Motlagale on 2026/05/27.
//

import Testing

import XCTest
@testable import TodoApp

final class TodoViewModelTests: XCTestCase {

    func test_addTodo() {
        let vm = TodoViewModel()

        vm.addTodo(title: "Test")

        XCTAssertEqual(vm.todos.count, 1)
        XCTAssertEqual(vm.todos.first?.title, "Test")
    }

    func test_toggleTodo() {
        let vm = TodoViewModel()
        vm.addTodo(title: "Test")

        let id = vm.todos.first!.id
        vm.toggleTodo(id: id)

        XCTAssertTrue(vm.todos.first!.isDone)
    }
}
