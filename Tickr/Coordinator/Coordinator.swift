import SwiftUI
import SwiftData

@Observable
final class Coordinator {
    
    var path = NavigationPath()
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .tasks:
            TaskListView { [weak self] in
                self?.push(.addTask)
            } onShowDetails: { [weak self] task in
                self?.push(.taskDetails(task))
            }
        case .addTask:
            AddTaskView { [weak self] in
                self?.pop()
            }
        case .taskDetails(let task):
            TaskDetailView(task: task) { [weak self] in
                self?.pop()
            }
        }
    }
}

private extension Coordinator {
    
    func push(_ screen: Screen) {
        self.path.append(screen)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
