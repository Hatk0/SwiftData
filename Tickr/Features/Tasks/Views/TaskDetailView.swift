import SwiftUI
import SwiftData

struct TaskDetailView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    @Bindable var task: TaskItem
    
    var onDismiss: () -> Void
    
    var body: some View {
        Form {
            TextField("Title", text: $task.title)
            Toggle("Done", isOn: $task.isDone)
            
            Button("Save") {
                taskViewModel.updateTask(task, title: task.title, isDone: task.isDone)
                onDismiss()
            }
            .padding()
        }
        .navigationTitle("Task Details")
    }
}
