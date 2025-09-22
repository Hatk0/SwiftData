import SwiftUI

struct TaskListView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    
    var onAddTask: () -> Void
    var onShowDetails: (TaskItem) -> Void
    
    var body: some View {
        ZStack {
            if taskViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.5)
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(taskViewModel.tasks) { task in
                            HStack(spacing: 16) {
                                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(task.isDone ? AppColors.done : AppColors.pending)
                                    .font(.title2)
                                    .onTapGesture {
                                        Task {
                                            HapticManager.selection()
                                            await taskViewModel.toggleTask(task)
                                        }
                                    }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(task.title)
                                        .font(AppFonts.body)
                                        .foregroundStyle(AppColors.textPrimary)
                                    
                                    Text(task.createdAt.formattedString())
                                        .font(AppFonts.caption)
                                        .foregroundStyle(AppColors.textSecondary)
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(AppColors.cardBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(
                                color: Color.black.opacity(0.05),
                                radius: 2,
                                x: 0,
                                y: 2
                            )
                            .onTapGesture {
                                HapticManager.impact(.light)
                                onShowDetails(task)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Tasks")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HapticButton(style: .impact(.medium)) {
                    onAddTask()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(AppColors.primaryColor)
                }
            }
        }
        .task {
            await taskViewModel.loadTasks()
        }
    }
}
