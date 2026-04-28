# Changelog

LazzyMerlin Design System 版本紀錄。版本號遵循 [Semantic Versioning](https://semver.org/lang/zh-TW/)，格式參考 [Keep a Changelog](https://keepachangelog.com/zh-TW/1.1.0/)。

> Breaking change 政策、版本 bump 規則見 `DESIGN.md §17 Versioning`。

## [Unreleased]

## [0.1.3] — 2026-04-28

### Changed
- **`preview/og-template.html` palette 全面升版到 v0.1.2 wood palette**（原檔停留在 v0.1.0 finalize 前的舊 palette `#F7F2E8 / #416880 / #1C1410 / #5C5247`，跟現行 DS 不一致）
  · `--bg` `#F7F2E8` → `#F5EFE4` Parchment
  · `--ink` `#1C1410` → `#0F1C26` Midnight Petrol
  · `--primary` `#416880` → `#46647C` Petrol
  · `--ink-muted` `#5C5247` → `#4E3029` Espresso
  · `--stone` `#5C5247` → `#967459`
  · `--hairline` `rgba(92,82,71,0.3)` → `rgba(150,116,89,0.30)`
  · Dark mode 同步：`bg #070D14` → `#0F1C26`、`primary #699FC5` → `#5E7A8D` 互換、`ink-muted #8B7D71` → `#DECCA7`
- **og-orb-2 暖色** 從 `oklch(0.65 0.06 65 / 0.2)` 改用 `var(--earth-ochre)`（light `#8E6E37` / dark `#D4AB6E`），保留「左下暖調 vs 右上 Petrol 冷調」對比但對齊 §2.2 earth tone status extension
- **DESIGN.md §11.3 模板檔案路徑修正** · 從 `~/.gstack/projects/LazzyMerlin/designs/design-system-20260422/v3/og-template.html`（指到 gstack 外部 designs 目錄）改為 repo 內實際路徑 `preview/og-template.html`，跟 §13.3 一致

### Why
2nd Brain（Obsidian vault）未來要做大量社群貼文 + IG 圖卡 + Notion 同步，會把 §11.3 OG template 當 reference。og-template.html 是 §13.3 列為 canonical 的 active asset，但內容停留在舊 palette —— 任何子專案 / AI 工具拿這檔當 reference 都會學到錯的調色。本 patch 把 canonical 跟 spec 對齊。

### Preserved
- og-template HTML 結構不動（layout / typography / 簽名 / `◈` corner sigil 全保留）
- 已生產的 OG image PNG 不受影響（static screenshots）

[0.1.3]: https://github.com/bbfcwhy/LazzyMerlinDS/releases/tag/v0.1.3

## [0.1.2] — 2026-04-28

### Added
- `docs/landing-checklist.md` · 跨子專案落地 onboarding 文件。新 session Claude paste 第 0 段 prompt 即可進入 LazzyMerlin DS 心智，後續按 Phase 0~8 走完字體載入 / tokens / CSS variables / Tactile material / 元件 MVP / Theme switch / Ambient layer / 邊緣狀態文案。附反面教材清單、跟 DS repo 互動規則、落地驗收 checklist。同時是 §17.6 v1.0 條件第 3 項「跨平台落地 QA Checklist」初步版本。
- DESIGN.md §13.3 加 reference 指向 `docs/landing-checklist.md`

### Changed
- **Repo visibility · PRIVATE → PUBLIC**。LazzyMerlin DS 設計上就是 brand-level source of truth，沒 secrets，公開後 raw URL / GitHub link / Tokens Studio sync 都可不需 auth 直接用，未來合作者 / 跨專案落地 / AI 工具 onboarding 都更順
- README License section 重寫 · 從「私人 brand assets，未公開授權」改成 dual licensing：spec / code 開放參考（CC BY 4.0 精神，需 attribution）、brand identity / logo / character 保留所有權
- **`docs/landing-checklist.md` Phase 1 字體載入** 補強 framework 專用建議：Next.js 13+ 走 `next/font/google` + `next/font/local`（SSR preload / 自動 self-host / 自動 subset / 防 layout shift），純 HTML / Vite / Astro 走 CDN `<link>` 或 `@fontsource/*`，iOS / macOS bundle 維持 §7.2/§7.3 規範。LXGW WenKai TC 不在 Google Fonts ESM API，須走 local font 路徑並下載到 `public/fonts/`。**此補強由 lazzywill 個人網站 2026-04-28 落地實測得到，回流補進 checklist**
- DESIGN.md §15.8.3 Pagination 補完整規範（active = Pressed、button 統一 36×36、CSS pattern 範例）
- `assets/Lazzy Merlin Logo_3D.png` 重新壓縮 8.4MB → 4.2MB（保真度幾乎不變、git clone / Tokens Studio sync / OG image fetch 都更輕）

### Validated
- **§17.6 v1.0 條件第 1 條達成 ✓** · 個人網站 lazzywill 完整落地驗證（落地驗收 checklist 10 項全綠：字體載入 / Light + Dark mode / reduced motion / focus ring / AA 對比 / 沒引入新 hex / 反面教材 9 條全沒踩 / 邊緣狀態文案套 §10.3 / Footer 簽名 / production build 成功）。子專案 pin v0.1.1，未來跟著 DS 升版同步

### Fixed
- Pagination active page 從 Tactile-Raised 改 Tactile-Pressed。原本 Raised 的 4 層 drop shadow 視覺中心偏右下、造成數字看起來偏左上；且在 list 內顯得太重。改 Pressed inset shadow 後 active page 文字精確置中、跟其他 ghost button 視覺節奏一致，跟 §15.5.1 chip-selected 邏輯統一
- Pagination button 統一 `36×36px + padding: 0 + justify-content: center`，確保所有 page button 同尺寸

[0.1.2]: https://github.com/bbfcwhy/LazzyMerlinDS/releases/tag/v0.1.2

## [0.1.1] — 2026-04-27

### Changed
- 規範文件（`DESIGN.md` / `README.md`）移除所有具名子專案引用，改用抽象敘述（「子專案」/「個人網站」/「遊戲類專案」）
- Demo HTML（`preview/components-preview.html` / `components-preview-palette-A.html` / `preview.html` / `og-template.html`）改用 fictional placeholder（「範例 · 一」/「專案 A」），保留 typography hierarchy 視覺溫度但不指名真實專案
- `DESIGN.md §13.3` 資產路徑修正為實際檔名（`Lazzy Merlin Logo.png` / `Lazzy Merlin Logo_3D.png`）+ OG template 改 repo-relative path

### Fixed
- `components-preview.html` / `components-preview-palette-A.html` · `.progress-linear__bar` 補上 `::after + z-index: -1` noise overlay（v0.1.0 漏改 —— `.slider__fill` 已有但 progress bar 沒同步），跟其他純色填色區塊觸感統一

### Removed
- `DESIGN.md §13.3`「現有個人網站（配色 source of truth）」條目 —— DS 已穩定獨立、不再從個人網站 sync palette，歷史脈絡見 §16
- `§7.7` 中「LazzyMerlin Games」sub-brand 命名（簡化為 `✦ LazzyMerlin` 通用簽名）

### Preserved
- `DESIGN.md §16 Decisions Log` 歷史條目不改寫（paper trail 跟 git log 同性質，改寫破壞 immutability）
- `CLAUDE.md` 個人 working instructions 不動（非 DS proper · 是 repo 內 AI 操作指引）

### Why
DS 應該是 brand-level 的純規範，不該耦合具體子專案。子專案會更替、對外分享時不該強迫他人理解這些專案。清乾淨後 LazzyMerlin DS 可作為跨專案 source of truth，未來新專案套用時不會誤以為「一定要做這幾個專案」。

[0.1.1]: https://github.com/bbfcwhy/LazzyMerlinDS/releases/tag/v0.1.1

## [0.1.0] — 2026-04-26

第一次正式 release。LazzyMerlin（慵懶梅林實驗室）品牌核心 design system 從零成型，涵蓋品牌核心、視覺語言、跨平台落地、完整 Components 規範、Accessibility。

### Added

**規範文件（`DESIGN.md`，§1～§17）**
- §1 品牌核心 · 二人（+ 雙貓）實驗室定位、tone of voice（冷面笑匠 + 水瓶座機鋒）、魔法感承載原則
- §2 色彩系統 · **8 色 wood palette**（Petrol 三層藍 + 木質暖調）+ **3 色 Earth Tone Status Extension**（Terracotta / Sage / Ochre）+ Theme Switch 規範
- §3 字體系統 · 3 family（LXGW WenKai TC + Geist + Noto Sans TC）+ 10 階 type scale
- §4 間距 / Layout / 形狀 · spacing 11 階 + radius 6 階 + z-index 11 階 + 4 breakpoint
- §5 動態與材質 · **Tactile material 為主視覺語言**（三層 register：Tactile / Hybrid / Soft Inset）+ 5 個 ambient signature
- §6 裝飾元素 · unicode glyphs / hairline / small-caps label / 羅馬數字
- §7 跨 7 平台套用指南 · Web / iOS / macOS / Notion / Chrome ext / IG / Game
- §8 Brand Mark + **App Icon 家族**（iOS / macOS / Android / PWA）
- §9 Character 系統 · 梅林 / 雙貓 / 威爾
- §10 命名敘事 + 邊緣狀態文案（404 / Loading / Empty / Error）
- §11 Imagery 指南 + OG template + **Iconography**（Lucide stroke 1.75px）
- §12 反面教材
- §13 實作參考
- §14 **Accessibility** · focus ring / reduced motion / ARIA / 觸控目標
- §15 **Components 規範** · Buttons / Form / Cards / Chips / Overlays / Feedback / Navigation / Data Display / State Layouts（10 大類元件）
- §16 Decisions Log · 17 筆完整 paper trail
- §17 Versioning 政策

**視覺資產**
- `assets/Lazzy Merlin Logo.png` · 主 logo 2D 版（女巫 + 雙貓 + 弧形字）
- `assets/Lazzy Merlin Logo_3D.png` · 立體 render 版（hero / splash / social media）

**元件實作參考**
- `preview/components-preview.html` · §15 元件視覺實作（canonical）
- `preview/components-preview-palette-A.html` · 三層藍 palette what-if 對照（deprecated，作決策歷史）
- `preview/og-template.html` · 1200×630 OG image 模板
- `preview/preview.html` · 早期過渡版（deprecated）

**結構化 Design Tokens（`tokens/`）**
- `tokens/color.json` · Wood palette 8 色 + Earth tone 6 變體 + light/dark mode role tokens + transparent
- `tokens/typography.json` · Font family / weight / 10 階 type scale
- `tokens/dimension.json` · Spacing 11 階 / radius 6 階 / z-index 11 階 / breakpoint 4 個
- `tokens/shadow.json` · Soft Neumorphic + Tactile-Raised box-shadow（按元件大小：button / card / chip / avatar / badge）
- `tokens/motion.json` · Duration / easing tokens
- W3C Design Tokens 草案格式，相容 Figma Tokens Studio + Style Dictionary

**Repo 治理**
- `README.md` · Repo landing
- `CHANGELOG.md` · 本檔案
- Git repo + GitHub remote `bbfcwhy/LazzyMerlinDS`
- `git tag v0.1.0`

### Decisions（精選）

詳見 `DESIGN.md §16` 17 筆完整紀錄。最重要決策：

- **Tactile material 升格為 DS 主視覺語言**（非 flat / 非 neo-brutalist）—— 配方：對角光源 + 雙層 inset rim + 多層 drop shadow + noise overlay。`preview/components-preview.html` 為 canonical reference
- **嚴格 8 色 wood palette + 3 色 Earth Tone Extension**（不做鮮豔紅綠黃 / 金 / 紫）
- **Avatar fallback 三色循環用「藍 + 棕 + 綠」三 hue**（避免三層藍視覺擠壓 · 借 earth-green 給 avatar fill）
- **Tactile noise 用 `::after` + `z-index: -1` + `isolation: isolate`**（不用 `background-blend-mode`，避免顏色變深 + 文字被染色）
- **Loading state 不弱化 color，靠 spinner + `pointer-events: none`**（避免 `currentColor` cycle 踩坑 + alpha mix 字色不一致）
- **品牌定位為「二人（+ 雙貓）實驗室」**（Merlin 是老婆名字諧音 · 梅林出主意 · 威爾用 AI 實現）

[Unreleased]: https://github.com/bbfcwhy/LazzyMerlinDS/compare/v0.1.3...HEAD
[0.1.0]: https://github.com/bbfcwhy/LazzyMerlinDS/releases/tag/v0.1.0
