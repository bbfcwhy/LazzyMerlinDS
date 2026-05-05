import SwiftUI

// LazzyMerlin DS · 標準 page background + navigation bar 統一處理
// 套用：destination view body 結尾加 .navigationTitle("xxx").brandPage()

struct BrandPageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.bg.ignoresSafeArea())
            #if os(iOS)
            .toolbarBackground(Color.bg, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            #endif
    }
}

extension View {
    /// LazzyMerlin DS 標準 page background + brand 米色 navigation bar。
    /// destination view body 結尾套：
    /// ```swift
    /// .navigationTitle("Buttons")
    /// .brandPage()
    /// ```
    func brandPage() -> some View {
        modifier(BrandPageModifier())
    }
}
