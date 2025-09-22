import Foundation

enum Screen: Hashable {
    case tasks
    case taskDetails(TaskItem)
}
