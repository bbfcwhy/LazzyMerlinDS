# LazzyMerlin Design Tokens

結構化 design tokens，跨平台落地的 single source of truth。  
所有 hex / size / shadow / motion 數值的權威來源。文字描述見 [`../DESIGN.md`](../DESIGN.md)。

## 格式

W3C Design Tokens 草案格式（`$value` / `$type` / `$description`）。相容工具：

- **Figma Tokens Studio plugin** — 直接 sync 整個 `tokens/` 目錄
- **Style Dictionary**（Amazon / Adobe）— 自動產出 CSS / iOS / Android 等多平台格式
- **手動讀取** — 一般 JSON parser 都能用，token reference 用 `{path.to.token}` 語法

## 檔案結構

```
tokens/
├── color.json       Wood palette 8 色 + Earth tone status extension + light/dark mode role tokens
├── typography.json  字體 family / weight / scale（10 階 type scale）
├── dimension.json   spacing / radius / z-index / breakpoint
├── shadow.json      Soft Neumorphic + Tactile-Raised box-shadow（按元件大小：button / card / chip / avatar / badge）
└── motion.json      duration / easing tokens
```

## Token 層級

Tokens 分三層，從原始值往語意層 reference：

1. **基礎層**（`color.wood.*` / `color.earth.*` / `spacing.lg`）— 純 hex / px 值
2. **語意層**（`color.light.primary` / `color.light.success`）— mode-specific role token，用 `{path}` reference 基礎層
3. **元件層** — 各專案落地時自己建（不放在這個 repo）

要加新色或調整 shadow 數值，**只動基礎層**（wood / earth）。語意層自動跟著 swap。

## 跨平台用法

### Web / CSS

```bash
npx style-dictionary build
```

預設會產出 `dist/css/variables.css`：

```css
:root {
  --color-wood-parchment: #F5EFE4;
  --color-light-primary: var(--color-wood-primary);
  /* ... */
}
```

### iOS / SwiftUI

```bash
npx style-dictionary build --platform ios
```

產出 `dist/ios/LazzyMerlinColors.swift`：

```swift
public extension Color {
    static let parchment = Color(hex: "#F5EFE4")
    static let primary = Color("primary") // mode-aware
}
```

### Notion / 其他

Notion 沒自訂 CSS，落地時手動對應 §7.4：用 Notion 原生 blue / brown / gray 模擬 brand tokens。

## 修改規則

1. **新色或改 hex** → 動 `color.json` 的 `wood` 或 `earth` group
2. **加 spacing 階** → 動 `dimension.json` 的 `spacing` group
3. **改完 push 一個 commit** + **bump 版本**（見 [`../CHANGELOG.md`](../CHANGELOG.md)）
4. **任何 hex 改動 = breaking change**（影響跨專案視覺），bump major version

## 關係到 DESIGN.md

| Token 群 | DESIGN.md 章節 |
|---|---|
| `color.wood` | §2.1 Brand Tokens |
| `color.earth` | §2.2.2 Status Extension |
| `color.light/dark` | §2.2.1 + §2.4 Theme Switch |
| `typography.*` | §3 字體系統 |
| `spacing` / `radius` | §4.1 / §4.2 |
| `z-index` | §4.4 |
| `shadow.soft.*` | §5.6 Soft Inset |
| `shadow.tactile-raised.*` | §5.4 / §15.5.1 / §15.5.2 |
| `motion.*` | §5.1 |
