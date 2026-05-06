//
//  Color+Brand.swift · LazzyMerlin DS Preview
//
//  Xcode 26 起，Asset Catalog 的 colorset 會自動 generate `Color.xxx`
//  Swift extension（見 GeneratedAssetSymbols.swift），所以這個檔案
//  原本手寫的 `static let bg = Color("Bg")` 等全部變成 redeclaration。
//
//  保留此檔作 documentation：
//
//  ## Wood Palette (8 色 brand DNA · §1)
//
//  asset name      | Swift attribute       | hex (light → dark)
//  ----------------+-----------------------+--------------------------------
//  Bg              | Color.bg              | #F5EFE4 → #0F1C26
//  BgRaised        | Color.bgRaised        | #F5EFE4 → #0F1C26 (同 Bg)
//  Surface1        | Color.surface1        | #F2ECDF → #152633
//  Surface2        | Color.surface2        | #EEE5D6 → #1A3040
//  BgMuted         | Color.bgMuted         | #DECCA7 → #4E3029
//  Ink             | Color.ink             | #0F1C26 → #F5EFE4
//  InkMuted        | Color.inkMuted        | #4E3029 → #DECCA7
//  PrimaryDeep     | Color.primaryDeep     | #334D5C → #334D5C
//  PrimaryBrand    | Color.primaryBrand    | #46647C → #5E7A8D
//                                            (asset 改名避開 SwiftUI 內建 Color.primary)
//  PrimarySoft    | Color.primarySoft     | #5E7A8D → #46647C (互換)
//  Stone           | Color.stone           | #967459 → #967459
//
//  ## Earth Tone Status Extension (§2.2.2)
//
//  EarthRed        | Color.earthRed        | #9E5949 → #9E5949   (destructive / error)
//  EarthGreen      | Color.earthGreen      | #596751 → #596751   (success)
//  EarthOchre      | Color.earthOchre      | #CB9B52 → #CB9B52   (warning)
//
//  ## Hairline / Border (§2.2.1)
//
//  Hairline        | Color.hairline        | #967459 30% → #5E7A8D 30%
//  Border          | Color.border          | #0F1C26 10% → #F5EFE4 8%
//
//  ## Asset → Swift attribute 命名規則
//
//  Xcode 26 把 PascalCase folder name 轉成 lowerCamelCase Swift attribute：
//      `BgRaised.colorset` → `Color.bgRaised`
//      `EarthRed.colorset` → `Color.earthRed`
//
//  踩坑警告：colorset name 不能跟 SwiftUI 內建 attribute 衝突
//  （`Primary` → `Color.primary` 跟 `View.foregroundStyle(.primary)` 衝突 → warning）
//  我們用 `PrimaryBrand` 避開。
//

import SwiftUI

// MARK: - Semantic opacity variants
//
// 散在各 view 的 `Color.inkMuted.opacity(0.65)` / `.opacity(0.40)` / `.opacity(0.55)`
// 統一成語義化 alias、避免 hardcode magic number、跨 view 一致。
//
// 對應使用情境：
//   inkMutedSubdued  · footer / meta / 次要說明文字 (0.65)
//   inkMutedDisabled · disabled state 的字色 / placeholder (0.40)
//   borderSubtle     · skeleton / 不重要的分隔線 (0.16)

extension Color {
    /// 次要說明文字 · footer / meta / disabled hint (~65% inkMuted)
    static var inkMutedSubdued: Color { Color.inkMuted.opacity(0.65) }

    /// Disabled state 字色 / placeholder (~40% inkMuted)
    static var inkMutedDisabled: Color { Color.inkMuted.opacity(0.40) }

    /// 弱化分隔 / skeleton fill (~16% inkMuted)
    static var borderSubtle: Color { Color.inkMuted.opacity(0.16) }
}
