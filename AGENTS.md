# LazzyMerlin 品牌核心專案

這是威爾的懶人主義（LazzyMerlin）個人品牌的核心資產目錄，存放跨專案共用的品牌規範、設計系統、素材。

## Design System

**做任何視覺 / UI 決策前先讀 `DESIGN.md`。**

`DESIGN.md` 是所有專案的設計源頭：
- 色彩 tokens（5 色，light/dark 兩套）
- 字體系統（Cormorant Garamond + 霞鶩文楷 + Geist + Noto Sans TC）
- 間距 / 形狀 / 動態 tokens
- 6 個平台的套用指南（Web、iOS、macOS、Notion、Chrome ext、IG）
- 反面教材清單

專案落地時：
- **Web 專案**（稷下、聽了以後等）：完整套用 DESIGN.md 所有 tokens
- **iOS / macOS 專案**（Sortless 等）：依 DESIGN.md §7.2、§7.3 指南，遵循 HIG + 品牌色
- **Notion 模板**：依 §7.4 用 Notion 原生色映射 brand tokens
- **Chrome ext**：共用 Web tokens
- **IG 素材**：依 §7.6 版型
- **Game**：Opt-out，但 splash / About 帶入 `✦ LazzyMerlin` 簽名

## 修改 DESIGN.md

- 任何對 brand tokens 的變更（色、字、間距）都要更新 §10 Decisions Log，註明 Rationale
- 各平台指南（§7）可因實作經驗迭代
- 大幅修改（例：更換主色、更換字體家族）需要在更新後重新跑 `/design-consultation` 檢查跨平台一致性

## 相關資產

- `~/.gstack/projects/LazzyMerlin/designs/design-system-20260422/`：design system 建立時的 mockup + preview 原檔
- `v3/preview-v4.html`：可點擊的品牌預覽頁（含 light/dark toggle）

## 其他 LazzyMerlin 子專案位置

實際的產品專案散落在 `~/Projects/` 下其他資料夾（稷下學院、聽了以後、Sortless 等）。本目錄只存放「品牌層」的共用資產。
