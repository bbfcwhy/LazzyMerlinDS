import SwiftUI

// LazzyMerlin DS · Segmented Picker
// 取代 SwiftUI Picker(.segmented) · iOS 26 Liquid Glass capsule
// 結構：inset 凹軌 + selected pill 透過 PreferenceKey 量測 → offset 動畫滑動

private struct LMSegItemFrameKey: PreferenceKey {
    static let defaultValue: [Int: CGRect] = [:]
    static func reduce(value: inout [Int: CGRect], nextValue: () -> [Int: CGRect]) {
        value.merge(nextValue()) { _, new in new }
    }
}

struct LMSegmentedPicker<Selection: Hashable, Label: View>: View {

    @Binding var selection: Selection
    let options: [Selection]
    @ViewBuilder let label: (Selection) -> Label

    @State private var itemFrames: [Int: CGRect] = [:]
    @Environment(\.colorScheme) private var colorScheme

    private var selectedIndex: Int {
        options.firstIndex(of: selection) ?? 0
    }

    var body: some View {
        let pillFrame = itemFrames[selectedIndex] ?? .zero
        let isMeasured = pillFrame.width > 0

        // ★ HStack of labels 主控 sizing · insetTrack 跟 sliding pill 都放 .background
        HStack(spacing: 4) {
            ForEach(Array(options.enumerated()), id: \.offset) { idx, opt in
                segmentLabel(opt, isSelected: selection == opt)
                    .background(frameReporter(idx: idx))
                    .contentShape(Capsule())
                    .onTapGesture {
                        selection = opt // 不在 tap 端 withAnimation、改在 pill 自己掛 implicit animation
                    }
            }
        }
        .padding(3)
        .background {
            ZStack(alignment: .topLeading) {
                insetTrack
                selectedPill
                    .frame(width: max(pillFrame.width, 1), height: max(pillFrame.height, 1))
                    .offset(x: pillFrame.minX, y: pillFrame.minY)
                    .opacity(isMeasured ? 1 : 0)
                    // ★ 直接把 spring 掛在 pill 上、綁 selectedIndex 變化
                    // 不依賴 tap 端 withAnimation transaction、確保動畫一定觸發
                    .animation(.spring(response: 0.42, dampingFraction: 0.82), value: selectedIndex)
            }
        }
        .coordinateSpace(name: "lmSegTrack")
        .onPreferenceChange(LMSegItemFrameKey.self) { newFrames in
            itemFrames = newFrames
        }
        .animation(.easeInOut(duration: 0.40), value: colorScheme)
    }

    @ViewBuilder
    private func segmentLabel(_ opt: Selection, isSelected: Bool) -> some View {
        label(opt)
            .font(.system(size: 13, weight: .semibold))
            .foregroundStyle(isSelected ? Color.inkOnBrand : Color.inkMuted)
            .shadow(
                color: textShadowColor(isSelected: isSelected),
                radius: 0,
                y: textShadowY(isSelected: isSelected)
            )
            .padding(.vertical, 7)
            .padding(.horizontal, 6)
            .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func frameReporter(idx: Int) -> some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: LMSegItemFrameKey.self,
                    value: [idx: geo.frame(in: .named("lmSegTrack"))]
                )
        }
    }

    private func textShadowColor(isSelected: Bool) -> Color {
        if isSelected {
            return .black.opacity(colorScheme == .dark ? 0.40 : 0.50)
        } else {
            return .white.opacity(colorScheme == .dark ? 0 : 0.40)
        }
    }

    private func textShadowY(isSelected: Bool) -> CGFloat {
        isSelected ? 2 : 1
    }

    private var selectedPill: some View {
        Capsule()
            .fill(colorScheme == .dark ? Color.primaryDeep : Color.stone)
            .overlay { pillGradient }
            .overlay { pillNoise }
            .overlay { pillStroke }
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.45 : 0.22),
                radius: 2,
                x: 1,
                y: 2
            )
    }

    private var pillGradient: some View {
        Capsule()
            .fill(
                LinearGradient(
                    colors: [
                        .white.opacity(colorScheme == .dark ? 0.06 : 0.12),
                        .clear,
                        .black.opacity(colorScheme == .dark ? 0.16 : 0.14)
                    ],
                    startPoint: UnitPoint(x: 0.413, y: 0.008),
                    endPoint: UnitPoint(x: 0.587, y: 0.993)
                )
            )
    }

    private var pillNoise: some View {
        Capsule()
            .fill(
                ImagePaint(
                    image: Image("TactileNoise"),
                    sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1),
                    scale: 1
                )
            )
            .opacity(colorScheme == .dark ? 0.20 : 0.28)
            .blendMode(colorScheme == .dark ? .softLight : .overlay)
    }

    private var pillStroke: some View {
        Capsule()
            .strokeBorder(
                Color.black.opacity(colorScheme == .dark ? 0.25 : 0.18),
                lineWidth: 1
            )
    }

    // Inset track · 對齊 LMSwitchToggleStyle 的 trackInsetShadow 配方
    //   左上深: black opacity 0.55 dark / 0.28 light · stroke 3pt · blur 1.5 · offset (+1.5, +1.5)
    //   右下亮: white opacity 0.05 dark / 0.55 light · stroke 2pt · blur 1 · offset (-1, -1)
    private var insetTrack: some View {
        let shape = Capsule()
        return shape
            .fill(Color.bg)
            .overlay {
                shape
                    .stroke(
                        Color.black.opacity(colorScheme == .dark ? 0.55 : 0.28),
                        lineWidth: 3
                    )
                    .blur(radius: 1.5)
                    .offset(x: 1.5, y: 1.5)
                    .mask(shape)
                    .allowsHitTesting(false)
            }
            .overlay {
                shape
                    .stroke(
                        colorScheme == .dark
                            ? Color.white.opacity(0.05)
                            : Color.white.opacity(0.55),
                        lineWidth: 2
                    )
                    .blur(radius: 1)
                    .offset(x: -1, y: -1)
                    .mask(shape)
                    .allowsHitTesting(false)
            }
            .overlay {
                shape
                    .strokeBorder(
                        Color.black.opacity(colorScheme == .dark ? 0.40 : 0.18),
                        lineWidth: 1
                    )
            }
    }
}
