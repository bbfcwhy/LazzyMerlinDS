# LazzyMerlin DS · Landing Checklist

> 把 LazzyMerlin Design System 套用到子專案（個人網站 / web app / iOS / macOS）的 onboarding 文件 + step-by-step checklist。

跨子專案重用同一份。第一個落地子專案是個人網站（lazzywill），未來其他子專案也走這份流程。  
這份 checklist 同時是 §17.6 v1.0 條件第 3 項「跨平台落地 QA Checklist」的初步版本。

---

## 0 · 給新 session Claude 的快速 onboard

切到子專案資料夾開新 Claude Code session 後，paste 以下這段給它：

```
我要把 LazzyMerlin Design System v0.1.1 套用到這個子專案。

LazzyMerlin DS 是我的跨平台品牌核心 design system，住在獨立 repo：
https://github.com/bbfcwhy/LazzyMerlinDS

請依照 docs/landing-checklist.md 的順序執行（fetch 該檔案讀完）：
https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/main/docs/landing-checklist.md

關鍵原則：
- 你的工作是「套用 DS 到這個子專案」，不是「修改 DS 規範」
- 發現規範有 gap → 在這個專案內先 workaround，同時 commit 一個 issue / note 給 LazzyMerlin DS repo
- 不引入新 hex / 新字體 / 新 elevation pattern —— 全部從 LazzyMerlin DS tokens 取
- Tone：冷面笑匠 + 水瓶座機鋒，外硬內軟、誠實、不 hype
- 反面教材 9 條全部不踩（見 checklist Phase 反面教材清單）

從 Phase 0 開始：先告訴我這個子專案的技術棧（Next.js / Astro / SvelteKit / 純 HTML / 其他）跟既有狀態（從零新建 / 重構既有 / 加新頁），我們再對應走後續 phase。
```

---

## Phase 0 · 確認子專案環境

新 session Claude 應該先問你三件事：

1. **技術棧**：Next.js / Astro / SvelteKit / Vite + React / 純 HTML / Cloudflare Workers / 其他？
2. **既有狀態**：從零新建 / 重構既有頁 / 加新頁？
3. **Deploy target**：Vercel / Cloudflare Workers / Netlify / GitHub Pages / 其他？

然後評估：
- 既有 design 跟 LazzyMerlin DS 衝突嗎？例如既有用 Inter 字體（DS 不允許），需要全替換
- 既有 token system？例如 Tailwind config 用既有色階，需要遷移到 LazzyMerlin tokens

---

## Phase 1 · 字體載入

按子專案技術棧選對應策略 —— **Next.js 走 `next/font/google` 不要走 CDN `<link>`**。

### Next.js 13+ App Router · 推薦

```tsx
// app/layout.tsx 或 app/[locale]/layout.tsx
import { Geist, Geist_Mono, Noto_Sans_TC } from 'next/font/google';
import localFont from 'next/font/local';

const geist = Geist({
  subsets: ['latin'],
  weight: ['300', '400', '500', '600', '700'],
  variable: '--font-geist',
  display: 'swap',
});

const geistMono = Geist_Mono({
  subsets: ['latin'],
  weight: ['400', '500'],
  variable: '--font-geist-mono',
  display: 'swap',
});

const notoSansTC = Noto_Sans_TC({
  weight: ['300', '400', '500', '600'],
  variable: '--font-noto-sans-tc',
  display: 'swap',
});

// LXGW WenKai TC 不在 Google Fonts ESM API，要走 next/font/local
// 自己下載 OTF/WOFF2 放專案 `public/fonts/` 或 `app/fonts/`（路徑見 §3.5 下載連結）
const lxgwWenKai = localFont({
  src: '../public/fonts/LXGWWenKaiTC-Regular.woff2',
  variable: '--font-lxgw',
  display: 'swap',
});

export default function Layout({ children }) {
  return (
    <html lang="zh-Hant" className={`${geist.variable} ${geistMono.variable} ${notoSansTC.variable} ${lxgwWenKai.variable}`}>
      <body>{children}</body>
    </html>
  );
}
```

CSS 用 variable：

```css
body { font-family: var(--font-geist), var(--font-noto-sans-tc), sans-serif; }
.display { font-family: var(--font-lxgw), serif; }
.mono { font-family: var(--font-geist-mono), monospace; }
```

**為什麼不走 CDN `<link>`**（Next.js 場景特別重要）：
- `next/font/google` 自動 SSR preload — 首次 render 時字體已 ready，減少 FOUT/FOIT
- Build 時自動下載 + self-host — 不依賴 `fonts.googleapis.com` 線上連線
- 自動 subset — 只載入用到的字符（中文 subset 從 ~10MB 降到 ~200KB）
- 自動 `size-adjust` 防 layout shift
- LXGW WenKai TC 走 `next/font/local`，把 OTF/WOFF2 下載到專案內，跟著 deploy 一起 ship（避免 Google Fonts 該字體相容性 / 速度問題）

→ 此規範由 lazzywill 個人網站 2026-04-28 落地實測得到，回流補進此 phase。

### 純 HTML / Vite + React / Astro · 用 Google Fonts CDN

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist:wght@300;400;500;600;700&family=Geist+Mono:wght@400;500&family=Noto+Sans+TC:wght@300;400;500;600&family=LXGW+WenKai+TC:wght@400&display=swap" rel="stylesheet">
```

LXGW WenKai TC 在 Google Fonts 上有，但檔案較大（繁中 subset 仍 ~5MB），考慮 subset 或自行 host。Astro 推薦走 `@fontsource/*` package（`@fontsource/geist` / `@fontsource/noto-sans-tc`，build 時自動 self-host）。

### iOS / macOS bundle

見 DS DESIGN.md §3 + §7.2 / §7.3，bundle OTF 進 app target。LXGW WenKai TC 檔案 ~10MB，iOS app 建議做繁體常用字 subset（用 `pyftsubset`）。本 checklist 暫不展開細節。

### Reduced motion / 系統字體 fallback

```css
body { font-family: 'Geist', 'Noto Sans TC', sans-serif; }
.display { font-family: 'LXGW WenKai TC', serif; }
```

任一 strategy（next/font / CDN / fontsource）載入後 CSS 用 family stack 即可，fallback 系統字體保證 ungraceful degradation。

---

## Phase 2 · Tokens 落地（三選一）

### A · Clone tokens 進子專案（推薦）

```bash
mkdir -p src/styles/tokens
curl -o src/styles/tokens/color.json https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/color.json
curl -o src/styles/tokens/typography.json https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/typography.json
curl -o src/styles/tokens/dimension.json https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/dimension.json
curl -o src/styles/tokens/shadow.json https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/shadow.json
curl -o src/styles/tokens/motion.json https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/motion.json
```

子專案 README 寫一行：「LazzyMerlin DS pinned: v0.1.1（[CHANGELOG](https://github.com/bbfcwhy/LazzyMerlinDS/blob/main/CHANGELOG.md)）」。

### B · Style Dictionary 自動產 CSS variables

```bash
npx style-dictionary build
```

產出 `dist/css/variables.css`，import 進主 stylesheet。

### C · 手動 copy（簡單 single page 用）

直接抄 `preview/components-preview.html` 的 `:root` 跟 `[data-theme="dark"]` 兩個 block 進主 CSS。最快但無法跟著 DS 升版自動同步。

---

## Phase 3 · CSS Variables 基礎配置

子專案 root stylesheet（`globals.css` / `app.css` / 等）開頭：

```css
:root {
  /* === Wood palette 8 色 === */
  --bg: #F5EFE4;
  --bg-raised: #F5EFE4;
  --bg-muted: #DECCA7;
  --ink: #0F1C26;
  --ink-muted: #4E3029;
  --primary-deep: #334D5C;
  --primary: #46647C;
  --primary-soft: #5E7A8D;
  --stone: #967459;

  /* === Earth tone Status Extension === */
  --earth-red:   #9E5949;
  --earth-green: #6A7A60;
  --earth-ochre: #8E6E37;

  /* === Semantic alias === */
  --info: var(--primary);
  --success: var(--earth-green);
  --warning: var(--earth-ochre);
  --error: var(--earth-red);
  --destructive: var(--earth-red);

  /* === Hairline / Border === */
  --hairline: rgba(150, 116, 89, 0.30);
  --border: rgba(15, 28, 38, 0.10);

  /* === Tactile noise overlay === */
  --noise-bg:
    url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='200' height='200'%3E%3Cfilter id='nz1'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='2.2' numOctaves='4' seed='5'/%3E%3CfeColorMatrix values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.8 -0.3'/%3E%3C/filter%3E%3Crect width='200' height='200' filter='url(%23nz1)'/%3E%3C/svg%3E"),
    url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='320' height='320'%3E%3Cfilter id='nz2'%3E%3CfeTurbulence type='turbulence' baseFrequency='1.4 0.5' numOctaves='2' seed='9'/%3E%3CfeColorMatrix values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.4 -0.2'/%3E%3C/filter%3E%3Crect width='320' height='320' filter='url(%23nz2)'/%3E%3C/svg%3E");
  --noise-bg-size: 90px 90px, 220px 220px;

  /* === Radius === */
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-2xl: 20px;
  --radius-full: 9999px;
}

[data-theme="dark"] {
  --bg: #0F1C26;
  --bg-raised: #0F1C26;
  --bg-muted: #4E3029;
  --ink: #F5EFE4;
  --ink-muted: #DECCA7;
  --primary-deep: #334D5C;
  --primary: #5E7A8D;        /* 互換 */
  --primary-soft: #46647C;   /* 互換 */
  --stone: #967459;

  --earth-red:   #C58775;
  --earth-green: #A8B898;
  --earth-ochre: #D4AB6E;

  --hairline: rgba(94, 122, 141, 0.30);
  --border: rgba(245, 239, 228, 0.08);
}

body {
  background: var(--bg);
  color: var(--ink);
  font-family: 'Geist', 'Noto Sans TC', sans-serif;
  line-height: 1.6;
  transition: background 400ms ease, color 400ms ease;
}
```

---

## Phase 4 · Tactile Material 三層 Register

新元件落地前先想：這個元件屬於哪一層？

| Material | 用於 | CSS 抓哪 |
|---|---|---|
| **Tactile-Raised** | 主 CTA / Editorial card / Hero tile / chip / avatar / badge | 從 `preview/components-preview.html` 找 `.btn--primary` / `.card--editorial` / `.chip` / `.avatar` |
| **Hybrid** | Secondary button / Plain card / list view | 從 `.btn--secondary` / `.card--plain` |
| **Soft Inset** | Input / Textarea / Switch / Slider | 從 `.input` / `.switch` / `.slider` |

**配方四件組**（Tactile-Raised 完整版）：
1. 對角微暗化 `linear-gradient 135deg, white 0.04 → 0 → black 0.22`
2. 雙層 inset rim（頂緣 highlight + 底緣 shadow + 細邊）
3. 多層 drop shadow（按元件大小縮減）
4. Noise overlay（`::after + z-index: -1 + isolation: isolate`，**不用 background-blend-mode**）

---

## Phase 5 · 元件實作（MVP 集合先做）

最低可用集合（§15.10 規定）—— 建議按這順序落地：

1. **Button**（5 variants × 3 sizes）—— `.btn--primary` / `.btn--secondary` / `.btn--ghost` / `.btn--destructive` / `.btn--deep`
2. **Input / Textarea / Select**（Soft Inset）
3. **Card**（Editorial / Plain）
4. **Chip / Tag / Badge**
5. **Toast**（從右下浮出）
6. **Modal**（backdrop + Tactile dialog）

每個元件直接 copy `preview/components-preview.html` 的 CSS pattern + HTML 結構。

---

## Phase 6 · Theme Switch

Init `<head>` inline 執行（避免 FOUC）：

```html
<script>
  const stored = localStorage.getItem('lm-theme');
  const sysDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  document.documentElement.dataset.theme = stored || (sysDark ? 'dark' : 'light');
</script>
```

Toggle button（fixed 右上）配合 §2.4 規範。

---

## Phase 7 · Ambient Layer（Hero / Landing 專用）

只有 hero / landing 頁加，dashboard / app 內頁**不加**：

- **A-1 Reading Progress Bar** —— scroll 同步 `transform: scaleX(pct)`
- **A-2 Ambient Orbs** —— 3 顆 blur 漸層 + drift 24s 循環
- **A-3 Grain Overlay** —— 全屏細緻雜訊 opacity 0.035

CSS pattern 全部從 `preview/components-preview.html` Phase 4 copy。**reduced-motion 必須 respect**：所有 drift / spin / scaleX 包進 `@media (prefers-reduced-motion: reduce)` 降階。

---

## Phase 8 · 邊緣狀態文案（套 §10.3 冷面笑匠 tone）

- **404**：「頁面沒了。可能我當初就沒做出來。」+ `回首頁 →`
- **Error**：「壞了。可能是我沒做對 — 再試試看 ↻」
- **Empty**：「這裡還沒寫東西。懶人通常這樣。」
- **Empty search**：「找不到。換個字試試？」
- **Loading > 8 秒**：「比預期久一點，再等一下 ✦」
- **Success toast**：「好了 ✦」
- **Footer 簽名**：「Shine, lazily and steadily. ✦」

文案直接 copy DESIGN.md §10.3 表格，不要自己重寫。

---

## 反面教材清單（給新 session Claude 強制 prime）

任何時刻**不要**寫這些：

- ❌ 紫粉漸層 / SaaS gradient CTA
- ❌ 全 full 圓角（AI bubbly slop）
- ❌ Inter / Roboto 作主字體
- ❌ 鮮豔紅綠燈 status palette（紅綠黃 → 用 earth tone）
- ❌ Tactile noise 用 `background-blend-mode: overlay`（會染深底色 + 染黑文字）
- ❌ Loading state 用 `color: color-mix(currentColor 75%, transparent)`（CSS spec 會從 parent inherited 取，造成黑字）
- ❌ chip--primary + chip--soft 兩藍同框（三層藍視覺擠壓）
- ❌ HTML inline `style="background: var(--xxx)"` shorthand（會 reset 掉 noise overlay）
- ❌ `<button>` 沒 reset `border / appearance`（thumb / 內容會被 user-agent 樣式推歪）
- ❌ UI 詞彙翻奇幻魔法用語（Spells / Summon / Grimoire）
- ❌ 梅林 cosplay 其他角色（Gandalf / 哈利波特 / Kiki）
- ❌ AI 生成的人物 / 場景照片
- ❌ 純白 #FFF / 純黑 #000 底

完整清單見 DESIGN.md §12 反面教材。

---

## 跟 LazzyMerlin DS 互動規則

### 發現規範 gap

落地過程一定會發現「規範沒寫到」「規範跟現實不符」的細節。處理流程：

1. **先在子專案內 workaround** —— 子專案要能 work 是首要
2. **記錄 gap** —— 在子專案留 `TODO: report to LazzyMerlin DS · <一句描述>`
3. **回流到 DS repo**：
   - 開 GitHub issue 或直接送 PR 到 https://github.com/bbfcwhy/LazzyMerlinDS
   - 或者切回 LazzyMerlin DS session 補規範
   - DS 升版時記得寫進 CHANGELOG `[Unreleased]`

### 跟著 DS 升版

定期（每月 / 每季）跑同步 check：

1. 看 https://github.com/bbfcwhy/LazzyMerlinDS/blob/main/CHANGELOG.md
2. 從子專案 pinned 版本之後的所有 entry
3. **沒 breaking** → 直接 bump 版本（重新 curl tokens）
4. **有 breaking**（major version 升）→ 評估 migration cost、決定何時跟上

---

## 重要 GitHub URLs

- **Repo**：https://github.com/bbfcwhy/LazzyMerlinDS
- **Spec v0.1.1**：https://github.com/bbfcwhy/LazzyMerlinDS/blob/v0.1.1/DESIGN.md
- **Components Preview v0.1.1**：https://github.com/bbfcwhy/LazzyMerlinDS/blob/v0.1.1/preview/components-preview.html
- **Tokens v0.1.1**：https://github.com/bbfcwhy/LazzyMerlinDS/tree/v0.1.1/tokens
- **CHANGELOG**：https://github.com/bbfcwhy/LazzyMerlinDS/blob/main/CHANGELOG.md

### Pin 到 v0.1.1 的 raw URLs

```
https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/color.json
https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/typography.json
https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/dimension.json
https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/shadow.json
https://raw.githubusercontent.com/bbfcwhy/LazzyMerlinDS/v0.1.1/tokens/motion.json
```

### v0.1.1 之後到 main HEAD 的 patches（可選 cherry-pick）

- Pagination active 改 Pressed（`commit ee69dcc`）—— 已併進 main，下個 v0.1.2 會包

---

## 落地完成 checklist（驗收用）

子專案 deploy 前最後 review：

- [ ] 字體有正確載入（檢查 Network tab `fonts.googleapis.com` 200）
- [ ] Light + Dark mode 都跑過一遍
- [ ] Reduced motion 模式 ambient orbs / spinner / drift 都停下
- [ ] Focus ring（鍵盤 Tab 所有互動元件）都看得見
- [ ] 對比度 AA（小文字 4.5:1、大文字 3:1）
- [ ] 沒引入新 hex / 新字體 / 新元件 anatomy
- [ ] 反面教材 9 條全部沒踩
- [ ] 邊緣狀態文案（404 / Error / Empty）有用 §10.3 而不是自己重寫
- [ ] Footer 有 `Shine, lazily and steadily. ✦` 簽名

---

`✦ LAZZYMERLIN · EST. MMXXVI`
