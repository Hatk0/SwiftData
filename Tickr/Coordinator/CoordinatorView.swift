import SwiftUI

struct CoordinatorView: View {
    @Environment(\.modelContext) private var context
    
    @State private var coordinator = Coordinator()
    @State private var taskViewModel = TaskViewModel()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.tasks)
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.build(screen)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet)
                }
        }
        .environment(taskViewModel)
        .task {
            taskViewModel.setContext(context)
        }
    }
}
