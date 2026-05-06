import SwiftUI

// LazzyMerlin DS · Spinner
// 取代 SwiftUI ProgressView (loading) · 系統小圈圈
// 結構：trimmed arc + AngularGradient (brand 色頭尾漸層) + 線性連續旋轉

struct LMSpinner: View {

    var size: CGFloat = 24
    var lineWidth: CGFloat = 3
    var color: Color = .primaryBrand

    @State private var isAnimating: Bool = false

    var body: some View {
        Circle()
            .trim(from: 0.10, to: 0.95)
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [color.opacity(0.0), color]),
                    center: .center
                ),
                style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
            )
            .frame(width: size, height: size)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(
                .linear(duration: 0.9).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear { isAnimating = true }
    }
}
