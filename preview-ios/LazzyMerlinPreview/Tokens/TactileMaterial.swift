import SwiftUI

// LazzyMerlin DS §5.4 跨平台共通六件配方 SwiftUI 等價
// 對照 web preview/components-preview.html 的 .tactile-* CSS

// MARK: - Tactile Raised (主 CTA)

struct TactileRaisedModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.bg)
            .shadow(color: colorScheme == .dark
                    ? .black.opacity(0.40) : .black.opacity(0.30),
                    radius: 0, y: 1)                            // text shadow (#5)
            .background {
                ZStack {
                    Color.primaryLM                             // base fill
                    LinearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.04 : 0.06),
                            .clear,
                            .black.opacity(colorScheme == .dark ? 0.30 : 0.22)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )                                           // 對角微暗化 (#1)
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.10 : 0.08)
                        .blendMode(.softLight)
                        .allowsHitTesting(false)                // PNG noise tile (#4)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))    // continuous radius (#6)
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                .white.opacity(colorScheme == .dark ? 0.15 : 0.30),
                                .black.opacity(colorScheme == .dark ? 0.40 : 0.20)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )                                           // 上亮下暗單層 stroke (#2)
            }
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.25 : 0.15),
                    radius: 4, y: 2)                            // drop shadow 近層 (#3)
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.20 : 0.10),
                    radius: 12, y: 6)                           // drop shadow 遠層 (#3)
    }
}

// MARK: - Tactile Base (一般卡片 / 容器)

struct TactileBaseModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .background {
                ZStack {
                    Color.bgRaised
                    LinearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.02 : 0.04),
                            .clear,
                            .black.opacity(colorScheme == .dark ? 0.10 : 0.10)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.08 : 0.06)
                        .blendMode(.softLight)
                        .allowsHitTesting(false)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                .white.opacity(colorScheme == .dark ? 0.10 : 0.50),
                                .black.opacity(colorScheme == .dark ? 0.30 : 0.10)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
            }
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.20 : 0.10),
                    radius: 4, y: 2)
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.15 : 0.06),
                    radius: 8, y: 4)
    }
}

// MARK: - Tactile Inset (輸入槽 · 光源反轉)

struct TactileInsetModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .background {
                ZStack {
                    Color.bg
                    LinearGradient(
                        colors: [
                            .black.opacity(colorScheme == .dark ? 0.20 : 0.10),    // 反轉：左上暗
                            .clear,
                            .white.opacity(colorScheme == .dark ? 0.04 : 0.06)     // 反轉：右下亮
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                .black.opacity(colorScheme == .dark ? 0.40 : 0.18),    // 反轉：頂緣暗
                                .white.opacity(colorScheme == .dark ? 0.10 : 0.40)     // 反轉：底緣亮
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
            }
            // 凹槽不加 drop shadow / noise (詳見 §5.4.1 Inset 規格說明)
    }
}

// MARK: - Tactile Pressed (active 狀態 / selected toggle)

struct TactilePressedModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.bg)
            .shadow(color: .black.opacity(0.30), radius: 0, y: 1)    // text shadow
            .background {
                ZStack {
                    Color.stone                                        // 強暗底
                    LinearGradient(
                        colors: [
                            .black.opacity(0.20),                      // 反轉：左上暗
                            .clear,
                            .white.opacity(0.06)                       // 反轉：右下亮
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                .black.opacity(0.30),                  // 反轉：頂緣暗
                                .white.opacity(0.10)                   // 反轉：底緣亮
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
            }
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.20 : 0.10),
                    radius: 2, y: 1)                                  // 1 層淺 drop shadow
    }
}

// MARK: - View extensions (DSL)

extension View {
    /// Tactile Raised — 主 CTA、Hero tile、強調 panel
    func tactileRaised(radius: CGFloat = 12) -> some View {
        modifier(TactileRaisedModifier(radius: radius))
    }

    /// Tactile Base — 一般卡片、容器、page surface
    func tactileBase(radius: CGFloat = 12) -> some View {
        modifier(TactileBaseModifier(radius: radius))
    }

    /// Tactile Inset — 表單輸入、容器內凹槽（光源反轉）
    func tactileInset(radius: CGFloat = 10) -> some View {
        modifier(TactileInsetModifier(radius: radius))
    }

    /// Tactile Pressed — active 狀態、selected toggle
    func tactilePressed(radius: CGFloat = 12) -> some View {
        modifier(TactilePressedModifier(radius: radius))
    }
}
