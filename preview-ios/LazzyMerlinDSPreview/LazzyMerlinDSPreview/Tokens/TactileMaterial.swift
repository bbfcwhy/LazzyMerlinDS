import SwiftUI

// LazzyMerlin DS · Tactile material modifiers · v0.2.0-rc.9
// 共通結構：170° subtle gradient + tactile noise + tokenized outline / shadow
// Web 對照：Raised button = canonical hard tactile；Base card = editorial soft tactile；Plain = hybrid

// MARK: - Tactile Raised (主 CTA · drop 5/5/3 opacity 0.50)
// baseColor 可換 (destructive 用 .earthRed)、isPressed 切結構變形 (gradient 反向 / stroke 加深 / drop 縮小)

struct TactileRaisedModifier: ViewModifier {
    let radius: CGFloat
    var baseColor: Color = .primaryBrand
    var isPressed: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    // shadow color · light: navy #0F1C26 (brand-fitted) / dark: pure black (跟 dark bg #0F1C26 區分、避免 navy 投 navy 0 對比看不到)
    private var shadowInk: Color {
        colorScheme == .dark
            ? .black
            : Color(red: 15 / 255, green: 28 / 255, blue: 38 / 255)
    }

    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.inkOnBrand)
            .shadow(color: .black.opacity(0.80), radius: 0, y: 2)
            .background {
                ZStack {
                    baseColor
                    LinearGradient(
                        colors: isPressed
                            ? [
                                .black.opacity(0.18),
                                .clear,
                                .white.opacity(0.06)
                            ]
                            : [
                                .white.opacity(0.10),
                                .clear,
                                .black.opacity(0.10)
                            ],
                        startPoint: UnitPoint(x: 0.413, y: 0.008),
                        endPoint: UnitPoint(x: 0.587, y: 0.993)
                    )
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(0.30)
                        .blendMode(colorScheme == .dark ? .softLight : .overlay)
                        .allowsHitTesting(false)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                // stroke · 跨 mode 同 black 0.10 (主人 dark spec 維持 black、不翻 white)
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        Color.black.opacity(isPressed ? 0.18 : 0.10),
                        lineWidth: 1
                    )
            }
            // drop shadow #1 · light/dark 共用 black directional drop (minimalist 原版)
            .shadow(
                color: shadowInk.opacity(isPressed ? 0.30 : 0.50),
                radius: isPressed ? 2 : 3,
                x: isPressed ? 1 : 3,
                y: isPressed ? 1 : 3
            )
            // drop shadow #2
            .shadow(
                color: shadowInk.opacity(isPressed ? 0 : 0.50),
                radius: 3,
                x: 3,
                y: 3
            )
    }
}

// MARK: - Tactile Base (Editorial card / 容器 · Web card--editorial)

struct TactileBaseModifier: ViewModifier {
    let radius: CGFloat
    var isPressed: Bool = false
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .background {
                ZStack {
                    Color.bgRaised
                    LinearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.04 : 0.08),
                            .clear,
                            .black.opacity(colorScheme == .dark ? 0.10 : 0.04)
                        ],
                        startPoint: UnitPoint(x: 0.413, y: 0.008),
                        endPoint: UnitPoint(x: 0.587, y: 0.993)
                    )
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.75 : 0.55)
                        .blendMode(colorScheme == .dark ? .softLight : .overlay)
                        .allowsHitTesting(false)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        colorScheme == .dark
                            ? Color.white.opacity(0.03)
                            : Color.black.opacity(0.05),
                        lineWidth: 1
                    )
            }
            .shadow(
                color: colorScheme == .dark
                    ? .black.opacity(isPressed ? 0.30 : 0.45)
                    : .black.opacity(isPressed ? 0.08 : 0.12),
                radius: isPressed ? 8 : 14,
                x: isPressed ? 2 : 4,
                y: isPressed ? 3 : 6
            )
    }
}

// MARK: - Tactile Plain (list / table container · Hybrid material)

struct TactilePlainModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .background(Color.bg)
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(Color.hairline, lineWidth: 1)
            }
            // v0.2.0-rc.6 minimalist · 單向 directional drop
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.35 : 0.10),
                radius: 3,
                x: 2,
                y: 2
            )
    }
}

// MARK: - Tactile Secondary (Hybrid button · Web btn--secondary)

struct TactileSecondaryModifier: ViewModifier {
    let radius: CGFloat
    var isPressed: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    // shadow color · light: navy #0F1C26 (brand-fitted) / dark: pure black (跟 dark bg #0F1C26 區分、避免 navy 投 navy 0 對比看不到)
    private var shadowInk: Color {
        colorScheme == .dark
            ? .black
            : Color(red: 15 / 255, green: 28 / 255, blue: 38 / 255)
    }

    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.ink)
            .background {
                ZStack {
                    Color.bg
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.70 : 0.55)
                        .blendMode(colorScheme == .dark ? .softLight : .overlay)
                        .allowsHitTesting(false)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(isPressed ? Color.border : Color.hairline, lineWidth: 1)
            }
            .shadow(
                color: shadowInk.opacity(isPressed ? 0.30 : 0.50),
                radius: isPressed ? 2 : 3,
                x: isPressed ? 1 : 3,
                y: isPressed ? 1 : 3
            )
            .shadow(
                color: shadowInk.opacity(isPressed ? 0 : 0.50),
                radius: 3,
                x: 3,
                y: 3
            )
    }
}

// MARK: - Tactile Inset (輸入槽 · 凹陷 elevation · 無 drop shadow)
// v0.2.0-rc.9: 對齊 LMSwitchToggleStyle.trackInsetShadow 配方、跨「凹陷」元件 100% 一致
//   左上深: black 0.28 / 0.55 · stroke 3 · blur 1.5 · offset (+1.5, +1.5)
//   右下亮: white 0.55 / 0.05 · stroke 2 · blur 1 · offset (-1, -1)
//   border: black 0.18 / 0.40 · 1pt
// 注意：white rim 會回來、是設計取捨換取跨元件視覺統一

struct TactileInsetModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: radius, style: .continuous)
        content
            .background(Color.bg)
            .clipShape(shape)
            .overlay {
                // 左上深 · directional 凹陷
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
                // 右下亮 · 凹陷內牆受光 rim
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
                // 1pt 外框 · 跟 LMSwitch / LMSegmentedPicker 同步
                shape
                    .strokeBorder(
                        Color.black.opacity(colorScheme == .dark ? 0.40 : 0.18),
                        lineWidth: 1
                    )
            }
    }
}

// MARK: - Tactile Pressed (selected toggle · drop 1/1/1 opacity 0.30 · elevation 極輕浮)

struct TactilePressedModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.inkOnBrand)
            .shadow(color: .black.opacity(0.50), radius: 0, y: 1)
            .background {
                ZStack {
                    Color.stone
                    // gradient 反轉 (壓下感)
                    LinearGradient(
                        colors: [
                            .black.opacity(0.15),
                            .clear,
                            .white.opacity(0.06)
                        ],
                        startPoint: UnitPoint(x: 0.413, y: 0.008),
                        endPoint: UnitPoint(x: 0.587, y: 0.993)
                    )
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.15 : 0.20)
                        .blendMode(colorScheme == .dark ? .softLight : .overlay)
                        .allowsHitTesting(false)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        Color.black.opacity(0.20),
                        lineWidth: 1
                    )
            }
            .shadow(color: .black.opacity(0.30), radius: 1, x: 1, y: 1)
    }
}

// MARK: - Tactile Pill (chip / badge / inline status · Capsule with full tactile recipe)
// 配方同 raised 但 elevation 較輕 (drop 3/3/2 vs raised 5/5/3)
// isFilled = false 時用 bgMuted、適合 unselected filter chip

struct TactilePillModifier: ViewModifier {
    let color: Color
    let isFilled: Bool
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .foregroundStyle(isFilled ? Color.inkOnBrand : Color.ink)
            .shadow(
                color: isFilled
                    ? .black.opacity(colorScheme == .dark ? 0.40 : 0.50)
                    : .white.opacity(colorScheme == .dark ? 0 : 0.40),
                radius: 0,
                y: isFilled ? 2 : 1
            )
            .background {
                Capsule()
                    .fill(isFilled ? color : Color.bgMuted)
                    .overlay {
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        .white.opacity(colorScheme == .dark ? 0.06 : 0.10),
                                        .clear,
                                        .black.opacity(colorScheme == .dark ? 0.18 : 0.10)
                                    ],
                                    startPoint: UnitPoint(x: 0.413, y: 0.008),
                                    endPoint: UnitPoint(x: 0.587, y: 0.993)
                                )
                            )
                    }
                    .overlay {
                        Rectangle()
                            .fill(
                                ImagePaint(
                                    image: Image("TactileNoise"),
                                    sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1),
                                    scale: 1
                                )
                            )
                            .opacity(colorScheme == .dark ? 0.20 : 0.30)
                            .blendMode(colorScheme == .dark ? .softLight : .overlay)
                            .clipShape(Capsule())
                    }
            }
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .strokeBorder(
                        Color.black.opacity(colorScheme == .dark ? 0.20 : 0.10),
                        lineWidth: 1
                    )
            }
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.40 : 0.30),
                radius: 2,
                x: 3,
                y: 3
            )
    }
}

// MARK: - Tactile Circle (avatar / status dot · Circle with full tactile recipe)
// 配方對齊 Pill、shape 換 Circle。給小 size avatar (28-48pt) 用、字會凸起、底有立體感

struct TactileCircleModifier: ViewModifier {
    let color: Color
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.inkOnBrand)
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.40 : 0.50),
                radius: 0,
                y: 1
            )
            .background {
                Circle()
                    .fill(color)
                    .overlay {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        .white.opacity(colorScheme == .dark ? 0.06 : 0.10),
                                        .clear,
                                        .black.opacity(colorScheme == .dark ? 0.18 : 0.10)
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
                            .opacity(colorScheme == .dark ? 0.20 : 0.30)
                            .blendMode(colorScheme == .dark ? .softLight : .overlay)
                    }
            }
            .clipShape(Circle())
            .overlay {
                Circle()
                    .strokeBorder(
                        Color.black.opacity(colorScheme == .dark ? 0.20 : 0.10),
                        lineWidth: 1
                    )
            }
            .shadow(
                color: .black.opacity(colorScheme == .dark ? 0.40 : 0.30),
                radius: 2,
                x: 3,
                y: 3
            )
    }
}

// MARK: - View extensions (DSL)

extension View {
    /// Tactile Raised — 主 CTA、Hero tile、強調 panel · drop 5/5/3 opacity 0.50
    func tactileRaised(radius: CGFloat = 12) -> some View {
        modifier(TactileRaisedModifier(radius: radius))
    }

    /// Tactile Base — 一般卡片、容器、page surface · shadow direction 對齊 raised
    func tactileBase(radius: CGFloat = 12, isPressed: Bool = false) -> some View {
        modifier(TactileBaseModifier(radius: radius, isPressed: isPressed))
    }

    /// Tactile Plain — table / list / quiet card · Hybrid material
    func tactilePlain(radius: CGFloat = 12) -> some View {
        modifier(TactilePlainModifier(radius: radius))
    }

    /// Tactile Secondary — secondary CTA · Hybrid button material
    func tactileSecondary(radius: CGFloat = 12, isPressed: Bool = false) -> some View {
        modifier(TactileSecondaryModifier(radius: radius, isPressed: isPressed))
    }

    /// Tactile Inset — 表單輸入、容器內凹槽 (光源反轉) · no drop shadow
    func tactileInset(radius: CGFloat = 16) -> some View {
        modifier(TactileInsetModifier(radius: radius))
    }

    /// Tactile Pressed — active 狀態、selected toggle · drop 1/1/1 opacity 0.30
    func tactilePressed(radius: CGFloat = 12) -> some View {
        modifier(TactilePressedModifier(radius: radius))
    }

    /// Tactile Pill — chip / badge / inline status (Capsule + 完整 tactile 配方)
    func tactilePill(color: Color, isFilled: Bool = true) -> some View {
        modifier(TactilePillModifier(color: color, isFilled: isFilled))
    }

    /// Tactile Circle — avatar / status dot (Circle + 完整 tactile 配方)
    func tactileCircle(color: Color) -> some View {
        modifier(TactileCircleModifier(color: color))
    }
}
