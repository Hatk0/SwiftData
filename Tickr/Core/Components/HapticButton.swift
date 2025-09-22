import SwiftUI

struct HapticButton<Label: View>: View {
    enum Style {
        case impact(UIImpactFeedbackGenerator.FeedbackStyle)
        case notification(UINotificationFeedbackGenerator.FeedbackType)
        case selection
        case none
    }
    
    private let style: Style
    private let action: () -> Void
    private let label: () -> Label
    
    init(
        style: Style = .impact(.light),
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.style = style
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button {
            triggerHaptic()
            action()
        } label: {
            label()
        }
    }
}

private extension HapticButton {
    
    func triggerHaptic() {
        switch style {
        case .impact(let feedbackStyle):
            HapticManager.impact(feedbackStyle)
        case .notification(let type):
            HapticManager.notification(type)
        case .selection:
            HapticManager.selection()
        case .none:
            break
        }
    }
}
