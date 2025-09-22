import SwiftUI

extension View {
    
    func actionButtonStyle(background: Color, action: @escaping () -> Void) -> some View {
        modifier(ActionButtonStyle(background: background, action: action))
    }
    
    func cardTextFieldStyle() -> some View {
        modifier(CardTextFieldStyle())
    }
}
