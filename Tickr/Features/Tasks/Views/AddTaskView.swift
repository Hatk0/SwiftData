import SwiftUI

struct AddTaskView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    @State private var title: String = ""
    
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Title", text: $title)
                .cardTextFieldStyle()
            
            Text("Add Task")
                .actionButtonStyle(background: AppColors.primaryColor) {
                    guard !title.isEmpty else { return }
                    
                    Task {
                        await taskViewModel.addTask(title: title)
                        onDismiss()
                    }
                }
            
            Spacer()
        }
        .padding([.top, .horizontal])
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Add Task")
    }
}
