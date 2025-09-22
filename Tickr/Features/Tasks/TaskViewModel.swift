import Foundation
import SwiftData

@Observable
@MainActor
final class TaskViewModel {
    
    var tasks: [TaskItem] = []
    private let taskService: TaskService
    
    init(taskService: TaskService) {
        self.taskService = taskService
        loadTasks()
    }
    
    func loadTasks(search: String = "") {
        tasks = taskService.fetchTasks(search: search)
    }
    
    
    func addTask(title: String) {
        taskService.addTask(title: title)
        loadTasks()
    }
    
    func updateTask(
        _ task: TaskItem,
        title: String? = nil,
        isDone: Bool? = nil
    ) {
        taskService.updateTask(
            task,
            title: title,
            isDone: isDone
        )
        loadTasks()
    }
    
    func toggleTask(_ task: TaskItem) {
        taskService.toggleTask(task)
        loadTasks()
    }
    
    func deleteTasks(at offsets: IndexSet) {
        offsets.map { tasks[$0] }.forEach { taskService.deleteTask($0) }
        loadTasks()
    }
}
