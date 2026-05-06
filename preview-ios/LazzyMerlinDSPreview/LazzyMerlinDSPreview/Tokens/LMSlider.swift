import SwiftUI

// LazzyMerlin DS · Slider
// 取代 SwiftUI Slider · 系統 track + 白色 knob + Liquid Glass shadow
// 結構：inset 凹軌 + brand 色 fill + tactile raised knob

struct LMSlider: View {

    @Binding var value: Double
    let range: ClosedRange<Double>
    var step: Double = 0
    var trackHeight: CGFloat = 6
    var knobSize: CGFloat = 22

    @Environment(\.colorScheme) private var colorScheme
    @State private var isDragging: Bool = false

    var body: some View {
        GeometryReader { geo in
            let trackWidth = geo.size.width
            let progress = clampedProgress
            let knobX = progress * (trackWidth - knobSize) + knobSize / 2

            ZStack(alignment: .leading) {
                // Track (inset)
                track
                    .frame(width: trackWidth, height: trackHeight)
                    .frame(maxHeight: .infinity, alignment: .center)

                // Filled portion
                Capsule()
                    .fill(brandFill)
                    .frame(width: max(knobSize / 2, knobX), height: trackHeight)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .clipShape(Capsule())

                // Knob
                knob
                    .frame(width: knobSize, height: knobSize)
                    .offset(x: knobX - knobSize / 2)
                    .frame(maxHeight: .infinity, alignment: .center)
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { drag in
                        if !isDragging {
                            withAnimation(.easeOut(duration: 0.1)) {
                                isDragging = true
                            }
                        }
                        updateValue(at: drag.location.x, width: trackWidth)
                    }
                    .onEnded { _ in
                        withAnimation(.spring(response: 0.28, dampingFraction: 0.78)) {
                            isDragging = false
                        }
                    }
            )
        }
        .frame(height: max(knobSize, trackHeight))
    }

    private var clampedProgress: Double {
        let span = range.upperBound - range.lowerBound
        guard span > 0 else { return 0 }
        return min(max((value - range.lowerBound) / span, 0), 1)
    }

    private func updateValue(at x: CGFloat, width: CGFloat) {
        let usable = max(width - knobSize, 1)
        let raw = (x - knobSize / 2) / usable
        let clamped = min(max(Double(raw), 0), 1)
        let span = range.upperBound - range.lowerBound
        var v = range.lowerBound + clamped * span
        if step > 0 {
            v = (v / step).rounded() * step
        }
        v = min(max(v, range.lowerBound), range.upperBound)
        if v != value { value = v }
    }

    private var brandFill: LinearGradient {
        LinearGradient(
            colors: [
                Color.primaryBrand,
                Color.primaryDeep
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    private var track: some View {
        let shape = Capsule()
        return shape
            .fill(Color.bg)
            .overlay {
                shape
                    .stroke(
                        Color.black.opacity(colorScheme == .dark ? 0.50 : 0.20),
                        lineWidth: 4
                    )
                    .blur(radius: 2)
                    .offset(x: 1, y: 1)
                    .mask(shape)
                    .allowsHitTesting(false)
            }
            .overlay {
                shape
                    .stroke(
                        colorScheme == .dark
                            ? Color.white.opacity(0.04)
                            : Color.white.opacity(0.55),
                        lineWidth: 3
                    )
                    .blur(radius: 2)
                    .offset(x: -1, y: -1)
                    .mask(shape)
                    .allowsHitTesting(false)
            }
            .overlay {
                shape
                    .strokeBorder(Color.black.opacity(0.08), lineWidth: 0.5)
            }
    }

    private var knob: some View {
        Circle()
            .fill(Color.primaryBrand)
            .overlay {
                // 跟 fill bar 同套漸層 · 視覺連續
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .white.opacity(colorScheme == .dark ? 0.10 : 0.18),
                                .clear,
                                .black.opacity(colorScheme == .dark ? 0.20 : 0.16)
                            ],
                            startPoint: UnitPoint(x: 0.413, y: 0.008),
                            endPoint: UnitPoint(x: 0.587, y: 0.993)
                        )
                    )
            }
            .overlay {
                Circle()
                    .fill(
                        ImagePaint(
                            image: Image("TactileNoise"),
                            sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1),
                            scale: 1
                        )
                    )
                    .opacity(colorScheme == .dark ? 0.18 : 0.24)
                    .blendMode(colorScheme == .dark ? .softLight : .overlay)
            }
            .overlay {
                Circle()
                    .strokeBorder(Color.black.opacity(0.18), lineWidth: 1)
            }
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.45 : 0.30),
                radius: isDragging ? 4 : 2,
                x: isDragging ? 1 : 2,
                y: isDragging ? 2 : 3
            )
            .scaleEffect(isDragging ? 1.08 : 1.0)
    }
}
