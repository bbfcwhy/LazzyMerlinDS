import SwiftUI

// LazzyMerlin DS · SwiftUI numeric / motion / chrome tokens
// Keep component files free from repeated magic numbers while preserving HIG-friendly pt values.

enum LMSpacing {
    static let xxs: CGFloat = 4
    static let xs: CGFloat = 6
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let controlGap: CGFloat = 14
    static let lg: CGFloat = 16
    static let page: CGFloat = 20
    static let card: CGFloat = 24
    static let editorial: CGFloat = 28
    static let section: CGFloat = 32
    static let stateVertical: CGFloat = 64
}

enum LMRadius {
    static let sm: CGFloat = 6
    static let md: CGFloat = 10
    static let button: CGFloat = 12
    static let xl: CGFloat = 16
    static let navCapsule: CGFloat = 18
    static let card: CGFloat = 20
    static let sheet: CGFloat = 28
}

enum LMControlSize {
    static let buttonSmallV: CGFloat = 8
    static let buttonSmallH: CGFloat = 14
    static let buttonMediumV: CGFloat = 12
    static let buttonMediumH: CGFloat = 22
    static let buttonLargeV: CGFloat = 16
    static let buttonLargeH: CGFloat = 28
    static let alertButtonV: CGFloat = 11
    static let alertButtonH: CGFloat = 18
    static let iconButton: CGFloat = 36
}

enum LMOpacity {
    static let disabled: Double = 0.55
    static let subdued: Double = 0.65
    static let iconMuted: Double = 0.55
    static let backdrop: Double = 0.42
}

/// 頁面層 layout 約束（content centering、tablet 寬螢幕適配）
/// 跟 `LMSpacing`（控制元件間距）不同層；跟 `LMOverlayChrome.cardMaxWidth`（420pt overlay-only）也不同 register
enum LMLayout {
    /// Main content max width · 448pt (Tailwind max-w-md 等義)
    /// 用於 centered narrative content、editorial reading column；超過此寬度時內容靠左留白
    static let contentMaxWidth: CGFloat = 448
}

enum LMMotion {
    static let press = Animation.easeOut(duration: 0.12)
    static let quickDismiss = Animation.easeOut(duration: 0.18)
    static let quickPress = Animation.easeOut(duration: 0.08)
    static let overlaySpring = Animation.spring(response: 0.32, dampingFraction: 0.82)
    static let controlSpring = Animation.spring(response: 0.32, dampingFraction: 0.78)
    static let selectionSpring = Animation.spring(response: 0.42, dampingFraction: 0.82)
    static let skeletonPulse = Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true)
}

enum LMTactile {
    static let gradientStart = UnitPoint(x: 0.413, y: 0.008)
    static let gradientEnd = UnitPoint(x: 0.587, y: 0.993)
    static let raisedNoiseOpacity: Double = 0.30
    static let baseNoiseLight: Double = 0.55
    static let baseNoiseDark: Double = 0.75
    static let secondaryNoiseLight: Double = 0.55
    static let secondaryNoiseDark: Double = 0.70
    static let smallNoiseLight: Double = 0.30
    static let smallNoiseDark: Double = 0.20

    static func shadowInk(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? .black : Color.ink
    }
}

enum LMOverlayChrome {
    static let cardMaxWidth: CGFloat = 420
    static let backdrop = Color.black.opacity(LMOpacity.backdrop)

    static func border(_ colorScheme: ColorScheme) -> Color {
        Color.black.opacity(colorScheme == .dark ? 0.30 : 0.10)
    }

    static func actionSheetBorder(_ colorScheme: ColorScheme) -> Color {
        Color.black.opacity(colorScheme == .dark ? 0.30 : 0.08)
    }

    static let cardShadow = Color.black.opacity(0.32)
}

struct LMOverlayCardChrome: ViewModifier {
    var radius: CGFloat = LMRadius.card
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: radius, style: .continuous)
        content
            .background(shape.fill(Color.surface2)) // overlay / alert · 最高 elevation (+2)
            .overlay {
                shape.strokeBorder(LMOverlayChrome.border(colorScheme), lineWidth: 1)
            }
            .shadow(color: LMOverlayChrome.cardShadow, radius: 20, x: 0, y: 12)
    }
}

extension View {
    func lmOverlayCardChrome(radius: CGFloat = LMRadius.card) -> some View {
        modifier(LMOverlayCardChrome(radius: radius))
    }
}
