import Foundation
import SwiftData

@Observable
@MainActor
final class TaskViewModel {
    
    var tasks: [TaskItem] = []
    
    private var taskService: TaskService?

    func setContext(_ context: ModelContext) {
        taskService = TaskService(context: context)
        loadTasks()
    }

    func loadTasks(search: String = "") {
        guard let service = taskService else { return }
        tasks = service.fetchTasks(search: search)
    }

    func addTask(title: String) {
        guard let service = taskService else { return }
        service.addTask(title: title)
        loadTasks()
    }

    func updateTask(_ task: TaskItem, title: String? = nil, isDone: Bool? = nil) {
        guard let service = taskService else { return }
        service.updateTask(task, title: title, isDone: isDone)
        loadTasks()
    }

    func toggleTask(_ task: TaskItem) {
        guard let service = taskService else { return }
        service.toggleTask(task)
        loadTasks()
    }

    func deleteTasks(at offsets: IndexSet) {
        guard let service = taskService else { return }
        offsets.map { tasks[$0] }.forEach { service.deleteTask($0) }
        loadTasks()
    }
}
