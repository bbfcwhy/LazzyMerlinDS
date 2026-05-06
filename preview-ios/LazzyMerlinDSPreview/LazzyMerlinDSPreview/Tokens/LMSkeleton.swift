import SwiftUI

// LazzyMerlin DS · Skeleton loader
// 取代各 view 的 inline `skeleton()` helper
// 結構：圓角矩形 + borderSubtle fill + 可選 shimmer 脈動動畫

struct LMSkeleton: View {

    var width: CGFloat? = nil
    var height: CGFloat = 12
    var radius: CGFloat = 6
    var animated: Bool = true

    @State private var pulse: Bool = false

    var body: some View {
        RoundedRectangle(cornerRadius: radius, style: .continuous)
            .fill(Color.borderSubtle)
            .frame(width: width, height: height)
            .opacity(animated ? (pulse ? 1.0 : 0.55) : 1.0)
            .animation(
                animated
                    ? .easeInOut(duration: 1.2).repeatForever(autoreverses: true)
                    : .default,
                value: pulse
            )
            .onAppear { if animated { pulse = true } }
    }
}
