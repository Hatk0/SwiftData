import SwiftUI
import SwiftData

@Observable
final class Coordinator {
    
    var path = NavigationPath()
    var sheet: Sheet?
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .tasks:
            TaskListView { [weak self] in
                self?.present(.addTask)
            } onShowDetails: {  [weak self] task in
                self?.push(.taskDetails(task))
            }
        case .taskDetails(let task):
            TaskDetailView(task: task) { [weak self] in
                self?.pop()
            }
        }
    }
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .addTask:
            AddTaskView { [weak self] in
                self?.dismissSheet()
            }
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
