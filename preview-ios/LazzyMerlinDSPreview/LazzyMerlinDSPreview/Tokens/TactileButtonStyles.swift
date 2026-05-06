import SwiftUI

// LazzyMerlin DS · Tactile button styles
// 把 .tactileRaised/.tactileBase/.tactilePressed modifier 包成 ButtonStyle
// 讓 SwiftUI Button 自動拿到 configuration.isPressed、有 pressed 動畫

// MARK: - Raised (主 CTA)

struct TactileRaisedButtonStyle: ButtonStyle {
    var radius: CGFloat = LMRadius.button
    var paddingV: CGFloat = LMControlSize.buttonMediumV
    var paddingH: CGFloat = LMControlSize.buttonMediumH
    var baseColor: Color = .primaryBrand

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TactileButtonLabelModifier(size: .fromPadding(paddingV)))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            // 把 isPressed 傳進 modifier · pressed 走結構變形 (跟 Tuner tactileLook 一致)
            .modifier(TactileRaisedModifier(
                radius: radius,
                baseColor: baseColor,
                isPressed: configuration.isPressed
            ))
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .offset(y: configuration.isPressed ? 1 : 0)
            .animation(LMMotion.press, value: configuration.isPressed)
    }
}

// MARK: - Secondary (Hybrid · Web btn--secondary)

struct TactileSecondaryButtonStyle: ButtonStyle {
    var radius: CGFloat = LMRadius.button
    var paddingV: CGFloat = LMControlSize.buttonMediumV
    var paddingH: CGFloat = LMControlSize.buttonMediumH

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TactileButtonLabelModifier(size: .fromPadding(paddingV)))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .modifier(TactileSecondaryModifier(
                radius: radius,
                isPressed: configuration.isPressed
            ))
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .offset(y: configuration.isPressed ? 1 : 0)
            .animation(LMMotion.press, value: configuration.isPressed)
    }
}

// MARK: - Base (容器型按鈕 · ⚠️ 不是 trigger 用)
// 用 tactileBase() modifier (給 card/panel 的軟漫射陰影 radius 14 / 0.12 opacity)、
// 不是給「可以按的元件」用的 directional drop。
// trigger 按鈕請用 TactileSecondaryButtonStyle，跟 Raised 同階陰影 (navy 0.50 / x5 y5)。
// 這個 style 現在只剩給 expand/collapse 容器或設定 card 整塊可點擊那種場景。

struct TactileBaseButtonStyle: ButtonStyle {
    var radius: CGFloat = LMRadius.button
    var paddingV: CGFloat = LMControlSize.buttonMediumV
    var paddingH: CGFloat = LMControlSize.buttonMediumH

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TactileButtonLabelModifier(size: .fromPadding(paddingV)))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .foregroundStyle(Color.ink)
            .tactileBase(radius: radius, isPressed: configuration.isPressed)
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .offset(y: configuration.isPressed ? 1 : 0)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(LMMotion.press, value: configuration.isPressed)
    }
}

// MARK: - Pressed (selected toggle)

struct TactilePressedButtonStyle: ButtonStyle {
    var radius: CGFloat = LMRadius.button
    var paddingV: CGFloat = LMControlSize.buttonMediumV
    var paddingH: CGFloat = LMControlSize.buttonMediumH

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TactileButtonLabelModifier(size: .fromPadding(paddingV)))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .tactilePressed(radius: radius)
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .offset(y: configuration.isPressed ? 1 : 0)
            .animation(LMMotion.press, value: configuration.isPressed)
    }
}

// MARK: - Destructive (raised 結構 + earthRed base)

struct TactileDestructiveButtonStyle: ButtonStyle {
    var radius: CGFloat = LMRadius.button
    var paddingV: CGFloat = LMControlSize.buttonMediumV
    var paddingH: CGFloat = LMControlSize.buttonMediumH

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TactileButtonLabelModifier(size: .fromPadding(paddingV)))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            // 直接複用 raised modifier · 換成 earthRed base · 同樣有 noise + pressed 結構變形
            .modifier(TactileRaisedModifier(
                radius: radius,
                baseColor: .earthRed,
                isPressed: configuration.isPressed
            ))
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .offset(y: configuration.isPressed ? 1 : 0)
            .animation(LMMotion.press, value: configuration.isPressed)
    }
}

// MARK: - Ghost (text-only)

struct TactileGhostButtonStyle: ButtonStyle {
    var paddingV: CGFloat = LMControlSize.buttonMediumV
    var paddingH: CGFloat = LMControlSize.buttonMediumH

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TactileButtonLabelModifier(size: .fromPadding(paddingV)))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .foregroundStyle(Color.primaryBrand)
            .opacity(configuration.isPressed ? 0.55 : 1.0)
            .animation(LMMotion.press, value: configuration.isPressed)
    }
}

// MARK: - Ghost icon (icon-only · 給 stepper / date picker / 容器內小箭頭用)
// 無 bg / 框 · 雙層陰影做浮雕 (上方 highlight + 下方 cast shadow)、按下「壓平」
// 適用：LMStepper -/+、LMDatePicker prev/next 月份箭頭、其他容器內 inline 小按鈕

struct LMGhostIconButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme

    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        return configuration.label
            .foregroundStyle(isPressed ? Color.primaryBrand : Color.inkMuted)
            // 浮雕 · 雙層陰影 (上亮下暗、模擬光從上方來的浮起感)
            //   - cast shadow 在 +y: 黑色低透明、icon 像懸浮在表面
            //   - rim highlight 在 -y: 白色低透明、icon 頂緣反光
            // 按下 → 兩層 shadow 都消失、icon 變平 + 換 brand 色 + scale 縮 + opacity 降
            .shadow(
                color: isPressed
                    ? .clear
                    : Color.black.opacity(colorScheme == .dark ? 0.55 : 0.22),
                radius: 0.5,
                y: isPressed ? 0 : 1
            )
            .shadow(
                color: isPressed
                    ? .clear
                    : Color.white.opacity(colorScheme == .dark ? 0.10 : 0.40),
                radius: 0.5,
                y: isPressed ? 0 : -1
            )
            .scaleEffect(isPressed ? 0.85 : 1.0)
            .opacity(isPressed ? 0.75 : 1.0)
            .animation(LMMotion.press, value: isPressed)
    }
}

// MARK: - Internal: button label sizing
// 從 private 改 internal · 讓 ButtonsView 等 view 可以重用 (取代 TactileButtonLabelModifierProxy)

enum TactileButtonLabelSize {
    case small
    case medium
    case large

    static func fromPadding(_ paddingV: CGFloat) -> TactileButtonLabelSize {
        if paddingV <= 8 { return .small }
        if paddingV >= 14 { return .large }
        return .medium
    }

    var pointSize: CGFloat {
        switch self {
        case .small: 13
        case .medium: 14
        case .large: 16
        }
    }

    var font: Font {
        switch self {
        case .small: .lmButtonSmall
        case .medium: .lmButtonMedium
        case .large: .lmButtonLarge
        }
    }
}

struct TactileButtonLabelModifier: ViewModifier {
    let size: TactileButtonLabelSize

    func body(content: Content) -> some View {
        content
            .tactileButtonText(size: size)
    }
}
