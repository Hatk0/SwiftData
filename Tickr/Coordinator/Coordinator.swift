import SwiftUI

@Observable
final class Coordinator {
    
    var path = NavigationPath()
    var sheet: Sheet?
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .tasks:
            TaskListView()
        case .taskDetails(let task):
            TaskDetailView(task: task)
        }
    }
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .addTask:
            AddTaskView()
        }
    }
}

private extension Coordinator {
    
    func push(_ screen: Screen) {
        self.path.append(screen)
    }
    
    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
}
