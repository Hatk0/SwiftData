import Foundation
import SwiftData

@Model
class TaskItem {
    @Attribute(.unique) var id: UUID
    var title: String
    var isDone: Bool
    var createdAt: Date
    
    init(title: String, isDone: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
        self.createdAt = Date()
    }
}
