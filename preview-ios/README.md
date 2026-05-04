# LazzyMerlin Preview · iOS / macOS

LazzyMerlin DS §5.4 Tactile material 跨平台共通配方的 SwiftUI reference impl + 視覺一致性驗證。

## 目的

跟 web preview（[`../preview/components-preview.html`](../preview/components-preview.html)）並列存在，驗證 web 跟 iOS / macOS 兩平台的 Tactile 視覺氣質「分不太出來」。

`screenshots/` 內的 side-by-side 截圖是 visual regression baseline —— 每次改動 §5.4 配方都要重截、確認跨平台一致。

## 快速 setup（10 分鐘）

由於 .xcodeproj 不放進 repo（user-specific paths），首次 clone 後需要在 Xcode 自建 project。流程：

### 1. Xcode 開新 Multiplatform App

```
Xcode → File → New → Project...
  → Multiplatform → App
  → Next
```

填寫：

| 欄位 | 值 |
|---|---|
| Product Name | `LazzyMerlinPreview` |
| Team | （你個人 Apple Developer 帳號或 None for simulator-only） |
| Organization Identifier | `ai.lazzymerlin` |
| Bundle Identifier | `ai.lazzymerlin.LazzyMerlinPreview`（auto） |
| Interface | SwiftUI |
| Language | Swift |
| Storage | None |
| Include Tests | ☐（不要） |

存到：`/Users/bbfcwhy/Projects/LazzyMerlin/preview-ios/`（**注意：要選到 `preview-ios/` 這層、Xcode 會在裡面再建一層 `LazzyMerlinPreview/`**）

> 如果你已經有 `preview-ios/LazzyMerlinPreview/` 資料夾，存 project 時 Xcode 會合併進來。

### 2. 刪掉 Xcode 預設檔、用我寫好的取代

Xcode wizard 會自動生兩個檔：
- `LazzyMerlinPreview/LazzyMerlinPreviewApp.swift`
- `LazzyMerlinPreview/ContentView.swift`

兩個 Xcode 生的檔都**直接刪掉**（Move to Trash）。preview-ios/LazzyMerlinPreview/ 內已經有我寫好的同名檔。

### 3. 把現有 source files drag 進 Xcode

在 Finder 打開 `preview-ios/LazzyMerlinPreview/`，把這些 drag 進 Xcode 的 navigator（拖到 LazzyMerlinPreview 群組底下）：

- `LazzyMerlinPreviewApp.swift`
- `ContentView.swift`
- `Tokens/` 整個資料夾
- `Sections/` 整個資料夾

drag 時 Xcode 會問：
- ☑ Copy items if needed —— **不打勾**（檔案已經在正確位置）
- ☑ Create groups —— 打勾
- ☑ Add to targets: LazzyMerlinPreview (iOS), LazzyMerlinPreview (macOS) —— 兩個都打勾

### 4. Asset catalog 取代

Xcode wizard 會自動生 `LazzyMerlinPreview/Assets.xcassets/`。我寫好的 asset catalog 已在同位置（包含 15 個 colorset + TactileNoise imageset），直接覆蓋即可：

```bash
# Xcode 關閉的情況下執行
rm -rf preview-ios/LazzyMerlinPreview/Assets.xcassets.bak
mv preview-ios/LazzyMerlinPreview/Assets.xcassets preview-ios/LazzyMerlinPreview/Assets.xcassets.bak
# (Xcode wizard 生的版本備份)
# 我寫的版本應該已在 preview-ios/LazzyMerlinPreview/Assets.xcassets/
# 重開 Xcode 即可
```

或者在 Xcode 直接刪掉 wizard 的 Assets.xcassets，drag 我的版本進去。

### 5. 設定 Info.plist 路徑

我把 Info.plist 放在 source folder **外**（`preview-ios/Info.plist`，跟 .xcodeproj 同層），以避開 Xcode 26 file-system synchronized group 的「Multiple commands produce 'Info.plist'」error（landing-checklist Phase 0 的踩雷）。

設定路徑：

```
Xcode → Project navigator 選 LazzyMerlinPreview project
  → Build Settings → 搜 "Info.plist"
  → Info.plist File：改成 ../Info.plist (or absolute path)
```

兩個 target（iOS + macOS）都要設。

### 6. macOS target 額外設定

macOS sandbox 需要：
```
TARGETS → LazzyMerlinPreview (macOS) → Signing & Capabilities
  → App Sandbox（Xcode 預設加，保留即可）
```

### 7. Build & Run

| Target | 跑法 |
|---|---|
| **iOS** | scheme 選 LazzyMerlinPreview (iOS) + 模擬器選 iPhone 17 Pro → Cmd+R |
| **macOS** | scheme 選 LazzyMerlinPreview (macOS) → Cmd+R |

跑起來後左上角 Master list 會看到：Buttons / Cards / Chips / Form / Feedback / Modal 六個 component sections。

## 截圖工作流

每個 component 截圖兩張（light + dark），跑 iOS 模擬器跟 macOS 兩平台 = 4 張 / component × 6 components = **24 張截圖**。

放到：`preview-ios/screenshots/`，命名：
- `buttons-ios-light.png`
- `buttons-ios-dark.png`
- `buttons-macos-light.png`
- `buttons-macos-dark.png`
- ...（其他五個 component 同模式）

iOS 截圖：模擬器 Cmd+S → 自動存到 Desktop，再搬到 screenshots/  
macOS 截圖：Cmd+Shift+5 選 LazzyMerlinPreview window → 截圖

## 視覺比對 workflow

screenshot 收齊後：

1. 開 web preview（`../preview/components-preview.html`）—— Chrome devtools 模擬同 viewport（iOS：390×844 iPhone 14 / macOS：480×800）截 web 對應 component 的 screenshot
2. 用 [`../comparison/index.html`](../comparison/index.html) side-by-side 並排顯示 web vs iOS / macOS
3. 看哪邊「不夠分不太出來」→ 反覆校正 §5.4 共通六件配方數值
4. iterate 直到三平台視覺氣質真正一致

## Source 結構

```
preview-ios/
├── README.md                        ← 本檔
├── Info.plist                       ← 放 source folder 外（Xcode 26 quirk）
├── LazzyMerlinPreview/
│   ├── LazzyMerlinPreviewApp.swift  app entry
│   ├── ContentView.swift            NavigationStack gallery
│   ├── Tokens/
│   │   ├── Color+Brand.swift        8 色 wood palette
│   │   ├── TactileMaterial.swift    Raised / Base / Inset / Pressed ViewModifier
│   │   └── BrandTypography.swift    type scale + .sectionLabel()
│   ├── Sections/
│   │   ├── ButtonsView.swift
│   │   ├── CardsView.swift
│   │   ├── ChipsView.swift
│   │   ├── FormView.swift
│   │   ├── FeedbackView.swift
│   │   └── ModalView.swift
│   └── Assets.xcassets/             15 colorset + TactileNoise.imageset
└── screenshots/                     ← visual regression baseline
```

## .gitignore 提示

`.xcodeproj` / `xcuserdata/` 內含 user-specific paths，**不 commit 進 repo**。在 LazzyMerlin DS root `.gitignore` 加：

```
preview-ios/*.xcodeproj/
preview-ios/**/xcuserdata/
preview-ios/**/.DS_Store
```

`.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist` 等 shared 檔案可以 commit，但 user-specific xcschememanagement.plist 不要。
