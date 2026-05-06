import SwiftUI

// LazzyMerlin DS · Section container
// 取代每個 view 各自定義的 private `section(_:content:)` helper
// 統一 catalog 跨頁面的 section 結構：sectionLabel uppercase title + content with VStack 12 spacing
//
// 用法：
//   LMSection("EDITORIAL CARD") {
//       Text("...")
//   }

struct LMSection<Content: View>: View {
    let title: String
    var spacing: CGFloat
    @ViewBuilder var content: () -> Content

    init(_ title: String,
         spacing: CGFloat = 12,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title).sectionLabel()
            content()
        }
    }
}
