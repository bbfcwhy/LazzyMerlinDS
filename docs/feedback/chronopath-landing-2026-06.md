# DS 回饋 · ChronoPath landing（2026-06 · G11–G27）

> 來源：ChronoPath（iOS）把 LazzyMerlin DS 全面落地的過程（G11–G27）。本文整理「DS 真正缺的東西」與「落地時發現的 drift」，回饋給 DS single source of truth。

## TL;DR

- **真 gap（DS 缺、已於本 PR 補上）**：① iOS `LMProgressBar`（determinate 進度條）② `LMDatePicker` 的 `.dateAndTime` / `.time` 模式。
- **Drift（ChronoPath 重複發明了 DS 已有的東西）**：`LMAlert` / `LMActionSheet` / `LMSpinner` ChronoPath 各自有平行實作 → 應由 **ChronoPath 反向採用 DS 正版**（另案處理，非本 PR）。
- **Pattern（DS spec 未明載、值得補進落地指南）**：原生 `Form`/`List` 壓平成 DS 米色的食譜、`tactileInset` 當文字輸入框。

---

## 1. 真 gap（本 PR 已補）

### 1.1 `LMProgressBar`（determinate 進度條 · iOS）

- **狀況**：DS `DESIGN.md §15.7.2 Progress Indicator` 只有 web linear progress 規格，**無 iOS 參考實作**。ChronoPath 唯一一處原生 `ProgressView(value:)`（PDF 匯出進度）無 DS 對應元件。
- **本 PR**：新增 `preview-ios/.../Tokens/LMProgressBar.swift`。capsule track + brand 漸層 fill + tactile noise（視覺語彙呼應 LMSpinner）。`value` clamp 0...1、accessibilityValue 回報百分比、reduceMotion 關動畫。
- **API**：`LMProgressBar(value:)` / `LMProgressBar(value:height:track:)`。
- **設計待 Merlin 拍板**：fill 上的 tactile noise（0.18 overlay）要不要保留？LMSpinner 是精簡無 noise，progress bar 目前偏 tactile-heavy；兩種都合理，看 DS 想多 tactile。

### 1.2 `LMDatePicker` 的 `.dateAndTime` / `.time` 模式

- **狀況**：DS `LMDatePicker` 是 date-only（graphical 月曆）。ChronoPath 需要「日期+時間」與「純時間」（每日回顧提醒時間）。
- **本 PR**：`LMDatePicker` 加 `enum Components { case date, dateAndTime, time }` + init 參數（預設 `.date`，**向後相容**）。時間 UI DS 自建（不嵌原生 wheel）：雙欄垂直滾輪感（chevron 上 / inset 數字 / chevron 下），重用月曆 header 同款 ghost chevron + `tactileInset` 語彙。
- **正確性重點**：`.dateAndTime` 模式下選「日」會 `combine(day:hour:minute:)` 保留 time-of-day，否則選日會把時間歸零。

---

## 2. Drift（ChronoPath 重複發明 → 應反向採用 DS 正版 · 非本 PR）

落地時**未先從 canonical DS 同步**，導致以下元件被平行重寫。DS 版較完整/正典，**ChronoPath 應另案去-drift 採用 DS 版**：

| 元件 | DS 正版 | ChronoPath drift 版 | 建議 |
|------|---------|---------------------|------|
| `LMAlert` | `LMAlert.swift` 287 行：完整 `LMAlertButton` roles（default/destructive/cancel）、2 鈕橫排 / 3+ 直排、`LMOverlayChrome` scrim | 150 行精簡版、`destructiveLabel` 參數式 API | ChronoPath 改用 DS 的 `[LMAlertButton]` API |
| `LMActionSheet` | 在 `LMAlert.swift` 內：**底部** sheet、action group + 分離 cancel | 獨立檔、**置中**卡片（A/B 拍板選置中）| 呈現位置 DS=底部 / ChronoPath=置中 有分歧 → 見下 §2.1 |
| `LMSpinner` | AngularGradient trimmed arc、精簡無 noise、`color` 參數 | noise + label 版 | 對齊 DS 精簡版 或 DS 接受 label 變體 |
| 事件類型 picker | DS 有 `LMSegmentedPicker` | ChronoPath 用了 `LMMenuPicker` | 評估 segmented 是否更合適 |

### 2.1 呈現位置分歧（需 Merlin 定奪）

DS `LMActionSheet` 是**底部 slide-up**（傳統 iOS action-sheet 語意）；ChronoPath landing 時主人 A/B 拍板選了**置中卡片**（與 LMAlert 置中一致）。

→ 這是一個 **DS spec 層級的決定**：DS 的 modal overlay 要統一「置中」還是「alert 置中 / action sheet 底部」？建議 DS 補一條 §15 overlay 呈現規範，ChronoPath 再對齊。

---

## 3. Pattern 回饋（DS spec 未明載、建議補進落地指南）

### 3.1 原生 `Form` / `List` 壓平成 DS 米色

iOS 原生 `Form`/`List` 預設灰底分組 + 白卡 cell，與 DS 米色背景衝突。ChronoPath 確立的食譜：

```swift
Form { Section { ... }.listRowBackground(Color.clear) }   // 每個 section 都要加
    .scrollContentBackground(.hidden)                       // 去系統灰底
    .background(AppTheme.background)                         // 套 DS 米色
```

- **踩坑**：`.listRowBackground(.clear)` **不會從 Form 層級 propagate**，必須逐 `Section` 加。
- List 的 row 另需 `.listRowSeparator(.hidden)` 去系統分隔線。
- 建議 DS 補一個 `.lmFormChrome()` / `.lmListChrome()` modifier 封裝這組，免得每個專案重踩。

### 3.2 `tactileInset` 當文字輸入框

`TextEditor` / 搜尋 `TextField` 原生白底與 DS 衝突。食譜：

```swift
TextEditor(text: $text)
    .scrollContentBackground(.hidden)   // 去白底
    .padding(8)
    .tactileInset(radius: LMRadius.md)  // DS 內凹輸入框
```

建議 DS 補一個 `LMTextField` / `LMTextEditor` wrapper 或 `.lmInputChrome()` modifier。

---

## 4. 驗證

- DS preview（`LazzyMerlinDSPreview` scheme）`xcodebuild build` ✅ BUILD SUCCEEDED（LMProgressBar + LMDatePicker 擴充皆編譯通過）。
- ChronoPath 端對應元件已實機落地（G19 PDFExport 進度條、G20/G21 提醒時間 picker）。

## 5. 後續

- [ ] Merlin 拍板：LMProgressBar noise 去留、modal overlay 置中/底部規範。
- [ ] DESIGN.md §15.7.2 / §15.3 補 iOS 實作引用（本 PR 已輕觸）。
- [ ] **另案**：ChronoPath 去-drift（採用 DS 正版 LMAlert / LMActionSheet / LMSpinner）。
