import SwiftUI

// LazzyMerlin DS · Spinner
// 取代 SwiftUI ProgressView (loading) · 系統小圈圈
// 結構：trimmed arc + AngularGradient (brand 色頭尾漸層) + tactile noise + 線性連續旋轉
//
// ChronoPath landing（2026-06）回饋採用版：加 optional label（對齊原生 ProgressView("…")）
// + arc 上 tactile noise（視覺語彙呼應其他 tactile 元件）。reduceMotion 時停轉。
//
// API：
//   LMSpinner()                          // 預設 brand tint · 40pt
//   LMSpinner(label: "載入中…")           // 帶下方說明文字
//   LMSpinner(tint: .white, size: 48)    // 暗色沈浸情境白 tint
//   LMSpinner(size: 22, lineWidth: 3)    // 顯式線寬（否則由 size 推算）

struct LMSpinner: View {
    var tint: Color = .primaryBrand
    var size: CGFloat = 40
    var lineWidth: CGFloat? = nil
    var label: String? = nil

    @State private var isSpinning = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private var resolvedLineWidth: CGFloat { lineWidth ?? max(2, size * 0.12) }
    private var trimEnd: CGFloat { 0.72 }

    var body: some View {
        VStack(spacing: LMSpacing.md) {
            arc
            if let label {
                Text(label)
                    .font(.footnote)
                    .foregroundStyle(Color.inkMutedSubdued)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label ?? "載入中")
        .accessibilityAddTraits(.updatesFrequently)
    }

    private var arc: some View {
        Circle()
            .trim(from: 0, to: trimEnd)
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [tint.opacity(0.0), tint.opacity(0.7), tint]),
                    center: .center
                ),
                style: StrokeStyle(lineWidth: resolvedLineWidth, lineCap: .round)
            )
            .overlay(noiseOverlay)
            .rotationEffect(.degrees(isSpinning ? 360 : 0))
            .frame(width: size, height: size)
            .onAppear {
                guard !reduceMotion else { return }
                withAnimation(.linear(duration: 0.9).repeatForever(autoreverses: false)) {
                    isSpinning = true
                }
            }
    }

    // tactile noise 疊在弧上、與 TactileMaterial 同一張 tile 圖
    private var noiseOverlay: some View {
        Image("TactileNoise")
            .resizable(resizingMode: .tile)
            .opacity(0.18)
            .blendMode(.overlay)
            .mask(
                Circle()
                    .trim(from: 0, to: trimEnd)
                    .stroke(style: StrokeStyle(lineWidth: resolvedLineWidth, lineCap: .round))
            )
            .allowsHitTesting(false)
    }
}

#Preview("LMSpinner") {
    VStack(spacing: 40) {
        LMSpinner()
        LMSpinner(label: "載入中…")
        LMSpinner(size: 24)
        ZStack {
            LinearGradient(colors: [.earthOchre, .primaryBrand], startPoint: .top, endPoint: .bottom)
            LMSpinner(tint: .white, size: 48)
        }
        .frame(height: 140)
    }
    .padding(40)
}
