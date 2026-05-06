import SwiftUI

// LazzyMerlin DS §3 字體 + §7.2.4 iOS Type Scale
// iOS body 用 SF Pro + PingFang TC（系統預設、Dynamic Type 自動跟）
// Display / heading 用 LXGW WenKai TC（已 bundle、由 LMFontLoader 註冊）
// Mono 用 LXGW WenKai Mono TC

extension Font {

    // MARK: - LXGW Brand font names (PostScript names · LMFontLoader 註冊)

    /// LXGW WenKai TC Light · 細
    static let lmBrandFontLight   = "LXGWWenKaiTC-Light"
    /// LXGW WenKai TC Regular · 一般
    static let lmBrandFontRegular = "LXGWWenKaiTC-Regular"
    /// LXGW WenKai TC Medium · 中粗
    static let lmBrandFontMedium  = "LXGWWenKaiTC-Medium"
    /// LXGW WenKai Mono TC Regular · 等寬版 (給 code / numeric 用)
    static let lmBrandFontMono    = "LXGWWenKaiMonoTC-Regular"

    // MARK: - Display & Heading · 使用 LXGW WenKai TC

    static let lmDisplayXL    = Font.custom(lmBrandFontMedium,  size: 56)  // 56pt 文楷 medium
    static let lmDisplayLarge = Font.custom(lmBrandFontMedium,  size: 48)  // 48pt 文楷 medium (404 / hero)
    static let lmDisplay      = Font.custom(lmBrandFontMedium,  size: 40)  // 40pt 文楷 medium (display 一般)
    static let lmH1           = Font.custom(lmBrandFontMedium,  size: 28)  // 28pt
    static let lmH2           = Font.custom(lmBrandFontMedium,  size: 22)  // 22pt
    static let lmH3           = Font.custom(lmBrandFontMedium,  size: 20)  // 20pt

    // MARK: - Body

    static let lmBodyLarge = Font.system(.body, design: .default)                          // 17pt
    static let lmBody      = Font.system(.body, design: .default)                          // 17pt (HIG 標準)
    static let lmBodySmall = Font.system(.subheadline, design: .default)                   // 15pt

    // MARK: - Caption / Label

    static let lmCaption   = Font.system(.caption, design: .default)                       // 12pt
    static let lmLabel     = Font.system(.caption2, design: .monospaced)                   // 12pt mono

    // MARK: - Component-specific utility styles

    static let lmButtonSmall  = Font.system(size: 13, weight: .semibold, design: .default)
    static let lmButtonMedium = Font.system(size: 14, weight: .semibold, design: .default)
    static let lmButtonLarge  = Font.system(size: 16, weight: .semibold, design: .default)
    static let lmControlLabel = Font.system(size: 14, weight: .medium, design: .default)
    static let lmEmptyVisual  = Font.system(size: 52, weight: .semibold, design: .serif)
    static let lmEmptyCode    = Font.system(size: 48, weight: .semibold, design: .serif)
    static let lmStatNumber   = Font.system(size: 40, weight: .bold, design: .default)  // stat 數據卡片數字
}

// MARK: - Tracking (字距 · uppercase 英文 label 用)

enum LMTracking {
    /// status chip uppercase 文字 (e.g. INFO / SUCCESS / ERROR)
    static let chip: CGFloat = 0.6
    /// filter chip / badge uppercase (e.g. ALL / DRAFTS / BETA)
    static let badge: CGFloat = 0.8
    /// 一般 loose 字距 (subtitle / spacious header)
    static let loose: CGFloat = 1.0
    /// section label / eyebrow uppercase emphasis
    static let eyebrow: CGFloat = 1.2
}

// MARK: - Line spacing (段落行距)

enum LMLineSpacing {
    /// 緊湊段落 (alert message)
    static let tight: CGFloat = 2
    /// 一般 body (預設)
    static let normal: CGFloat = 4
    /// 寬鬆段落 (modal body / 長文)
    static let loose: CGFloat = 6
}

// MARK: - Section label modifier (§7.2.6 SF Mono uppercase + tracking)

struct SectionLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.lmLabel)
            .textCase(.uppercase)
            .tracking(LMTracking.eyebrow)
            .foregroundStyle(Color.primaryBrand)
    }
}

// MARK: - Chip / badge / eyebrow compound modifiers

struct ChipLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.lmLabel)
            .textCase(.uppercase)
            .tracking(LMTracking.badge)
    }
}

struct StatusChipLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.lmLabel)
            .textCase(.uppercase)
            .tracking(LMTracking.chip)
    }
}

struct EyebrowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.lmLabel)
            .textCase(.uppercase)
            .tracking(LMTracking.eyebrow)
            .foregroundStyle(Color.inkMuted)
    }
}

struct TactileButtonTextStyle: ViewModifier {
    let size: TactileButtonLabelSize

    func body(content: Content) -> some View {
        content
            .font(size.font)
            .lineLimit(1)
            .minimumScaleFactor(0.85)
    }
}

extension View {
    func sectionLabel() -> some View {
        modifier(SectionLabelStyle())
    }

    func tactileButtonText(size: TactileButtonLabelSize) -> some View {
        modifier(TactileButtonTextStyle(size: size))
    }

    /// Filter chip / badge label · uppercase + tracking 0.8 · font lmLabel
    func chipLabel() -> some View {
        modifier(ChipLabelStyle())
    }

    /// Status chip text · uppercase + tracking 0.6 · font lmLabel
    func statusChipLabel() -> some View {
        modifier(StatusChipLabelStyle())
    }

    /// Eyebrow / micro-heading · uppercase + tracking 1.2 · inkMuted 色 (跟 sectionLabel 差別在不用 brand 色)
    func eyebrow() -> some View {
        modifier(EyebrowStyle())
    }
}
