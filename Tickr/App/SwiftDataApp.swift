import SwiftUI
import SwiftData

@main
struct SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
        .modelContainer(for: TaskItem.self)
    }
}
