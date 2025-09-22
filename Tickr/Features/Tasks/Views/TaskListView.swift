import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    @Environment(\.modelContext) private var context
    
    var onAddTask: () -> Void
    var onShowDetails: (TaskItem) -> Void
    
    var body: some View {
        List {
            ForEach(taskViewModel.tasks) { task in
                HStack {
                    Text(task.title)
                    Spacer()
                    Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            taskViewModel.toggleTask(task)
                        }
                }
                .onTapGesture {
                    onShowDetails(task)
                }
            }
            .onDelete { offsets in
                taskViewModel.deleteTasks(at: offsets)
            }
        }
        .toolbar {
            Button("Add") {
                onAddTask()
            }
        }
        .navigationTitle("Tasks")
    }
}
