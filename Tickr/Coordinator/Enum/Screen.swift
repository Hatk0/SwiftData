import Foundation

enum Screen: Hashable {
    case tasks
    case addTask
    case taskDetails(TaskItem)
}
