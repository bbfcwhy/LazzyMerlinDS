import SwiftUI

// LazzyMerlin DS · Form / List chrome
// 把原生 Form / List 一行壓平成 DS 米色（去系統灰底分組）、取代每個專案重踩
// 對齊 DESIGN.md §15.3 Form（web 端用 div 自排，iOS 想沿用原生 Form/List 時用這組）
//
// ChronoPath landing（2026-06）回饋收編版：原生 Form/List 預設灰底 + 白卡 cell 與 DS 米色衝突。
//
// ⚠️ 關鍵限制（SwiftUI 行為、已實測）：
//   `.lmFormChrome()` 只能處理「容器層背景」——把整片灰底換成米色。
//   但每個 Section/cell 的「白卡底」是 cell-level 背景，`.listRowBackground(.clear)`
//   無法從 Form/List 容器層 propagate 下去，必須逐 Section（或逐 row）套。
//   → 所以白卡消除請搭配 `.lmListRow()`（掛在每個 Section 或 row 上）。
//
// 食譜：
//   Form {
//       Section { … }.lmListRow()      // 逐 Section 清白卡 + 系統分隔線
//       Section { … }.lmListRow()
//   }
//   .lmFormChrome()                     // 容器層：去系統灰底 + 套米色
//
// List 同理用 `.lmListChrome()`（容器層配方相同、語意分開好讀）。

struct LMFormChromeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)   // 去系統灰底分組
            .background(Color.bg)               // 套 DS 米色
    }
}

extension View {
    /// 原生 `Form` 壓平成 DS 米色（容器層）。
    /// ⚠️ 只處理容器背景；Section 白卡請逐 Section 加 `.lmListRow()`（SwiftUI 不會從容器層 propagate）。
    func lmFormChrome() -> some View {
        modifier(LMFormChromeModifier())
    }

    /// 原生 `List` 壓平成 DS 米色（容器層）。配方同 `lmFormChrome()`、語意分開。
    /// ⚠️ 只處理容器背景；row / Section 白卡 + 系統分隔線請逐項加 `.lmListRow()`。
    func lmListChrome() -> some View {
        modifier(LMFormChromeModifier())
    }

    /// 逐 Section（或逐 row）套：清掉 cell 白卡 + 系統分隔線。
    /// 掛在 `Section` 上會 propagate 到該段所有 row；掛在單一 row 上只清那一列。
    /// 這是 `lmFormChrome()` / `lmListChrome()` 的必要配套（容器層蓋不到 row 背景）。
    func lmListRow() -> some View {
        self
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}
