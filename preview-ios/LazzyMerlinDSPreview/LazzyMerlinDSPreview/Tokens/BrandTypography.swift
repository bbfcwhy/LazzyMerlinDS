import SwiftUI

// LazzyMerlin DS §3 字體 + §7.2.4 iOS Type Scale
//
// 3-tier 字體規則:
//   Display tier  (≥ 20pt): LXGW WenKai TC Medium · brand 個性
//   Numeric tier  (數字對齊): LXGW WenKai Mono TC Medium · 等寬數字
//   UI tier       (≤ 17pt 操作): SF Pro / PingFang TC · 系統字符合 HIG
//
// Dev toggle: LMFontMode.useAllLXGW · TypographyView 內可切換、讓 UI tier 也用 LXGW、體驗看看。

// MARK: - Dev mode toggle

enum LMFontMode {
    /// Debug / preview only · TypographyView 提供 toggle
    /// 開啟時、UI tier (body/caption/button/control) 全切到 LXGW、可體感「全 LXGW」是否怪
    static var useAllLXGW: Bool {
        UserDefaults.standard.bool(forKey: "lm_dev_useAllLXGW")
    }
}

extension Font {

    // MARK: - LXGW Brand font names (PostScript · LMFontLoader 註冊)

    static let lmBrandFontLight        = "LXGWWenKaiTC-Light"
    static let lmBrandFontRegular      = "LXGWWenKaiTC-Regular"
    static let lmBrandFontMedium       = "LXGWWenKaiTC-Medium"
    static let lmBrandFontMono         = "LXGWWenKaiMonoTC-Regular"
    static let lmBrandFontMonoMedium   = "LXGWWenKaiMonoTC-Medium"

    // MARK: - Display tier · 永遠 LXGW WenKai TC

    static let lmDisplayXL    = Font.custom(lmBrandFontMedium, size: 56)
    static let lmDisplayLarge = Font.custom(lmBrandFontMedium, size: 48)
    static let lmDisplay      = Font.custom(lmBrandFontMedium, size: 40)
    static let lmH1           = Font.custom(lmBrandFontMedium, size: 28)
    static let lmH2           = Font.custom(lmBrandFontMedium, size: 22)
    static let lmH3           = Font.custom(lmBrandFontMedium, size: 20)
    static let lmEmptyVisual  = Font.custom(lmBrandFontMedium, size: 52)  // hero ✦ / large icon
    static let lmEmptyCode    = Font.custom(lmBrandFontMedium, size: 48)  // 404 / 大字 code

    // MARK: - Numeric tier · 永遠 LXGW Mono (等寬數字對齊)

    static let lmStatNumber = Font.custom(lmBrandFontMonoMedium, size: 40)

    // MARK: - UI tier · 預設 system、dev toggle 可切到 LXGW

    static var lmBodyLarge: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontRegular, size: 17)
            : Font.system(.body, design: .default)
    }
    static var lmBody: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontRegular, size: 17)
            : Font.system(.body, design: .default)
    }
    static var lmBodySmall: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontRegular, size: 15)
            : Font.system(.subheadline, design: .default)
    }
    static var lmCaption: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontRegular, size: 12)
            : Font.system(.caption, design: .default)
    }
    static var lmLabel: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMono, size: 12)
            : Font.system(.caption2, design: .monospaced)
    }
    static var lmButtonSmall: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMedium, size: 13)
            : Font.system(size: 13, weight: .semibold, design: .default)
    }
    static var lmButtonMedium: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMedium, size: 14)
            : Font.system(size: 14, weight: .semibold, design: .default)
    }
    static var lmButtonLarge: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMedium, size: 16)
            : Font.system(size: 16, weight: .semibold, design: .default)
    }
    static var lmControlLabel: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontRegular, size: 14)
            : Font.system(size: 14, weight: .medium, design: .default)
    }
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
