import SwiftUI

// LazzyMerlin DS · Sheet Chrome
// 把系統 sheet 的 Liquid Glass + 圓角換成 brand 配方
// .presentationBackground(Color.bg) · .presentationCornerRadius(28) · 自訂 drag indicator
// 用法：在 sheet content root 上加 `.lmSheetChrome()`

struct LMSheetChromeModifier: ViewModifier {
    var cornerRadius: CGFloat = LMRadius.sheet
    var showsDragIndicator: Bool = true

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            if showsDragIndicator {
                Capsule()
                    .fill(Color.inkMuted.opacity(0.35))
                    .frame(width: LMControlSize.iconButton, height: 5)
                    .padding(.top, LMSpacing.sm)
                    .padding(.bottom, LMSpacing.xxs)
            }
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.bg)
        #if os(iOS)
        .presentationBackground(Color.bg)
        .presentationCornerRadius(cornerRadius)
        .presentationDragIndicator(.hidden)
        #endif
    }
}

extension View {
    /// LazzyMerlin sheet chrome — bg + corner + 自訂 drag indicator
    /// 套在 sheet content 的 root 上、取代系統 Liquid Glass + 黑色 drag bar
    func lmSheetChrome(cornerRadius: CGFloat = LMRadius.sheet, showsDragIndicator: Bool = true) -> some View {
        modifier(LMSheetChromeModifier(cornerRadius: cornerRadius, showsDragIndicator: showsDragIndicator))
    }
}
