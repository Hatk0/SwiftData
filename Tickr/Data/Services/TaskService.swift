import Foundation
import SwiftData

@MainActor
final class TaskService {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Save error: \(error)")
        }
    }
    
    func fetchTasks(search: String = "", sortAscending: Bool = true) -> [TaskItem] {
        var descriptor = FetchDescriptor<TaskItem>(predicate: search.isEmpty ? nil : #Predicate { $0.title.localizedStandardContains(search) })
        descriptor.sortBy = [.init(\.createdAt, order: sortAscending ? .forward : .reverse)]
       
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }
    
    func addTask(title: String) {
        let task = TaskItem(title: title)
        context.insert(task)
        saveContext()
    }
    
    func updateTask(
        _ task: TaskItem,
        title: String? = nil,
        isDone: Bool? = nil
    ) {
        guard title != nil || isDone != nil else { return }
        
        task.title = title ?? task.title
        task.isDone = isDone ?? task.isDone
        
        saveContext()
    }
    
    func toggleTask(_ task: TaskItem) {
        task.isDone.toggle()
        saveContext()
    }
    
    func deleteTask(_ task: TaskItem) {
        context.delete(task)
        saveContext()
    }
}
