import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    @State private var title: String = ""
    
    var onDismiss: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task title", text: $title)
                
                Button("Add") {
                    guard !title.isEmpty else { return }
                    taskViewModel.addTask(title: title)
                    onDismiss()
                }
                .padding()
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onDismiss()
                    }
                }
            }
        }
    }
}
