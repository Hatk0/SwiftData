import SwiftUI

struct ActionButtonStyle: ViewModifier {
    var background: Color
    var action: () -> Void
    
    func body(content: Content) -> some View {
        HapticButton(style: .impact(.medium), action: action) {
            content
                .font(AppFonts.body)
                .foregroundStyle(AppColors.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct CardTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(AppColors.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .font(AppFonts.body)
    }
}
