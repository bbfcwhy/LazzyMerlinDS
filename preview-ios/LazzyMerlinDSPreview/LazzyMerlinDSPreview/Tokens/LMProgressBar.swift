import SwiftUI

// LazzyMerlin DS · Progress Bar (determinate)
// 取代 SwiftUI ProgressView(value:) · 系統 determinate 進度條
// 結構：capsule track + brand 漸層 fill + tactile noise（視覺語彙呼應 LMSpinner）
// 對應 §15.7.2 Progress Indicator 的 iOS 實作（web linear progress 的雙軌等價）
//
// 來源：ChronoPath landing（2026-06）回饋，DS 原本只有 web spec、無 iOS 實作。
//
// API：
//   LMProgressBar(value: 0.4)                              // 預設 · brand fill · 6pt · track surface2
//   LMProgressBar(value: x, height: 12, track: .bgMuted)   // 粗版變體
//
// 對齊原生 ProgressView(value:)：determinate、value clamp 0...1、
// accessibilityValue 回報百分比、value 變動 easeOut 動畫（reduceMotion 時關閉）。

struct LMProgressBar: View {
    var value: Double
    var height: CGFloat = 6
    var track: Color = .surface2

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private var clamped: Double { min(max(value, 0), 1) }

    private var brandFill: LinearGradient {
        LinearGradient(
            colors: [Color.primaryBrand.opacity(0.82), Color.primaryBrand],
            startPoint: .leading, endPoint: .trailing
        )
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(track)
                Capsule()
                    .fill(brandFill)
                    .overlay(noiseOverlay)
                    .frame(width: max(0, geo.size.width * clamped))
                    .animation(reduceMotion ? nil : .easeOut(duration: 0.25), value: clamped)
            }
        }
        .frame(height: height)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("進度")
        .accessibilityValue("\(Int(clamped * 100))%")
        .accessibilityAddTraits(.updatesFrequently)
    }

    // tactile noise 疊在 fill 上、與 TactileMaterial 同一張 tile 圖、視覺語彙呼應 LMSpinner
    private var noiseOverlay: some View {
        Image("TactileNoise")
            .resizable(resizingMode: .tile)
            .opacity(0.18)
            .blendMode(.overlay)
            .mask(Capsule())
            .allowsHitTesting(false)
    }
}

#Preview("LMProgressBar") {
    VStack(spacing: 28) {
        VStack(alignment: .leading, spacing: 6) {
            Text("預設 · 6pt · track surface2").font(.caption)
            LMProgressBar(value: 0.0)
            LMProgressBar(value: 0.4)
            LMProgressBar(value: 1.0)
        }
        VStack(alignment: .leading, spacing: 6) {
            Text("粗版 · 12pt · track bgMuted").font(.caption)
            LMProgressBar(value: 0.0, height: 12, track: .bgMuted)
            LMProgressBar(value: 0.4, height: 12, track: .bgMuted)
            LMProgressBar(value: 1.0, height: 12, track: .bgMuted)
        }
    }
    .padding(40)
    .background(Color.bg)
}
