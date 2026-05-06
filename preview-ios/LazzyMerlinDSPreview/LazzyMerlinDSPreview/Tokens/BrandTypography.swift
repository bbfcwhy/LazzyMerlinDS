import SwiftUI

// LazzyMerlin DS §3 字體 + §7.2.4 iOS Type Scale
//
// 2-tier 字體規則 (brand vs functional · 跨 iOS / macOS / Web 三平台)
//
//   Brand identity tier  → LXGW WenKai TC Medium · 永遠 LXGW
//     · 用在 brand 聲量時刻：hero display / wordmark / empty state ✦ / 404 / about
//     · 對應 token: lmDisplayXL / lmDisplayLarge / lmDisplay / lmEmptyVisual / lmEmptyCode
//
//   Functional UI tier   → 系統字 (SF Pro / PingFang TC)、dev toggle 可切到 LXGW
//     · 用在閱讀 / 操作：page heading / body / caption / button / form / stat
//     · 對應 token: lmH1-H3 / lmBody* / lmCaption / lmLabel / lmButton* / lmControl* / lmStatNumber
//
// 這樣 production app 真正需要 bundle 的 LXGW weight 只剩 1 個 (Medium)、
// 其他 5 個 .ttf (Light / Regular / Mono / Mono Medium) 留 preview app dev toggle 試驗用、
// production iOS / macOS / Web 落地時可以拿掉減 bundle size。
//
// Dev toggle: LMFontMode.useAllLXGW · TypographyView 內可切換、讓 functional tier 也試 LXGW。

// MARK: - Dev mode toggle

enum LMFontMode {
    /// Debug / preview only · TypographyView 提供 toggle
    /// 開啟時、functional UI tier 全切到 LXGW、體感「全 LXGW」風格 (preview app only)
    static var useAllLXGW: Bool {
        UserDefaults.standard.bool(forKey: "lm_dev_useAllLXGW")
    }
}

extension Font {

    // MARK: - LXGW Brand font names (PostScript · LMFontLoader 註冊)

    static let lmBrandFontLight        = "LXGWWenKaiTC-Light"
    static let lmBrandFontRegular      = "LXGWWenKaiTC-Regular"
    static let lmBrandFontMedium       = "LXGWWenKaiTC-Medium"     // ★ production 唯一需要的 weight
    static let lmBrandFontMono         = "LXGWWenKaiMonoTC-Regular"
    static let lmBrandFontMonoMedium   = "LXGWWenKaiMonoTC-Medium"

    // MARK: - Brand identity tier · 永遠 LXGW WenKai TC Medium

    static let lmDisplayXL    = Font.custom(lmBrandFontMedium, size: 56)  // hero / wordmark
    static let lmDisplayLarge = Font.custom(lmBrandFontMedium, size: 48)  // splash / 大型 brand 訊息
    static let lmDisplay      = Font.custom(lmBrandFontMedium, size: 40)  // section 級 brand 訊息
    static let lmEmptyVisual  = Font.custom(lmBrandFontMedium, size: 52)  // empty state hero ✦
    static let lmEmptyCode    = Font.custom(lmBrandFontMedium, size: 48)  // 404 / 大字 code

    // MARK: - Functional UI tier · 預設 system、dev toggle 可切 LXGW

    /// page-level 大標 (28pt) · 功能性、不算 brand 聲量
    static var lmH1: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMedium, size: 28)
            : Font.system(.title, design: .default).weight(.semibold)
    }
    /// section 標題 (22pt)
    static var lmH2: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMedium, size: 22)
            : Font.system(.title2, design: .default).weight(.semibold)
    }
    /// 子 section 標題 (20pt)
    static var lmH3: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMedium, size: 20)
            : Font.system(.title3, design: .default).weight(.semibold)
    }
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
    /// stat 數字 (40pt) · 等寬對齊用 monospacedDigit (SF Pro 內建)
    static var lmStatNumber: Font {
        LMFontMode.useAllLXGW
            ? Font.custom(lmBrandFontMonoMedium, size: 40)
            : Font.system(size: 40, weight: .bold, design: .default).monospacedDigit()
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
