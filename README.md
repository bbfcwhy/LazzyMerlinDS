# LazzyMerlin Design System

> *Shine, lazily and steadily.* ✦

**慵懶梅林實驗室 · LazzyMerlin Lab** 跨平台品牌核心設計系統。

LazzyMerlin 是一個「二人（+ 雙貓）實驗室」—— 梅林出主意、威爾用 AI 把它實現出來。這個 repo 是所有跨專案視覺決策的單一事實來源（single source of truth）：色彩、字體、間距、Tactile 材質、Components、跨平台落地。

## 給誰用

- **威爾自己** —— 跨多個 indie 專案維持品牌一致（個人網站、web app、iOS / macOS app、未來新專案）
- **未來合作者 / contractor** —— 不用問也能照做的視覺規範
- **AI 助理（包括我）** —— 跨 session、跨專案套用品牌時的 reference

## 主要文件

| 檔案 | 內容 |
|---|---|
| **[`DESIGN.md`](DESIGN.md)** | 完整規範（§1～§17）· spec source of truth |
| **[`tokens/`](tokens/)** | 結構化 design tokens（W3C 格式 · 相容 Figma Tokens Studio / Style Dictionary） |
| **[`preview/components-preview.html`](preview/components-preview.html)** | §15 Components 視覺實作（canonical reference） |
| **[`CHANGELOG.md`](CHANGELOG.md)** | 版本紀錄 |
| **[`assets/`](assets/)** | 品牌 logo（2D + 3D） |

## 快速開始

### 在 web 專案落地

1. 複製 `tokens/color.json` / `tokens/dimension.json` 等到專案
2. 用 [Style Dictionary](https://amzn.github.io/style-dictionary/) 產出 CSS variables：
   ```bash
   npx style-dictionary build
   ```
3. 字體從 Google Fonts 載入：
   ```html
   <link href="https://fonts.googleapis.com/css2?family=Geist:wght@300;400;500;600;700&family=Geist+Mono:wght@400;500&family=Noto+Sans+TC:wght@300;400;500;600&family=LXGW+WenKai+TC:wght@400&display=swap" rel="stylesheet">
   ```
4. 元件實作對照 `preview/components-preview.html`（直接 copy CSS pattern）

### 在 iOS / macOS 專案落地

依 `DESIGN.md §7.2` / `§7.3`：
- `accentColor` 設 Petrol Ink `#46647C`（light）/ Sky Petrol `#5E7A8D`（dark）
- Display 字體 LXGW WenKai TC（bundle 進 app）
- Body 字體 SF Pro + PingFang TC（不用 Geist）
- App icon 依 `§8.3` 規範（不畫圓底、Light / Dark / Tinted 三 variant）

### 在 Notion 落地

依 `DESIGN.md §7.4`：
- 頁面 icon 用 `✦` glyph
- Cover 用奶茶米底
- 用 Notion 原生 blue / brown / gray 模擬 brand tokens

## 設計理念

**Tactile material 為主視覺語言** —— 不是 flat、不是 neo-brutalist，而是「材質感」：對角光源 + 雙層 inset rim 雕刻 + 多層 drop shadow + noise overlay。三層 register（Tactile / Hybrid / Soft Inset）對應不同元件需求。

**色彩克制** —— 嚴格 8 色 wood palette（Petrol 三層藍 + 木質暖調），加 3 色 Earth Tone Extension 表達 status（Terracotta / Sage / Ochre · 大地色不是鮮豔紅綠黃）。反美式紅綠燈情緒對比，符合「冷面笑匠」tone。

**魔法感不靠顏色，靠字體與裝飾承載** —— 霞鶩文楷手繪感 + Unicode glyphs（✦ ◈ ❦ ☾）+ 羅馬數字（MMXXVI）+ Small-caps label。

**對使用者克制** —— 「壞了」用陶土紅比刺眼正紅更耐看；「處理中」spinner 已足夠 indicate loading 不需弱化文字；error 不嘲諷使用者只用冷面笑匠機鋒（「頁面沒了。可能我當初就沒做出來。」）。

## 反面教材（不做的事）

完整清單見 `DESIGN.md §12`。最常見：
- ❌ 紫粉漸層 hero / SaaS gradient CTA
- ❌ 全部 full 圓角的 bubbly AI slop
- ❌ 通用 stock 產品截圖
- ❌ Inter / Roboto 作為主字型
- ❌ 多 accent 同時出現
- ❌ 鮮豔紅綠燈 status palette
- ❌ UI 詞彙翻成奇幻魔法用語（Spells / Summon / Grimoire）
- ❌ AI 生成的場景 / 人物照片
- ❌ 梅林 cosplay 其他角色形象（Gandalf / 哈利波特 / Kiki）

## 版本與貢獻

- 當前版本：**v0.1.0**（初始 release）
- 版本政策見 `DESIGN.md §17` 跟 `CHANGELOG.md`
- 任何 hex / breaking 改動都先寫進 `DESIGN.md §16 Decisions Log` 留 paper trail
- 各子專案 pin 特定版本：`git tag v0.1.0`

## 子專案位置

LazzyMerlin 的實際產品專案各自獨立 repo（散落在 `~/Projects/` 下不同資料夾）。本 repo **只存放品牌層的共用資產**，不包含任何具體產品實作。

## License

LazzyMerlin DS 採 **dual licensing**，分清楚「能參考的」跟「不能挪用的」：

### 開放參考（Spec / Code · CC BY 4.0 精神）
以下內容歡迎參考、學習、改作 —— 只要署名（attribution）：
- `DESIGN.md` 設計規範文字
- `tokens/` 結構化 design tokens（W3C 格式 JSON）
- `preview/` 元件視覺實作 HTML / CSS
- `docs/` 落地 checklist 跟操作流程

如果你的專案套了 LazzyMerlin DS 的某些 pattern，credit 一下「Inspired by [LazzyMerlin DS](https://github.com/bbfcwhy/LazzyMerlinDS)」即可。

### 保留所有權（Brand Identity · All Rights Reserved）
以下屬於品牌資產、**不可商用 / 不可挪用 / 不可二次創作**：
- `assets/` 內所有 logo（梅林 + 雙貓 + LazzyMerlin wordmark）
- 「LazzyMerlin」/「慵懶梅林實驗室」品牌名稱
- 梅林（女巫）/ 雙貓 character 設計（§9 Character 系統）
- 邊緣狀態文案的具體 wording（§10.3）—— pattern 可參考、原文不可照抄

如果你想用品牌名 / logo / character 做任何衍生（合作、引用、致敬），請聯繫威爾（bbfcwhy@gmail.com）。

### 簡單版規則
**Spec / code = 開放參考有 attribution 即可 ｜ Brand identity = 保留**

寫 LazzyMerlin DS 的目的是把 brand 規範開放給未來合作者 / 跨專案落地 / 給 AI 工具當設計 reference。這跟「保護 brand identity」可以並存。

---

`✦ LAZZYMERLIN · EST. MMXXVI`
