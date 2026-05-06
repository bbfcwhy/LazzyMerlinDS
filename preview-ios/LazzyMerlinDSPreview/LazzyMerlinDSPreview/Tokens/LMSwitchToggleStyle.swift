import SwiftUI

// LazzyMerlin DS · 自訂 ToggleStyle 對齊 web .switch
// 取代 Apple 預設 liquid glass、跟 web preview 視覺一致
// 用法：Toggle("xxx", isOn: $bool).toggleStyle(.lmSwitch)

struct LMSwitchToggleStyle: ToggleStyle {
    @Environment(\.colorScheme) private var colorScheme

    private let trackWidth: CGFloat = 52
    private let trackHeight: CGFloat = 28
    private let thumbSize: CGFloat = 22
    private let thumbPadding: CGFloat = 3

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            switchControl(isOn: configuration.isOn)
                .contentShape(Capsule())
                .onTapGesture {
                    withAnimation(.spring(response: 0.30, dampingFraction: 0.78)) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }

    @ViewBuilder
    private func switchControl(isOn: Bool) -> some View {
        ZStack(alignment: isOn ? .trailing : .leading) {
            track(isOn: isOn)
            thumb
                .padding(thumbPadding)
        }
        .frame(width: trackWidth, height: trackHeight)
    }

    @ViewBuilder
    private func track(isOn: Bool) -> some View {
        Capsule()
            .fill(isOn ? Color.primaryBrand : Color.bg)
            .frame(width: trackWidth, height: trackHeight)
            .overlay { trackInsetShadow }
            .overlay {
                // ON: noise overlay (跟 .btn--primary::after 同款)
                if isOn {
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.20 : 0.30)
                        .blendMode(colorScheme == .dark ? .softLight : .overlay)
                        .clipShape(Capsule())
                        .allowsHitTesting(false)
                }
            }
            .overlay {
                Capsule()
                    .strokeBorder(
                        isOn
                            ? Color.black.opacity(0.10)
                            : Color.black.opacity(colorScheme == .dark ? 0.40 : 0.18),
                        lineWidth: 1
                    )
            }
    }

    // 對齊 web `.switch` box-shadow:
    //   inset 2px 2px 5px rgba(15,28,38,0.18)  ← 左上凹
    //   inset -1px -1px 2px rgba(255,255,255,0.5)  ← 右下亮
    @ViewBuilder
    private var trackInsetShadow: some View {
        ZStack {
            // 左上深
            Capsule()
                .stroke(
                    Color.black.opacity(colorScheme == .dark ? 0.55 : 0.28),
                    lineWidth: 3
                )
                .blur(radius: 1.5)
                .offset(x: 1.5, y: 1.5)
                .mask(Capsule())
            // 右下亮
            Capsule()
                .stroke(
                    colorScheme == .dark
                        ? Color.white.opacity(0.05)
                        : Color.white.opacity(0.55),
                    lineWidth: 2
                )
                .blur(radius: 1)
                .offset(x: -1, y: -1)
                .mask(Capsule())
        }
        .allowsHitTesting(false)
    }

    @ViewBuilder
    private var thumb: some View {
        Circle()
            .fill(Color.bg)
            .frame(width: thumbSize, height: thumbSize)
            .overlay {
                Circle()
                    .strokeBorder(
                        colorScheme == .dark
                            ? Color.white.opacity(0.10)
                            : Color.black.opacity(0.10),
                        lineWidth: 0.5
                    )
            }
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.50 : 0.20),
                radius: 2,
                x: 0,
                y: 1
            )
    }
}

extension ToggleStyle where Self == LMSwitchToggleStyle {
    static var lmSwitch: LMSwitchToggleStyle { LMSwitchToggleStyle() }
}
