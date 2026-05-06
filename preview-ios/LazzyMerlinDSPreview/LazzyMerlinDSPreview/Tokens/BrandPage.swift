import SwiftUI

// LazzyMerlin DS · 標準 page background + 自訂 brand header (取代 system nav bar)
// iOS 26 toolbar items 全部會被 Liquid Glass 包死、所以乾脆隱藏整個 nav bar
// 用 brand back button + appearance switch 自己畫一條 header
// 套用：destination view body 結尾加 .brandPage()

struct BrandPageModifier: ViewModifier {

    var showsAppearanceTabs: Bool = true
    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        ZStack {
            Color.bg.ignoresSafeArea()

            VStack(spacing: 0) {
                // Brand header: [back] [spacer] [appearance switch]
                HStack(spacing: 12) {
                    LMBackButton { dismiss() }
                    Spacer(minLength: 8)
                    if showsAppearanceTabs {
                        BrandAppearanceTabs()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 6)

                content
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        #if os(iOS)
        // 隱藏整個系統 nav bar (避免 Liquid Glass back button) · swipe-back 仍由 NavigationStack 提供
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        #endif
    }
}

// MARK: - Appearance switcher

private struct BrandAppearanceTabs: View {
    @AppStorage("appearance") private var appearance: AppearancePreference = .system
    @Environment(\.colorScheme) private var colorScheme

    private var isDarkBinding: Binding<Bool> {
        Binding(
            get: {
                switch appearance {
                case .dark: return true
                case .light: return false
                case .system: return colorScheme == .dark
                }
            },
            set: { isDark in
                appearance = isDark ? .dark : .light
            }
        )
    }

    var body: some View {
        LMSegmentedPicker(
            selection: isDarkBinding,
            options: [false, true]
        ) { isDark in
            Text(isDark ? "Dark" : "Light")
        }
        .frame(maxWidth: 220)
        .accessibilityLabel("切換 Light / Dark mode")
    }
}

extension View {
    /// LazzyMerlin DS 標準 page background + brand header (含 back button + appearance switch)。
    /// 取代 system nav bar、跳脫 iOS 26 Liquid Glass。
    /// destination view body 結尾套：
    /// ```swift
    /// .brandPage()
    /// ```
    func brandPage(showsAppearanceTabs: Bool = true) -> some View {
        modifier(BrandPageModifier(showsAppearanceTabs: showsAppearanceTabs))
    }
}
