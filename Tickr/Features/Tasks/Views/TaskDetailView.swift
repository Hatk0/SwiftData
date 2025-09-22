import SwiftUI

struct TaskDetailView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    @Bindable var task: TaskItem
    
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Title", text: $task.title)
                .cardTextFieldStyle()
            
            Text("Save")
                .actionButtonStyle(background: AppColors.primaryColor) {
                    Task {
                        await taskViewModel.updateTask(task, title: task.title)
                        onDismiss()
                    }
                }
            
            Text("Delete")
                .actionButtonStyle(background: .red) {
                    Task {
                        await taskViewModel.deleteTasks(at: IndexSet(integer: taskViewModel.tasks.firstIndex(of: task) ?? 0))
                        onDismiss()
                    }
                }
            
            Spacer()
        }
        .padding([.top, .horizontal])
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Task Details")
    }
}
