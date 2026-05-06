import SwiftUI

// LazzyMerlin DS · Toast (inline 通知條)
// 取代 FeedbackView / OverlaysView 各自定義的 toast(...) helper
// 結構：HStack [icon (color tint) + text] + tactileBase 容器

struct LMToast: View {

    let text: String
    let icon: String        // SF Symbol name
    var iconColor: Color = .primaryBrand
    var radius: CGFloat = LMRadius.button

    var body: some View {
        HStack(spacing: LMRadius.md) {
            Image(systemName: icon)
                .font(.lmBodySmall.weight(.semibold))
                .foregroundStyle(iconColor)
            Text(text)
                .font(.lmBody)
                .foregroundStyle(Color.ink)
            Spacer()
        }
        .padding(.vertical, LMSpacing.md)
        .padding(.horizontal, LMSpacing.lg)
        .tactileBase(radius: radius)
    }
}
