# LazzyMerlin DS Preview · iOS / macOS

LazzyMerlin DS §5.4 Tactile material 跨平台共通配方的 SwiftUI reference impl + 視覺一致性驗證。

## 目的

跟 web preview（[`../preview/components-preview.html`](../preview/components-preview.html)）並列存在，驗證 web 跟 iOS / macOS 三平台的 Tactile 視覺氣質「分不太出來」。

`screenshots/` 內的 side-by-side 截圖是 visual regression baseline —— 每次改動 §5.4 配方都要重截、確認跨平台一致。

## 目錄結構

```
preview-ios/
├── README.md                                    ← 本檔
├── screenshots/                                 ← visual regression baseline
└── LazzyMerlinDSPreview/                        ← Xcode project root
    ├── LazzyMerlinDSPreview.xcodeproj/          ← gitignored（user-specific paths）
    └── LazzyMerlinDSPreview/                    ← file-system synchronized source folder
        ├── LazzyMerlinDSPreviewApp.swift        @main + AppearancePreference
        ├── ContentView.swift                    NavigationStack gallery
        ├── Tokens/
        │   ├── Color+Brand.swift                8 色 wood palette + 3 earth tone
        │   ├── TactileMaterial.swift            tactileRaised/Base/Inset/Pressed ViewModifier
        │   └── BrandTypography.swift            iOS type scale + .sectionLabel()
        ├── Sections/
        │   ├── ButtonsView.swift
        │   ├── CardsView.swift
        │   ├── ChipsView.swift
        │   ├── FormView.swift
        │   ├── FeedbackView.swift
        │   └── ModalView.swift
        └── Assets.xcassets/                     15 colorset + TactileNoise.imageset
```

Source 檔案在 `preview-ios/LazzyMerlinDSPreview/LazzyMerlinDSPreview/`（雙層、Xcode 標準 multiplatform app 結構）。Xcode 26 的 file-system synchronized group 會自動 sync 這個 folder 內的所有檔案到 build target，新增 / 改名 / 刪除 source 不需要在 .xcodeproj 內手動維護 reference。

## 首次 setup（Xcode wizard）

如果你還沒建 .xcodeproj（或 git clone 後第一次 setup）：

### 1. Xcode 開新 Multiplatform App

```
Xcode → File → New → Project... → Multiplatform → App → Next
```

填寫：

| 欄位 | 值 |
|---|---|
| Product Name | `LazzyMerlinDSPreview` |
| Team | （個人 Apple Developer 帳號 or None for simulator-only） |
| Organization Identifier | `com.lazzymerlin` |
| Bundle Identifier | `com.lazzymerlin.LazzyMerlinDSPreview`（auto） |
| Interface | SwiftUI |
| Language | Swift |
| Storage | None |
| Testing System | None（如果 dropdown 沒 None 選預設、之後忽略 test target） |

存到：`/Users/bbfcwhy/Projects/LazzyMerlin/preview-ios/`（**注意：選到 `preview-ios/` 這層、Xcode 會在裡面再建一層 `LazzyMerlinDSPreview/`**）

> **取消 "Create Git Repository" checkbox**（如果有）—— 避免 wizard 在 project folder 內 git init 出 nested repo（外層 LazzyMerlin DS 已經是 git repo）

### 2. 處理 wizard 預設 source files

Wizard 會在 `preview-ios/LazzyMerlinDSPreview/LazzyMerlinDSPreview/` 內生三個預設檔（會跟我寫好的同名衝突）：
- `LazzyMerlinDSPreviewApp.swift`
- `ContentView.swift`
- `Assets.xcassets/`

兩個處理方式：

**A. Finder 內手動移動**（推薦）  
在 Finder 開 `preview-ios/LazzyMerlinDSPreview/LazzyMerlinDSPreview/`，把這三個 wizard 預設項目丟進垃圾桶，然後從 git restore 出我寫好的版本（如果 working tree 沒有的話 `git restore preview-ios/LazzyMerlinDSPreview/`）。

**B. Xcode 內刪除**  
打開 Xcode、navigator 內 right-click 三個檔案 → Delete → Move to Trash。然後 drag 我寫好的同名檔進去。

完成後 file-system synchronized group 會自動 sync 我寫的版本進 build target。

### 3. 處理 wizard 自動建的 nested .git（如果有）

如果 wizard `Create Git Repository` 沒取消，會在 `preview-ios/LazzyMerlinDSPreview/.git/` 建 nested repo。Finder 開那層、按 Cmd+Shift+. 顯示隱藏檔案、把 `.git` 丟垃圾桶。

### 4. Build & Run

| Target | 跑法 |
|---|---|
| **iOS** | scheme 選 LazzyMerlinDSPreview (iOS) + 模擬器選 iPhone 17 Pro → Cmd+R |
| **macOS** | scheme 選 LazzyMerlinDSPreview (macOS) → Cmd+R |

跑起來會看到 NavigationStack gallery：Buttons / Cards / Chips / Form / Feedback / Modal 六個 component sections，加 Appearance picker 三態（系統 / 淺色 / 深色）。

## 截圖工作流

每個 component 截圖兩張（light + dark），跑 iOS 跟 macOS 兩平台 = 4 張 / component × 6 components = **24 張截圖**。

放到：`preview-ios/screenshots/`，命名：

```
buttons-ios-light.png       buttons-ios-dark.png
buttons-macos-light.png     buttons-macos-dark.png
cards-ios-light.png         cards-ios-dark.png
... (6 components × 4 = 24)
```

iOS 截圖：模擬器 Cmd+S → 自動存到 Desktop，再搬到 screenshots/  
macOS 截圖：Cmd+Shift+5 選 LazzyMerlinDSPreview window → 截圖

## 視覺比對 workflow

screenshot 收齊後：

1. 開 web preview（`../preview/components-preview.html`）—— Chrome devtools 模擬同 viewport（iOS：390×844 iPhone 14 / macOS：480×800）截 web 對應 component 的 screenshot
2. 用 [`../comparison/index.html`](../comparison/index.html) side-by-side 並排顯示 web vs iOS / macOS（v0.2.0 final 才生）
3. 看哪邊「不夠分不太出來」→ 反覆校正 §5.4 共通六件配方數值
4. iterate 直到三平台視覺氣質真正一致

## .gitignore 設定（已加）

`.xcodeproj` / `xcuserdata/` 等含 user-specific paths，**不 commit 進 repo**。LazzyMerlin DS root `.gitignore` 已加：

```
preview-ios/**/*.xcodeproj/
preview-ios/**/xcuserdata/
preview-ios/**/*.xcuserstate
preview-ios/**/build/
preview-ios/**/.DS_Store
preview-ios/**/_wizard_backup/
```
