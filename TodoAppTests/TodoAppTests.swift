import XCTest
@testable import TodoApp

final class TodoViewModelTests: XCTestCase {

    func test_addTodo_shouldIncreaseCount() {
        let vm = TodoViewModel()

        vm.addTodo(title: "Buy milk")

        XCTAssertEqual(vm.todos.count, 1)
    }

    func test_addTodo_shouldStoreCorrectTitle() {
        let vm = TodoViewModel()

        vm.addTodo(title: "Buy milk")

        XCTAssertEqual(vm.todos.first?.title, "Buy milk")
    }

    func test_toggleTodo_shouldMarkTodoAsDone() {
        let vm = TodoViewModel()

        vm.addTodo(title: "Study Swift")
        let id = vm.todos.first!.id

        vm.toggleTodo(id: id)

        XCTAssertTrue(vm.todos.first!.isDone)
    }

    func test_toggleTodo_shouldToggleBackToNotDone() {
        let vm = TodoViewModel()

        vm.addTodo(title: "Study Swift")
        let id = vm.todos.first!.id

        vm.toggleTodo(id: id)
        vm.toggleTodo(id: id)

        XCTAssertFalse(vm.todos.first!.isDone)
    }

    func test_toggleTodo_withInvalidID_shouldNotCrash() {
        let vm = TodoViewModel()

        vm.addTodo(title: "Study Swift")

        let randomID = UUID()
        vm.toggleTodo(id: randomID)

        XCTAssertEqual(vm.todos.count, 1)
        XCTAssertFalse(vm.todos.first!.isDone)
    }
}
