import SwiftUI

// LazzyMerlin DS · Pagination (頁碼控制)
// 結構：[< prev] [1] [2] ... [n-1] [n] [next >]
//   - 當前頁用 TactilePressedButtonStyle (selected toggle 質地)
//   - 其他頁碼用 TactileGhostButtonStyle (text-only)
//   - prev/next 也用 ghost、boundary 時 disabled + 0.4 opacity
// 自動 truncation：頁數 > 7 時用 ... 簡寫 (顯示頭 + 當前 ± 1 + 尾)
// 用法：
//   LMPagination(current: $page, total: 12)

struct LMPagination: View {

    @Binding var current: Int   // 1-based
    let total: Int
    var siblings: Int = 1       // 當前頁前後幾頁也顯示

    var body: some View {
        HStack(spacing: 8) {
            // Prev arrow
            navIcon("chevron.left", enabled: current > 1) {
                if current > 1 { current -= 1 }
            }

            // Page numbers (with ellipsis truncation)
            ForEach(Array(visiblePages.enumerated()), id: \.offset) { _, item in
                pageItem(item)
            }

            // Next arrow
            navIcon("chevron.right", enabled: current < total) {
                if current < total { current += 1 }
            }
        }
    }

    // MARK: - Page item rendering

    @ViewBuilder
    private func pageItem(_ item: Item) -> some View {
        switch item {
        case .number(let n):
            if n == current {
                Button("\(n)") {}
                    .buttonStyle(TactilePressedButtonStyle(radius: 10, paddingV: 8, paddingH: 12))
            } else {
                Button("\(n)") {
                    current = n
                }
                .buttonStyle(TactileGhostButtonStyle(paddingV: 8, paddingH: 12))
            }
        case .ellipsis:
            Text("…")
                .foregroundStyle(Color.inkMuted)
                .padding(.horizontal, 4)
        }
    }

    @ViewBuilder
    private func navIcon(_ symbol: String, enabled: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: symbol)
                .font(.lmCaption.weight(.semibold))
        }
        .buttonStyle(TactileGhostButtonStyle(paddingV: 8, paddingH: 12))
        .disabled(!enabled)
        .opacity(enabled ? 1 : 0.40)
    }

    // MARK: - Truncation logic

    enum Item {
        case number(Int)
        case ellipsis
    }

    private var visiblePages: [Item] {
        guard total > 1 else { return [.number(1)] }

        // 頁數少 (≤ 7) 全顯示、不省略
        if total <= 7 {
            return (1...total).map { .number($0) }
        }

        var items: [Item] = []
        let leftWindow = max(2, current - siblings)
        let rightWindow = min(total - 1, current + siblings)

        // 永遠秀第 1 頁
        items.append(.number(1))

        // 中間 ellipsis (如果 leftWindow 跳過 2)
        if leftWindow > 2 {
            items.append(.ellipsis)
        }

        // 中間頁碼
        for n in leftWindow...rightWindow {
            items.append(.number(n))
        }

        // 中間 ellipsis (如果 rightWindow 跳過 total - 1)
        if rightWindow < total - 1 {
            items.append(.ellipsis)
        }

        // 永遠秀最後 1 頁
        items.append(.number(total))

        return items
    }
}
