import SwiftUI

// LazzyMerlin DS · Divider (跨元件統一分隔線)
// 結構：0.5pt 高 · border 色 · 可選 leading inset (給 list row 用)
//
// 用法：
//   LMDivider()                    // 全寬
//   LMDivider(inset: 16)           // 留 16pt leading inset (list row 風格)
//   LMDivider(opacity: 0.3)        // 更淡
//
// 取代：
//   - LMListDivider (改 alias 給舊 callsite)
//   - 散在各 view 的 Divider().overlay(Color.border) / Color.border.opacity(...)

struct LMDivider: View {

    var inset: CGFloat = 0
    var opacity: Double = 0.5

    var body: some View {
        Rectangle()
            .fill(Color.border.opacity(opacity))
            .frame(height: 0.5)
            .padding(.leading, inset)
    }
}

// MARK: - List-row variant alias (向後相容 LMList.swift 內舊 callsite)

typealias LMListDivider = LMDivider
