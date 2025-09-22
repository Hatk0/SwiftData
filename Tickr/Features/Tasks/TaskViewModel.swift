import Foundation
import SwiftData

@Observable
@MainActor
final class TaskViewModel {
    
    var tasks: [TaskItem] = []
    var isLoading: Bool = false
    
    private var taskService: TaskService?

    func setContext(_ context: ModelContext) {
        taskService = TaskService(context: context)
        
        Task {
            await loadTasks()
        }
    }

    func loadTasks(search: String = "") async {
        guard !isLoading, let service = taskService else { return }
        
        isLoading = true
        
        try? await Task.sleep(nanoseconds: 100_000_000)
        tasks = service.fetchTasks(search: search)
        
        isLoading = false
    }

    func addTask(title: String) async {
        guard let service = taskService else { return }
        
        service.addTask(title: title)
        await loadTasks()
    }

    func updateTask(
        _ task: TaskItem,
        title: String? = nil,
        isDone: Bool? = nil
    ) async {
        guard let service = taskService else { return }
        
        service.updateTask(task, title: title, isDone: isDone)
        await loadTasks()
    }

    func toggleTask(_ task: TaskItem) async {
        guard let service = taskService else { return }
        
        service.toggleTask(task)
        await loadTasks()
    }

    func deleteTasks(at offsets: IndexSet) async {
        guard let service = taskService else { return }
        
        offsets.map { tasks[$0] }.forEach { service.deleteTask($0) }
        await loadTasks()
    }
}
