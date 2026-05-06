import SwiftUI

// LazzyMerlin DS §3 字體 + §7.2.4 iOS Type Scale
// iOS 用 SF Pro + PingFang TC（系統預設、Dynamic Type 自動跟）
// Display 用 LXGW WenKai TC（須 bundle，preview 簡化用 SF Pro）

extension Font {

    // MARK: - Display & Heading（preview 暫用 SF Pro，正式落地需 bundle LXGW WenKai TC）

    static let lmDisplayXL    = Font.system(size: 56, weight: .bold, design: .serif)        // 56pt serif (largest)
    static let lmDisplayLarge = Font.system(size: 48, weight: .semibold, design: .serif)    // 48pt serif (404 / hero number)
    static let lmDisplay      = Font.system(size: 40, weight: .semibold, design: .serif)    // 40pt serif (display 一般)
    static let lmStatNumber   = Font.system(size: 40, weight: .bold, design: .default)      // 40pt sans (stat / 數據卡片)
    static let lmH1           = Font.system(.title, design: .default).weight(.semibold)     // 28pt
    static let lmH2           = Font.system(.title2, design: .default).weight(.semibold)    // 22pt
    static let lmH3           = Font.system(.title3, design: .default).weight(.semibold)    // 20pt

    // MARK: - Body

    static let lmBodyLarge = Font.system(.body, design: .default)                          // 17pt
    static let lmBody      = Font.system(.body, design: .default)                          // 17pt (HIG 標準)
    static let lmBodySmall = Font.system(.subheadline, design: .default)                   // 15pt

    // MARK: - Caption / Label

    static let lmCaption   = Font.system(.caption, design: .default)                       // 12pt
    static let lmLabel     = Font.system(.caption2, design: .monospaced)                   // 12pt mono
}

// MARK: - Section label modifier (§7.2.6 SF Mono uppercase + tracking)

struct SectionLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.lmLabel)
            .textCase(.uppercase)
            .tracking(1.2)
            .foregroundStyle(Color.primaryBrand)
    }
}

extension View {
    func sectionLabel() -> some View {
        modifier(SectionLabelStyle())
    }
}
