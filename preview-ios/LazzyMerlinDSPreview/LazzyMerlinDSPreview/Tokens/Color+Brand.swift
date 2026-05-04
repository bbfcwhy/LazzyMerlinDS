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
//  EarthRed        | Color.earthRed        | #9E5949 → #C58775   (destructive / error)
//  EarthGreen      | Color.earthGreen      | #6A7A60 → #A8B898   (success)
//  EarthOchre      | Color.earthOchre      | #8E6E37 → #D4AB6E   (warning)
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
