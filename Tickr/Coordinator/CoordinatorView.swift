import SwiftUI

struct CoordinatorView: View {
    @State private var coordinator = Coordinator()
    
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
    }
}
