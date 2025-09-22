import Foundation

enum Sheet: Identifiable {
    case addTask
    
    var id: String { UUID().uuidString }
}
