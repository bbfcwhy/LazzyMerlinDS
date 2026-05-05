# LazzyMerlin Design System

> *Shine, lazily and steadily.* ✦

**慵懶梅林實驗室 · LazzyMerlin Lab** 跨平台品牌核心設計系統。
任何專案做視覺決策前都先讀這份檔案。有衝突時，以此為準。

---

## 一、品牌核心

### 1.1 品牌是什麼

**LazzyMerlin 是一個「二人（+ 雙貓）實驗室」，不是單人品牌。**

```
慵懶梅林實驗室 · LazzyMerlin Lab
├── 梅林（老婆）    — 出一張嘴的魔法師、創意層、決定要做什麼
├── 威爾（他）      — 用 AI 實現魔法、執行層、決定怎麼做
├── 貓貓們          — 全虎斑 + 白底虎斑、陪伴、日常感
└── AI 工具         — 法術本身、把想法壓縮成可執行的產品
```

- **品牌名起源**：`LazzyMerlin` 結合兩件事：
  - `Merlin` = 老婆名字的諧音
  - `Lazzy` = `Lazy` 的故意拼法，強調雙 Z 的懶
- **核心敘事**：「梅林出主意，威爾用 AI 把她的魔法實現出來。」
- **對使用者的承諾**：幫你少做、做對、做久
- **反對的立場**：反效率崇拜（不 worship `fast`、`intense`、`speed`）。反 SaaS 冷工具感。反過度設計。反 LARP（live action role play，不 cosplay 奇幻）。

### 1.2 氣質關鍵字
| 要 | 不要 |
|---|---|
| 溫暖、親和、耐看 | 冰冷、工具化、科技感 |
| 克制、手工、有層次 | 浮誇、華麗、滿版 |
| 一點神秘、一點魔法 | cosplay、奇幻漫畫、紫粉霓虹 |
| 冷面笑匠、機鋒、有點搞怪 | 用力過猛、「我很努力」的表演感 |
| 認真做工但輕鬆示人 | 正經的企業官腔 |

### 1.3 Tone of Voice

**外硬內軟的冷面笑匠**（水瓶座氣質）：

- 口語、自然，像朋友對話
- 可以機鋒、自嘲、反諷
- 外表冷靜，偶爾流露溫柔
- 誠實，不 hype、不 PR
- 中文排版遵循**中英混排一個半形空格**原則（例：`我有 3 台 iPhone`）

**範例對比：**

| 不要這樣寫 | 要這樣寫 |
|---|---|
| 我們用心打造每個細節 | 梅林負責出一張嘴，威爾負責把它變出來 |
| 致力於打造美好體驗 | 反正她又不會自己動手 |
| 讓 AI 為您實現夢想 | AI 很聽話，但要知道該叫牠做什麼 |
| 感謝您選擇 LazzyMerlin | 你來了。貓也很高興 |

**Tone 的界限：** 冷面笑匠 ≠ 酸民。機鋒來自自嘲與日常觀察，**不嘲諷使用者**。

### 1.4 魔法感承載原則（重要）

**魔法感不靠顏色承載，靠字體與裝飾細節。**

顏色系統是克制的冷暖藍系（對齊 shadcn oklab 主題）。魔法氛圍來自：
1. **手寫楷體 display**（霞鶩文楷 TC） — 像手抄本、羊皮紙卷
2. **Unicode 裝飾字**（✦ ◈ ❦ ☾）作為 section separator
3. **雙語混排**（中文楷體 + 英文）展現跨文化質感
4. **Small-caps label + 羅馬數字**（MMXXVI）— 古卷感
5. **結尾致敬句**「Shine, lazily and steadily.」（致敬 Paco Coursey "Shine, constantly and steadily"）

不加金色、不加紫色、不加神秘漸層。顏色維持冷藍系，讓字體與排版去扛魔法氛圍。

---

## 二、色彩系統

### 2.1 核心 4 色（Brand Tokens）

每個 role 都有 Light/Dark 對應值。**Light mode 奶油紙 + 咖啡木質 + 藍調文字；Dark mode 深藍夜 + 奶油字**，palette 8 色（Coolors · `334D5C / 46647C / 5E7A8D / 0F1C26 / F5EFE4 / DECCA7 / 967459 / 4E3029`）：

| Role | Light | Dark | 用途 |
|---|---|---|---|
| **Surface** | `#F5EFE4` Parchment | `#0F1C26` Midnight Petrol | 頁面底色 |
| **Ink** | `#0F1C26` Midnight Petrol | `#F5EFE4` Parchment | 主文字 |
| **Primary Deep** | `#334D5C` Abyss Petrol | `#334D5C`（共用、decoration 限定）| 品牌強調、hero headline、logo 底、深色 mood fill |
| **Primary** | `#46647C` Deep Petrol | `#5E7A8D` Mid Petrol | 主 CTA、連結、高對比 accent |
| **Primary Soft** | `#5E7A8D` Mid Petrol | `#46647C` Deep Petrol | 次要 accent、hover 底、info bg、selected state、secondary CTA |
| **Stone** | `#967459` Coffee | `#967459` Coffee（共用） | 次文字、muted elements、warm neutral |

**品牌藍錨：** Midnight Petrol `#0F1C26` 一色扛兩個模式的角色對調（Light Ink ↔ Dark Surface），光這一色就讓 light 的文字跟 dark 的底都站在 Petrol 家族 —— 整個 DS 都以藍色為軸，Primary 系列深入到文字層。

**Primary 跟 Primary Soft 兩模式互換角色。** Primary Deep `#334D5C` 在 dark mode 對比不足 AA（≈2.9:1 on `#0F1C26`），不要當文字，只做 mood 填色 / 裝飾 / illustration 陰影。

### 2.2 延伸色（Semantic）

**嚴格 8 色原則：semantic 角色一律 alias 到 8 色 palette 內，不引入新 hex。**

#### 2.2.1 Surface / Border / Hairline（中性）

| 語意 | Light | Dark |
|---|---|---|
| Surface Raised（卡片、彈窗） | 同 Surface（陰影區分）| 同 Surface（陰影區分）|
| Surface Muted（區塊、表單） | `#DECCA7` Tan | `#4E3029` Espresso |
| Ink Muted（次文字） | `#4E3029` Espresso | `#DECCA7` Tan |
| Border | `rgba(15, 28, 38, 0.10)` | `rgba(245, 239, 228, 0.08)` |
| Hairline（裝飾細線） | `rgba(150, 116, 89, 0.30)` | `rgba(94, 122, 141, 0.30)` |
| **Ink on Brand**（彩色底文字） | `#F5EFE4` Parchment | `#F5EFE4` Parchment（**不翻轉**） |

##### 為什麼 `--ink-on-brand` 不跟 mode 翻轉

彩色底（brand 藍三層 / earth tone 三色）需要的文字反差是「**永遠米色**」，不是「跟著 page bg 翻轉」。理由：彩色 fill + 米色字 = 跨平台跨 mode 都過 WCAG AA Large（≥3:1）；如果用 `--bg` 走 mode 翻轉，dark mode 時 Mid Petrol `#5E7A8D` 底配 Midnight Petrol `#0F1C26` 字 = 對比 3.4:1（剛過 AA Large 但近邊緣），Deep Petrol `#334D5C` 底配 Midnight Petrol 字 = 1.7:1（**完全不過 AA**）。

實作：`--ink-on-brand: #F5EFE4` 在 `:root` 跟 `[data-theme="dark"]` 都同值。所有彩色底元件（button primary / deep / destructive、chip 彩色 variant、avatar、badge、toast、modal action button 等）的 `color` 屬性一律 `var(--ink-on-brand)` 而不是 `var(--bg)`。詳見 §15.5.4。

##### Surface tier 規範（Card / Container 階層）

當 surface 上需要疊 card / container 視覺分層時（例如 dashboard 卡片浮在 page surface 上、popover 浮在 card 上），用 **`surface-1` / `surface-2` 兩階 token**：

| Token | 用途 | Light luminance delta vs `--bg` | Dark luminance delta vs `--bg` |
|---|---|---|---|
| `--surface-1` | 主 card / container（一階浮起） | **+1.5%**（極微暗化或同色靠 Tactile shadow 區分） | **+5%**（純色微提亮） |
| `--surface-2` | Nested card / popover / dropdown（二階浮起） | **+3%**（或同色靠雙層 shadow） | **+10%** |

**Light mode 偏好用 Tactile shadow 區分階層**（同色底 + 雙層 drop shadow），純色 luminance delta 是 fallback；**Dark mode 偏好純色提亮**（dark mode 下 shadow 視覺 affordance 弱、需要 surface 本身就有亮度差）。

iOS 平台對應規範見 §7.2 「Card surface tier」。

#### 2.2.2 Status Extension（Earth Tone 三色擴充）

Brand identity 仍是 8 色 wood palette；status 訊號用 **3 色 Earth Tone Extension** 表達。Extension 跟 wood palette 同調（同 saturation 量級、同 light value），不是鮮豔紅綠黃，而是大地色系：

| Token | Light | Dark | 對 surface 對比度 |
|---|---|---|---|
| **Earth Red** Terracotta | `#9E5949` | `#C58775` | Light ~5.3:1 / Dark ~6.5:1 ✓ AA |
| **Earth Green** Sage / Moss | `#6A7A60` | `#A8B898` | Light ~5.0:1 / Dark ~8.0:1 ✓ AA |
| **Earth Ochre** Burnt Ochre | `#8E6E37` | `#D4AB6E` | Light ~5.5:1 / Dark ~7.5:1 ✓ AA |

**為什麼是大地色不是鮮色：**
- 跟 wood palette 同調 —— 跟 Stone `#967459` 同 saturation 量級，同個畫面不會跳出來
- 跟「冷面笑匠 / 反美式紅綠燈情緒對比」tone 一致 —— 「壞了」用陶土紅比刺眼正紅更耐看
- 仍可單眼識別 success / warning / error —— 色相確實不同（綠 / 黃 / 紅），但飽和度壓低

**定位：Status-only Extension**
- ❌ 不擴充進 Brand Core 8 色
- ❌ 不當 hero / CTA fill 主色
- ❌ 不當 illustration accent
- ✅ 只用於 status 訊號：alert / toast / form validation / stat trend / destructive button / badge

#### 2.2.3 Semantic 角色映射

| 語意 | 對應 token | Icon |
|---|---|---|
| **Info** | `--primary` 中藍 | `info` |
| **Success** | `--earth-green` Sage | `check-circle` |
| **Warning** | `--earth-ochre` Burnt Ochre | `alert-triangle` |
| **Error** | `--earth-red` Terracotta | `x-circle` 或 `alert-circle` |
| **Destructive**（按鈕語意） | `--earth-red` Terracotta | — |

```css
:root {
  /* Earth tone Status Extension */
  --earth-red:   #9E5949;
  --earth-green: #6A7A60;
  --earth-ochre: #8E6E37;

  /* Semantic alias */
  --info: var(--primary);
  --success: var(--earth-green);
  --warning: var(--earth-ochre);
  --error: var(--earth-red);
  --destructive: var(--earth-red);
}
[data-theme="dark"] {
  --earth-red:   #C58775;
  --earth-green: #A8B898;
  --earth-ochre: #D4AB6E;
  /* Semantic alias 不重寫 — var() 動態 resolve 自動跟著 earth-* 切 */
}
```

#### 2.2.4 視覺 severity 補強維度

色相之外，元件層仍用其他維度強化 severity 訊號（§14.4：不能單靠顏色）：

| 維度 | success / info | warning / error |
|---|---|---|
| **Icon** | `check-circle` / `info` | `alert-triangle` / `x-circle` |
| **Border 粗細**（Alert） | `border-left: 4px` | `border-left: 4px`；Error 可加粗到 6px |
| **背景強度**（Alert） | `color-mix(--success 8%, --bg)` | `color-mix(--error 10%, --bg)`（更可見） |
| **文案 tone** | 平實（「已儲存」） | 冷面笑匠（「壞了。」） |

#### 2.2.5 跟 §2.1 「不做紅綠金」決策的關係

§2.1 Decisions Log 2026-04-24 寫過「不做紅色系、不做金色、不做綠色」—— **那條決策針對的是 Brand Accent**（hero / CTA / illustration）。Status Extension 是另一層級，2026-04-25 經使用者明確要求「紅綠加回，但偏大地色系」加入。

兩條決策並行：
- **Brand Core**：仍嚴格 8 色 wood palette，不加金 / 不加紫 / 不加亮紅綠
- **Status Extension**：3 色 earth tone，限定 status 訊號用途

詳見 §16 Decisions Log（2026-04-25 兩筆）。

### 2.3 使用規則
- **禁止**：純白 `#FFF`、純黑 `#000`、藍紫漸層、任何 SaaS gradient CTA、金色作為主色
- **Primary 是唯一 brand accent**：連結、按鈕、重點強調。不同時使用多個 accent 爭奪視覺。
- **Primary Soft 只做 tint，不做內容**：info 區塊底、selected state、hover 底色、illustration 亮調。不拿來當文字色或 CTA 填色（不夠對比）。
- **色彩層級**：一頁至多 1 個 Primary 強調 + 1-2 處 Stone muted。不加第三種色調。
- **對比度**：Ink on Surface、Primary on Surface 都需通過 WCAG AA（4.5:1）。Stone on Surface ~4.2:1，適用於 ≥14px 次文字。Primary Soft 不做文字。

### 2.4 Theme Switch（主題切換）

LazzyMerlin DS 是 Light/Dark 雙模式。本節規範三件事：**初始判定**、**手動切換**、**過渡動畫**。

#### 2.4.1 初始模式判定（首次載入）

優先序（高到低）：

1. **本地儲存** `localStorage.getItem('lm-theme')` —— 用戶上次選的
2. **系統偏好** `prefers-color-scheme: dark`
3. **預設** light

```js
const stored = localStorage.getItem('lm-theme');
const sysDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
const theme = stored || (sysDark ? 'dark' : 'light');
document.documentElement.dataset.theme = theme;
```

**重要：必須在 `<head>` 內 inline 執行**（在 CSS 載入前），否則會 FOUC（用戶看到一閃 light 才切 dark，超醜）。

#### 2.4.2 Toggle 元件規範

固定右上角，floating 按鈕。Material 規範見 §15.2.1（用 Tactile Base 簡化版）。

- 位置：`position: fixed; top: 20px; right: 24px; z-index: var(--z-sticky);`
- 樣式參考 v5 preview `.theme-toggle`（line 146-181）
- 內容：icon + 文字（`◐ Dark` / `☼ Light`）—— 顯示「**切換到**」的目標，不是當前模式
- 切換動作：
  ```js
  const next = current === 'light' ? 'dark' : 'light';
  document.documentElement.dataset.theme = next;
  localStorage.setItem('lm-theme', next);
  ```

替代方案：放 `Settings → Appearance` 內，提供三選項（Light / Dark / System）。**不**用 OS 自動跟隨而沒給手動選項 —— 用戶有時候想跟系統反著來。

#### 2.4.3 切換過渡動畫

切換瞬間整頁顏色全變會 jarring。LazzyMerlin 用 400ms ease 過渡 background / color：

```css
body {
  transition: background 400ms ease, color 400ms ease;
}
```

但是有兩個陷阱：
- **不要**對 `*` 加 transition —— 太多元件同步動會掉幀
- **不要**對 `box-shadow` 加 transition —— Tactile shadow 切換時會閃爍（shadow 本身就是 hover transition 的主角）

```css
/* ❌ 反面教材 */
* { transition: all 400ms ease; }

/* ✅ 正解：只動 body 的 bg / color，元件靠 CSS variable 自然繼承 */
body { transition: background 400ms ease, color 400ms ease; }
```

#### 2.4.4 各模式的 ambient 元素差異

| 元素 | Light | Dark |
|---|---|---|
| Ambient orbs opacity | 0.08-0.18 | 0.10-0.14（整體降一級避免發光感過頭） |
| Grain overlay | 0.035 / `multiply` | 0.03 / `soft-light` |
| Tactile noise overlay | 0.55-0.6 / `overlay` | 0.75-0.85 / `soft-light` |
| Focus ring 顏色 | `--primary` | `--primary-soft`（提亮） |

完整規格散落 §5.4.2、§14.1，此處只給速查表。

#### 2.4.5 Reduced motion 互動

§14.2 已規範 `prefers-reduced-motion` 下動畫關閉。Theme switch 過渡也算動畫：

```css
@media (prefers-reduced-motion: reduce) {
  body { transition: none; }
}
```

切換瞬變對前庭敏感者反而比平滑過渡更舒服（沒有「漂移」感）。

---

## 三、字體系統（精簡版 3 family）

### 3.1 Font stack

| 角色 | Font family | 用途 |
|---|---|---|
| **Display**（中英通用） | LXGW WenKai TC（霞鶩文楷） | Hero、大標題、文章 title、品牌簽名 |
| **Body**（英文 + 數字） | Geist Sans | 正文、UI 文字 |
| **Body**（中文 fallback） | Noto Sans TC | 正文中文字顯示 |
| **Mono / Labels** | Geist Mono | Small-caps section label、羅馬數字、metadata、程式碼 |

**字體理由：**
- **LXGW WenKai TC**：楷體手繪字體，搭配「懶人魔法師」品牌的手工感。中文顯示字型裡絕大多數人選黑體，這是最強差異化點。其英文字母也有手抄感，可直接用於英文 display。
- **Geist**：Vercel 出品，現代中性，支援 tabular-nums（表格對齊），跨平台 fallback 好。比 Inter 更有品味。
- **Noto Sans TC**：Google 字型，中文系統相容性最佳，與 Geist 視覺重量接近，中英混排不打架。
- **Geist Mono**：專給 label / 羅馬數字 / code，製造編碼感與古卷對比。

**砍掉 Cormorant Garamond**：display 統一用霞鶩文楷已足夠。兩個 serif 同場視覺太滿。

### 3.2 Type Scale

| 角色 | Size | Line | Weight | Font |
|---|---|---|---|---|
| Display XL（Hero） | `clamp(52px, 8vw, 88px)` | 1.15 | 400 | LXGW |
| Display L | `clamp(36px, 5vw, 56px)` | 1.2 | 400 | LXGW |
| H1 | 40px | 1.25 | 500 | LXGW 或 Geist |
| H2 | 28px | 1.3 | 500 | Geist |
| H3 | 22px | 1.4 | 400 | LXGW（文章 title）或 500 Geist |
| H4 | 18px | 1.45 | 500 | Geist |
| Body Large | 17px | 1.75 | 400 | Geist + Noto TC |
| Body | 16px | 1.65 | 400 | Geist + Noto TC |
| Small | 14px | 1.55 | 400 | Geist + Noto TC |
| Label（small-caps） | 11-12px | 1 | 500 | Geist Mono |
| Caption | 10px | 1.3 | 400 | Geist Mono |

### 3.3 字體用法規則
- **Hero 必定中英雙語混排**：中文用楷體 + 英文用楷體（同字型）
  - 例：`嗨，我是 威爾` + `Hey, I am Will. A lazy wizard.`
- **Section label 用 Geist Mono**：letter-spacing `0.2em`，`uppercase`，搭配小字金色 accent（dark mode 是亮藍）
  - 例：`LAZZYMERLIN · EST. MMXXVI`、`精選專案 · FEATURED SPELLS`
- **羅馬數字（MMXXVI = 2026）**：用 Geist Mono 於 footer、label
- **正文保持 Geist Sans + Noto Sans TC**：不用 serif body，確保中文可讀

### 3.4 載入策略（Web）
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist:wght@300;400;500;600;700&family=Geist+Mono:wght@400;500&family=Noto+Sans+TC:wght@300;400;500;600&family=LXGW+WenKai+TC:wght@400&display=swap" rel="stylesheet">
```
- 使用 `display=swap` 避免 FOIT
- LXGW WenKai 檔案較大（繁體子集可減半），視專案是否要 subset

---

## 四、間距 / Layout / 形狀

### 4.1 Spacing Scale（base 4px）
```
2xs  2px
xs   4px
sm   8px
md   12px
lg   16px
xl   24px
2xl  32px
3xl  48px
4xl  64px
5xl  96px
6xl  128px
```
**密度哲學**：Comfortable，不 compact。section 之間慷慨留白。

### 4.2 Border Radius
| Token | 值 | 用途 |
|---|---|---|
| sm | 6px | 小元件（tag pill 另用 full） |
| md | 10px | 輸入框、小卡 |
| lg | 12px | 標準卡片（**預設**） |
| xl | 16px | 大容器、modal |
| full | 9999px | Pill, avatar |

- 當前個人網站用 12px，所有新專案對齊此值。
- 不要全部用 full 圓角做「AI slop bubbly」感。

### 4.3 Layout
- **Max content width**：720-760px（editorial 窄欄）
- **Grid**：行銷頁 editorial 左對齊；dashboard 12-column 規矩對齊
- **斷點**：`sm 640 / md 768 / lg 1024 / xl 1280`
- **Hero 對齊**：一律左對齊。不置中。

### 4.4 Z-index Scale

跨專案會有 progress / modal / toast / tooltip 同時存在的場景，必須有共通的層級規範，避免各專案自己亂寫導致 toast 被 modal 蓋住、tooltip 被 grain overlay 蓋住等 bug。

```css
:root {
  --z-base:     0;    /* 預設 stacking context */
  --z-ambient:  0;    /* orbs 等背景 ambient（fixed inset, z-index: 0） */
  --z-grain:    1;    /* grain overlay 紙質層 */
  --z-content:  2;    /* container 內容層 */
  --z-sticky:   10;   /* sticky header / sidebar */
  --z-overlay:  50;   /* 半透明 overlay backdrop */
  --z-progress: 100;  /* reading progress bar（A-1） */
  --z-modal:    200;  /* dialog / drawer 本體 */
  --z-toast:    300;  /* toast / snackbar */
  --z-tooltip:  400;  /* tooltip / popover（最上層） */
  --z-debug:   9999;  /* dev only：debug overlay */
}
```

規則：
- **不要寫魔術數字**（`z-index: 999`），一律走 token
- 一頁內 modal 同時出現多個時用增量（`var(--z-modal)` 第一個、`calc(var(--z-modal) + 1)` 第二個）
- Tooltip / dropdown menu 永遠最上層（會 attach 到 portal root）
- Grain overlay 必須 `pointer-events: none`，否則會擋下面的點擊

---

## 五、動態與材質

LazzyMerlin 的視覺主軸是**材質感**（tactile materiality），不是純粹的 flat 或 neo-brutalist。所有互動元件都站在三套 shadow register 之一：Tactile（主招牌、厚重浮雕）、Hybrid（輕量線框 + 浮雕）、Soft Inset（input controls 觸感）。

事實依據是 `preview-v5-morandi.html`，本節是它的反向規範。視覺有疑義時以 v5 preview 為準。

### 5.1 Motion Tokens

| Token | 值 |
|---|---|
| Duration - micro | 150ms |
| Duration - short | 220ms |
| Duration - medium | 250ms |
| Duration - long | 400ms |
| Duration - drift | 24000ms（ambient orb 循環） |
| Easing - default | `cubic-bezier(0.4, 0, 0.2, 1)` |
| Easing - magic | `cubic-bezier(0.23, 1, 0.32, 1)` |
| Easing - press | `ease`（短促 80ms 回彈用） |

### 5.2 原則
- **慢半拍**：扣住「懶人」氣質，互動 hover 預設 220-250ms 而非 SaaS 常見 150ms。Pressed 反向用 80ms 急收，營造「按下去有東西被擠壓」的觸感。
- **Primary link hover**：`gap` 從 10px 擴張到 16px，配合 `→` 向右平移。
- **Page transitions**：避免 slide-in / opacity 轉場。直接呈現，節奏靠字體 + 間距帶出。
- **Reduced motion**：所有 `drift`、`spin`、`scaleX progress`、translateY hover 都要包在 `@media (prefers-reduced-motion: reduce)` 裡降為 0 或單純 color/border 變化。**Tactile 的 box-shadow 變化可保留**，shadow 漸變不會引發前庭反應。

### 5.3 Ambient 招牌（氛圍層 · 不分材質 register）

這三個是頁面層級的 ambient 效果，跟下面的材質系統獨立。Hero / Landing 頁套用，App dashboard 不套用。

#### A-1 · Reading Progress Bar
頁面最頂部 3px 漸層條，隨 scroll 前進：
```css
.progress {
  position: fixed; top: 0; left: 0; right: 0; height: 3px;
  background: linear-gradient(to right,
    var(--primary),
    color-mix(in srgb, var(--primary) 70%, transparent),
    var(--primary));
  transform-origin: left; transform: scaleX(0);
  z-index: 100; transition: transform 100ms ease-out;
}
```
JS scroll listener 更新 `transform: scaleX(pct)`。**所有閱讀型頁面都要有**（404 除外）。

#### A-2 · Ambient Gradient Orbs
Hero 區背景的 3 個 blur 漸層圓，緩慢 drift（24s 循環）：
```css
.orb { position: absolute; border-radius: 50%; filter: blur(80px);
  will-change: transform; animation: drift 24s ease-in-out infinite; }
.orb-1 { opacity: 0.18; background: radial-gradient(circle, var(--primary-soft), transparent 70%); }
.orb-2 { opacity: 0.10; background: radial-gradient(circle, var(--stone), transparent 70%); animation-delay: -8s; }
.orb-3 { opacity: 0.15; background: radial-gradient(circle, var(--bg-muted), transparent 70%); animation-delay: -16s; }
[data-theme="dark"] .orb { opacity: 0.14; }
@keyframes drift {
  0%, 100% { transform: translate(0,0) scale(1); }
  50% { transform: translate(3%, -4%) scale(1.04); }
}
```
- 顏色直接從 palette 取（`--primary-soft` / `--stone` / `--bg-muted`），不再用 oklch 自製
- 只用在 Hero / Splash / Landing，**不**用在 app dashboard
- `will-change: transform` 防止掉幀

#### A-3 · Grain Overlay
頁面層全屏細緻雜訊，疊加紙質感：
```css
.grain {
  position: fixed; inset: 0; pointer-events: none; z-index: 1;
  opacity: 0.035; mix-blend-mode: multiply;
  background-image: url("data:image/svg+xml,...feTurbulence baseFrequency='0.85'...");
}
```
選用、可選擇性開啟。Editorial / 長文頁建議開，Dashboard 可關。

---

### 5.4 Tactile 材質系統（主招牌）

**Tactile 是 LazzyMerlin 的主視覺語言**：所有 CTA / 卡片 / Tile 都用這套。核心原則：**touchable 元件需有層次感** — fillable 底 + 暗化 / 漸層 + drop shadow + 細微紋理 + 雕刻字。

#### 跨平台共通配方（v0.2.0 起）

v0.2.0 把 Tactile 重新校準為 **跨平台共通配方** —— web 跟 SwiftUI 用同一份「六件 building blocks」，視覺氣質一致到「分不太出來」。先前（v0.1.4 及之前）的 Tactile-Heavy 強度（雙層 inset rim、4 層 drop shadow、SVG turbulence noise）因為 SwiftUI 無等價而降規格 —— web 端視覺強度約 -30%，換得 iOS / macOS / web 視覺氣質真正一致。

**共通六件 building blocks：**

| # | 元素 | Web (CSS) | SwiftUI |
|---|---|---|---|
| 1 | 對角微暗化 | `linear-gradient(135deg, rgba(255,255,255,0.04) 0%, transparent 50%, rgba(0,0,0,0.18) 100%)` | `LinearGradient(colors: [.white.opacity(0.04), .clear, .black.opacity(0.18)], startPoint: .topLeading, endPoint: .bottomTrailing)` |
| 2 | 上亮下暗單層內邊（取代雙層 inset rim） | `box-shadow: inset 0 1px 0 rgba(255,255,255,0.30), inset 0 -1px 0 rgba(0,0,0,0.20)` | `.overlay { RoundedRectangle().stroke(LinearGradient(white→black, top→bottom), lineWidth: 1) }` |
| 3 | Drop shadow（近 + 遠，共 2 層） | `box-shadow: 0 2px 4px rgba(15,28,38,0.15), 0 6px 12px rgba(15,28,38,0.10)` | `.shadow(color: .black.opacity(0.15), radius: 4, y: 2).shadow(color: .black.opacity(0.10), radius: 12, y: 6)` |
| 4 | Noise overlay（共用 PNG tile） | `background-image: url('/assets/tactile-noise.png'); background-size: 256px; mix-blend-mode: soft-light; opacity 0.06-0.10` | `Image("TactileNoise").resizable(resizingMode: .tile).opacity(0.08).blendMode(.softLight)` |
| 5 | Text shadow（雕刻字） | `text-shadow: 0 1px 0 rgba(255,255,255,0.40)`（深底改 `rgba(0,0,0,0.30)`） | `.shadow(color: .white.opacity(0.4), radius: 0, y: 1)`（深底改 `.black.opacity(0.3)`） |
| 6 | Continuous radius | `border-radius: 10-20px`（CSS `border-radius` 視覺即 continuous squircle） | `RoundedRectangle(cornerRadius: ..., style: .continuous)` |

**共用 asset：** [`assets/tactile-noise.png`](assets/tactile-noise.png) —— 256×256 RGBA PNG，從 `<feTurbulence baseFrequency='1.6' numOctaves='4' seed='5' stitchTiles='stitch'>` render，stitchable 無縫平鋪。Web 跟 iOS bundle 同一份，從來源就保證跨平台一致。

#### 5.4.1 Tactile 四態材質

四種材質對應四種語意角色，**任何 Tactile 元件選一種**。每態都用 §5.4 共通六件 building blocks 組合，跨平台等價：

| Material | 背景 | 凸/凹 | 套用配方件 | 用途 |
|---|---|---|---|---|
| **Base** | `--bg-raised` | 微凸（薄浮雕） | 1 + 2 + 3（弱）+ 4（極淡）+ 6 | 一般卡片、容器、page surface |
| **Raised** | `--primary` / `--primary-deep` | 強凸（厚浮雕） | 1 + 2 + 3（強）+ 4 + 5 + 6 | 主 CTA、Hero tile、強調 panel |
| **Inset** | `--bg`（同底色） | 凹陷 | 反向 1 + 反向 2（光源反轉）+ 6 | 表單輸入、容器內凹槽 |
| **Pressed** | `--stone` 或暗色 | 整片下沉 | 1（強暗）+ 反向 2 + 5 + 6 + 1 層淺 drop shadow | active 狀態、selected toggle |

**Raised（主 CTA）web 規格：**
```css
.tactile-raised {
  background-color: var(--primary);
  color: var(--bg);
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.30);
  background-image:
    linear-gradient(135deg, rgba(255,255,255,0.06) 0%, rgba(255,255,255,0) 50%, rgba(0,0,0,0.22) 100%),
    url('/assets/tactile-noise.png');
  background-size: auto, 256px 256px;
  background-blend-mode: normal, soft-light;
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.30),
    inset 0 -1px 0 rgba(0, 0, 0, 0.20),
    0 2px 4px rgba(15, 28, 38, 0.15),
    0 6px 12px rgba(15, 28, 38, 0.10);
  border-radius: 12px;
}
```

**Raised SwiftUI 等價** — 完整 ViewModifier 見 §7.2.9。

**Base（淺浮雕）web 規格：**
```css
.tactile-base {
  background-color: var(--bg-raised);
  background-image:
    linear-gradient(135deg, rgba(255,255,255,0.04) 0%, rgba(255,255,255,0) 50%, rgba(15,28,38,0.10) 100%),
    url('/assets/tactile-noise.png');
  background-size: auto, 256px 256px;
  background-blend-mode: normal, soft-light;
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.50),
    inset 0 -1px 0 rgba(15, 28, 38, 0.10),
    0 2px 4px rgba(15, 28, 38, 0.10),
    0 4px 8px rgba(15, 28, 38, 0.06);
  border-radius: 12px;
}
```

**Inset（凹陷）web 規格** — 光源反轉（左上陰影、右下反射光）：
```css
.tactile-inset {
  background-color: var(--bg);
  background-image:
    linear-gradient(135deg, rgba(15,28,38,0.10) 0%, rgba(255,255,255,0) 50%, rgba(255,255,255,0.06) 100%);
  box-shadow:
    inset 0 1px 2px rgba(15, 28, 38, 0.18),
    inset 0 -1px 0 rgba(255, 255, 255, 0.40);
  border-radius: 10px;
}
```
注意：Inset **不加 noise overlay**（凹槽紋理會打架），也**不加 drop shadow**（凹槽本來就在元件內）。

**Pressed web 規格：**
```css
.tactile-pressed {
  background-color: var(--stone);
  color: var(--bg);
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.30);
  background-image:
    linear-gradient(135deg, rgba(0,0,0,0.20) 0%, rgba(255,255,255,0) 50%, rgba(255,255,255,0.06) 100%);
  box-shadow:
    inset 0 1px 2px rgba(0, 0, 0, 0.30),
    inset 0 -1px 0 rgba(255, 255, 255, 0.10),
    0 1px 2px rgba(15, 28, 38, 0.10);
  border-radius: 12px;
}
```

#### 5.4.2 Dark mode 規則

Dark mode 不是 light 直接反色，三項調整：
- **Single inset stroke**：頂緣 highlight 降到 `rgba(255,255,255,0.10-0.20)`，底緣加深到 `rgba(0,0,0,0.30-0.40)`
- **Drop shadows** 全部換成 `rgba(0,0,0,...)`，opacity 比 light mode 高 30-40%（dark 上 shadow 視覺感弱、需補強）
- **Noise overlay** opacity 從 0.06-0.10 → 0.10-0.12（dark 底上要稍強才看得見），blend mode `soft-light` 不變

```css
[data-theme="dark"] .tactile-raised {
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.40);
  background-image:
    linear-gradient(135deg, rgba(255,255,255,0.04) 0%, rgba(255,255,255,0) 50%, rgba(0,0,0,0.30) 100%),
    url('/assets/tactile-noise.png');
  background-size: auto, 256px 256px;
  background-blend-mode: normal, soft-light;
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.15),
    inset 0 -1px 0 rgba(0, 0, 0, 0.40),
    0 2px 6px rgba(0, 0, 0, 0.25),
    0 8px 16px rgba(0, 0, 0, 0.20);
}
```

[從 web-only 強配方退役] v0.1.4 及之前的雙層 inset rim + 4 層 drop shadow + SVG turbulence noise 配方因為跨平台無等價，於 v0.2.0 退役。歷史完整 spec 見 `git show v0.1.4:DESIGN.md`。

#### 5.4.3 Tactile 配套參數

- **Radius**：Tactile 元件最小 `radius-md 10px`，**建議 `radius-lg 12px` 起跳**，tile 用 `radius-xl 16-20px`，按鈕 `radius-lg 12-16px`
- **Padding**：要夠寬才撐得起浮雕。按鈕至少 `12px 22px`，卡片至少 `24px`，tile 至少 `14px`
- **`overflow: hidden`**：必須，否則 noise overlay 會溢出
- **`position: relative` + `::after`**：noise overlay 必經 `::after` 偽元素，內容子元素需 `position: relative; z-index: 1` 浮在 noise 之上
- **Text shadow**：Tactile 元件文字一律加 `text-shadow: 0 1px 0 rgba(255,255,255,0.4)`（深底文字改 `rgba(0,0,0,0.3)`），雕刻感才完整
- **Noise overlay 跨平台調整**：Web 採 spec 全強度（`opacity: 0.55-0.85`、blend mode `overlay`/`soft-light`）；iOS Retina 高 DPI（@2x / @3x）下這個強度會被認知為「螢幕髒」而非材質感，須降到 spec 的 1/10（建議 `opacity: 0.05-0.08`）或直接 opt-out。詳見 §7.2「Noise overlay iOS 調整」

### 5.5 Hybrid Shadow（輕量替代）

Tactile 厚重浮雕在 editorial / 長文 / list view 場景太重。Hybrid 是 Tactile 語言的輕量版：**hairline 線框 + Soft drop shadow + translateY 上浮 + border 轉 Primary**。

```css
.btn-hybrid {
  padding: 12px 22px; border-radius: 12px;
  background: var(--bg); color: var(--ink);
  border: 1px solid var(--hairline);
  box-shadow: var(--shadow-soft-sm);
  transition: transform 250ms ease, box-shadow 250ms ease, border-color 250ms ease;
}
.btn-hybrid:hover {
  transform: translateY(-3px);
  box-shadow: var(--shadow-soft);
  border-color: var(--primary);
}
.btn-hybrid:active {
  transform: translateY(0);
  box-shadow: var(--shadow-soft-inset);
  transition: transform 80ms ease, box-shadow 80ms ease;
}
```

**Soft shadow tokens（Hybrid + Soft Inset 共用）：**
```css
/* Light mode */
--shadow-soft-sm:
  6px 6px 12px rgba(33, 23, 21, 0.08),
  -6px -6px 12px rgba(255, 255, 255, 0.75);
--shadow-soft:
  10px 10px 20px rgba(33, 23, 21, 0.10),
  -10px -10px 20px rgba(255, 255, 255, 0.85);
--shadow-soft-inset:
  inset 4px 4px 8px rgba(33, 23, 21, 0.08),
  inset -4px -4px 8px rgba(255, 255, 255, 0.75);

/* Dark mode */
--shadow-soft-sm:
  6px 6px 12px rgba(0, 0, 0, 0.45),
  -6px -6px 12px rgba(94, 122, 141, 0.06);
--shadow-soft:
  10px 10px 20px rgba(0, 0, 0, 0.50),
  -10px -10px 20px rgba(94, 122, 141, 0.08);
--shadow-soft-inset:
  inset 4px 4px 8px rgba(0, 0, 0, 0.35),
  inset -4px -4px 8px rgba(94, 122, 141, 0.06);
```

### 5.6 Soft Inset（控制元件觸感）

Input / Switch / Slider 這類控制元件不適合 Tactile（太厚重會擋視線），用純 inset 暗示「可以輸入 / 可以拉」：

```css
.soft-input {
  width: 100%; padding: 14px 20px; border-radius: 16px;
  background: var(--bg); border: none; outline: none;
  box-shadow: var(--shadow-soft-inset);
}

.soft-switch {
  width: 52px; height: 28px; border-radius: 9999px;
  background: var(--bg); padding: 3px; cursor: pointer;
  box-shadow:
    inset 2px 2px 5px rgba(15, 28, 38, 0.18),
    inset -1px -1px 2px rgba(255, 255, 255, 0.5);
}
.soft-switch.on { background: var(--primary); }
.soft-switch::after {  /* thumb */
  width: 22px; height: 22px; border-radius: 50%;
  background: var(--bg);
  box-shadow:
    0 2px 4px rgba(15, 28, 38, 0.20),
    inset 0 1px 0 rgba(255, 255, 255, 0.6),
    inset 0 -1px 0 rgba(15, 28, 38, 0.06);
}

.soft-slider {  /* track */
  height: 8px; border-radius: 9999px; background: var(--bg);
  box-shadow:
    inset 2px 2px 4px rgba(15, 28, 38, 0.20),
    inset -1px -1px 2px rgba(255, 255, 255, 0.5);
}
```

**配套 radius：** Soft inset 元件圓角要夠大才有「軟墊感」。輸入框 `radius-xl 16px` 起跳，膠囊 toggle / slider 用 `radius-full`。

### 5.7 元件 → Material 對照表

每個元件**選一套**，不要混用。各 Material 在 web / iOS / macOS 三平台的 implementation 對照：

| 元件類型 | Material | Web class | iOS / macOS（SwiftUI） |
|---|---|---|---|
| 主 CTA 按鈕 | **Tactile Raised** | `.btn-tactile.primary` | `.tactileRaised()` ViewModifier（§7.2.9） |
| 次 CTA / Ghost button | **Hybrid** | `.btn-hybrid` | `.tactileHybrid()` ViewModifier |
| Hero / Landing tile | **Tactile（base/raised 擇一）** | `.tile-tactile.base` | `.tactileBase()` / `.tactileRaised()` |
| Editorial card / Article tile | **Tactile Base** | `.shadow-card` | `.tactileBase()` |
| List view item / 輕量卡片 | **Hybrid** | `.btn-hybrid`（拉長版） | `.tactileHybrid()` |
| Theme toggle / Pill button | **Tactile Base 簡化版** | `.theme-toggle` | `.tactileBase(radius: .infinity)` |
| Input / Textarea | **Soft Inset** | `.soft-input` | `.tactileInset()` |
| Switch / Toggle | **Soft Inset**（track）+ Tactile thumb | `.soft-switch` | iOS `Toggle()` 自帶 + `.tint(.accent)` |
| Slider | **Soft Inset**（track）+ Tactile thumb | `.soft-slider` | iOS `Slider()` 自帶 |
| Checkbox / Radio | **Soft Inset**（unchecked）→ **Tactile Pressed**（checked） | — | iOS `Toggle(.checkbox)` 自帶 |
| Chip / Tag | 純色 fill，不加 shadow | `.chip` | `.background(...).clipShape(Capsule())` |
| Pure text link | 只 color hover，**不**加 shadow / 上浮 | — | `Button(.borderless)` |

**SwiftUI 原生元件優先**：Switch / Slider / Checkbox 用 SwiftUI 內建 `Toggle()` / `Slider()`，只調 `.tint(Color("Primary"))` 套 brand color，不重造輪子。Apple 的 native control 自動跟系統 Dynamic Type / Accessibility / Reduce Motion 整合。

**禁止：** 同一個元件同時用 Tactile + Soft inset（例如 input 框體用 Soft、focus 套 Tactile drop shadow）—— 看起來像 bug。

### 5.8 Interactive State System（五態 · 對齊 Tactile）

所有互動元件的五態規範（以 Tactile Base 為例，其他材質依此語言調整）：

| State | 視覺規則 | Transition |
|---|---|---|
| **Default** | 該材質的靜態 box-shadow | — |
| **Hover** | `translateY(-3px)`，drop shadow 全部放大（近層 4→6 / 中層 8→10 / 遠層 20→22 / blur 各 +5），noise overlay opacity 不變 | `220ms cubic-bezier(0.4, 0, 0.2, 1)` |
| **Pressed / Active** | `translateY(2px)`，外層 drop shadow 收掉，改用 inset shadow（模擬「被擠進去」），文字 `text-shadow` 加深 | `80ms ease` |
| **Loading** | Default 位置 + 12px circular spinner（`border: 2px var(--hairline)`，`border-top: var(--primary)`），文字色 `color-mix(ink 60%, transparent)`，`padding-left: 32px` 給 spinner | spinner 自轉 `700ms linear infinite` |
| **Disabled** | `opacity: 0.4`，外層 drop shadow 縮減（只留近層 + hairline），`cursor: not-allowed` | — |

**Pressed 規範 CSS（Tactile Raised）：**
```css
.btn-tactile:active {
  transform: translateY(2px);
  box-shadow:
    inset 3px 4px 10px rgba(15, 28, 38, 0.25),
    inset -1px -1px 4px rgba(255, 255, 255, 0.45),
    1px 1px 2px rgba(15, 28, 38, 0.10);
  transition: transform 80ms ease, box-shadow 80ms ease;
}
```

**Loading spinner：**
```css
.demo-btn.loading::before {
  content: ''; position: absolute;
  left: 12px; top: 50%; transform: translateY(-50%);
  width: 12px; height: 12px; border-radius: 50%;
  border: 2px solid var(--hairline);
  border-top-color: var(--primary);
  animation: spin 700ms linear infinite;
}
@keyframes spin { to { transform: translateY(-50%) rotate(360deg); } }
```
**不用整塊 shimmer overlay。** Loading 用 spinner 或細線 skeleton。

**Disabled** 用 opacity-based（不另換填色），保持互動狀態的視覺簡潔。

### 5.9 反面教材（材質層）

- ❌ 純 flat 色塊按鈕（沒 shadow、沒 gradient、沒 border）— 沒材質就不是 LazzyMerlin
- ❌ 純 Hard Shadow `4px 5px 0 0`（v5 起 deprecated，已被 Tactile 取代為主招牌）
- ❌ 同元件混用 Tactile + Soft inset
- ❌ Tactile 元件忘記 `overflow: hidden` → noise 溢出
- ❌ Tactile 元件用 `radius-sm 6px` → 浮雕擠在角落看起來髒
- ❌ Hover 直接換 background color（Tactile 改變的是 shadow / translateY，不換色）
- ❌ Light mode 用 `rgba(0,0,0,...)` 當 shadow（要用品牌 ink 色 `rgba(15,28,38,...)` 或 `rgba(33,23,21,...)`，黑色會變死黑）

---

## 六、裝飾元素（魔法點綴層）

這些是 LazzyMerlin 的「氛圍細節」，適度點綴讓品牌一眼可辨。**這一層是魔法感的主要承載**。

### 6.1 Unicode Glyphs
用於 section separator、decorative accent：
```
✦  （星芒，主要）
◈  （菱形，次要）
❦  （花飾，用在文末 / 長文分段）
☾  （弦月，特殊頁面）
·  （midline dot，metadata 分隔）
—  （em dash，不與 – / -- 混用）
```

用法：
- Section separator：`✦` 置中，兩側 hairline
- Label 分隔：`LAZZYMERLIN · 威爾的懶人主義 · EST. MMXXVI`

### 6.2 Hairline 系統
淡 Stone 色 hairline 是 LazzyMerlin 的基本設計元素：
- `border-bottom: 1px solid var(--hairline)` for section separator
- `border: 1px solid var(--border)` for cards
- hover 時 card border 變為 `var(--primary)`

### 6.3 Small-caps label
所有 section 標題用這個格式：
```
font-family: "Geist Mono";
font-size: 12px;
letter-spacing: 0.24em;
color: var(--primary);  /* light: petrol ink / dark: sky petrol */
text-transform: uppercase;
```
例：`精選專案 · FEATURED SPELLS`、`近期手札 · NOTEBOOK`

### 6.4 羅馬數字
年份、版本號、metadata 用羅馬數字營造古卷感：
- `EST. MMXXVI`（2026）
- Footer 用 `© MMXXVI`

### 6.5 紙質質感（選用）
可疊加細緻雜訊 texture（opacity 0.025-0.03，mix-blend-mode: multiply）模擬紙張。選用、不強制。

---

## 七、跨平台套用指南

LazzyMerlin 不是 web-only DS。各平台的原則是**套用品牌 tokens，尊重平台 convention**。

### 7.1 Web（核心陣地）
- 完整套用所有 tokens
- 字體從 Google Fonts 載入
- Light/Dark 雙模式，`prefers-color-scheme` + 手動 toggle
- 元件庫建議：shadcn/ui（改 token 值即可跟 LazzyMerlin DS 一致）
- 參考實作：`preview-v4.html` 在 `~/.gstack/projects/LazzyMerlin/designs/design-system-20260422/v3/`

### 7.2 iOS（SwiftUI）

iOS 平台優先順序：**遵循 Apple HIG > 套用 LazzyMerlin DS tokens > 硬塞 web 視覺**。HIG 規定的（safe area、touch target、navigation pattern）一定遵守，DS 提供的是色彩 / 字體 / 階層偏好。

#### 7.2.1 Color · accentColor 與 wood palette 對齊

- **`accentColor`** 設為 Petrol `#46647C`（Light）/ Mid Petrol `#5E7A8D`（Dark），對齊 §1 wood palette + §2.4 dark mode 互換規則
- 在 Asset Catalog `AccentColor.colorset` 設 Any Appearance（light）+ Dark Appearance 兩值
- **Tab bar / nav**：遵循 iOS 原生樣式，只染 `accentColor`，不自定 background
- **Unicode glyphs**：SF Symbols 有 `star.fill`（相當於 ✦）可取代使用，size config 用 `.symbolRenderingMode(.hierarchical)` 取得自然層次

#### 7.2.2 Card surface tier · §2.2.1 iOS 對應

| DS Token | SwiftUI 對應 | 用途 |
|---|---|---|
| `--bg`（page surface） | `Color(uiColor: .systemBackground)` 或自訂 `Color("Bg")` | 全屏底色 |
| `--surface-1`（一階 card） | `.background(.regularMaterial)` 或同色 + `.shadow(radius: 8, y: 4)` | 主 card / container |
| `--surface-2`（二階 popover） | `.background(.thickMaterial)` 或 luminance +5% 純色 | Nested card / dropdown / popover |

**Light mode**：偏好同色 + `.shadow()` 創造階層（Tactile 影子語言的 iOS 等價）；**Dark mode**：偏好用純色亮度差（dark mode 下 shadow 視覺 affordance 弱），`Color("Surface1Dark")` 比 `--bg` 提亮 ~5%。

#### 7.2.3 Spacing · DS 4px scale 與 HIG 8pt grid 對齊

iOS 使用 pt 單位，HIG 推薦 8pt grid。LazzyMerlin DS 用 4px scale（base 4），落地 iOS 採以下對應：

| DS Spacing | Web px | iOS pt | SwiftUI 用法 |
|---|---|---|---|
| `xs` | 4 | 4 | inner padding（icon ↔ label） |
| `sm` | 8 | 8 | tight stack spacing |
| `md` | 12 | 12 | default `VStack(spacing: 12)` |
| `lg` | 16 | 16 | section padding（HIG `.padding()` 預設） |
| `xl` | 24 | 24 | card padding |
| `2xl` | 32 | 32 | section gap |
| `3xl` | 48 | 48 | hero padding |

**與 HIG 8pt grid 妥協**：DS 的 `xs:4` / `md:12` 不在 8pt grid 上，但 4 / 12 是 HIG 內 `compact` 場景常用 minor unit（HIG 例外允許），落地時優先 DS scale。Container padding 至少 `lg:16`（HIG `.padding()` 預設）。

#### 7.2.4 Type Scale · DS web px 與 iOS pt 對照

iOS 使用 SF Pro + PingFang TC（不用 Geist，換取系統整合感、Dynamic Type 支援），display 仍用 LXGW WenKai TC（bundle）。

| DS Scale | Web px | iOS pt | SwiftUI Style | 用途 |
|---|---|---|---|---|
| Display XL | 88 | 56 | `.largeTitle` 加粗 / 自訂 LXGW | Hero、Splash |
| H1 | 40 | 28 | `.title` | 頁面主標 |
| H2 | 28 | 22 | `.title2` | section 標 |
| H3 | 22 | 20 | `.title3` | sub-section |
| Body Large | 18 | 17 | `.body` 或 `.system(size: 17)` | 主要內文 |
| Body | 16 | 17 | `.body` | iOS body 標準 17pt（DS 16 → 17 對齊 HIG） |
| Body Small | 14 | 15 | `.subheadline` | 次內文 |
| Caption | 12 | 12 | `.caption` | 註解 |
| Label | 11-12 | 12 | `.caption2` + `.textCase(.uppercase)` | Section label（small-caps 替代） |

**Dynamic Type**：SwiftUI `.body` / `.title` 等 semantic style 自動跟隨 user 字級偏好放大，**優先使用 semantic style 而非 `.system(size:)`**，accessibility 一併過。

#### 7.2.5 Display 字型 · LXGW WenKai TC bundle

- **Bundle 方式**：下載 OTF / WOFF2 → 拖進 Xcode target → `Info.plist` 加 `Fonts provided by application`（Xcode 16 PBXFileSystemSynchronizedRootGroup 模式下 Info.plist 須在 source folder 外，見 §16.5 / landing-checklist Phase 0）→ SwiftUI `.font(.custom("LXGWWenKaiTC-Regular", size: 56))`
- **Subset 建議**：完整 LXGW WenKai TC ~10MB，iOS app bundle 建議用 `pyftsubset` 做繁體常用字 subset（U+4E00-9FFF 加 ASCII，~2MB）

#### 7.2.6 Section label · SF Mono + uppercase（取代 web 端 Geist Mono small-caps）

iOS SF Mono **沒有真正的 small-caps glyph**，落地走 uppercase + 字距：

```swift
Text("SECTION LABEL")
    .font(.system(.caption2, design: .monospaced))
    .textCase(.uppercase)
    .tracking(1.2)               // 字距，模擬 web small-caps 的氣質
    .foregroundStyle(.accentColor)
```

對應 web 端 `font-feature-settings: "smcp"` 寫法，**視覺結果不完全等同**（沒 lowercase 縮小版的微差），但語意層級一致。

#### 7.2.7 Radius · 全用 continuous corner

iOS 上 `RoundedRectangle` 兩種 style 視覺差很大：

```swift
// ✅ 偏好 continuous（squircle，跟 iOS app icon 同調，視覺更和諧）
RoundedRectangle(cornerRadius: 16, style: .continuous)

// ❌ 不用 circular（純圓弧，跟 iOS 視覺語言不和諧、像 Material Design）
RoundedRectangle(cornerRadius: 16)  // 預設 .circular
```

DS radius scale 對應：`radius-sm 6` / `md 10` / `lg 12` / `xl 16` / `2xl 20` 全部用 `.continuous`。

#### 7.2.8 Dark mode 偏好 · 跟系統為主、提供三態 override

```swift
// 預設跟系統
@Environment(\.colorScheme) var systemColorScheme

// 提供 user override 三態
enum AppearancePreference: String, CaseIterable {
    case system, light, dark
}

// 套用
.preferredColorScheme(preference == .system ? nil : (preference == .light ? .light : .dark))
```

UI 偏好：Settings 內提供「系統 / 淺色 / 深色」三態切換（不要強迫 user 跟系統，但預設跟系統）。Dark mode 互換規則跟 §2.4 一致。

#### 7.2.9 Tactile material 跨平台等價（v0.2.0 起）

v0.2.0 把 Tactile 重新校準為跨平台共通配方（見 §5.4），iOS 用 SwiftUI 完整等價實作 —— 不再「opt-out」或「降強度模擬」，而是**跟 web 用同一份 PNG noise tile + 同套六件 building blocks**，視覺氣質「分不太出來」。

**前置：** bundle [`assets/tactile-noise.png`](../../assets/tactile-noise.png) 進 `Assets.xcassets` 命名 `TactileNoise`（256×256 RGBA、stitchable）。

##### Tactile Raised（主 CTA · ViewModifier）

```swift
import SwiftUI

extension View {
    func tactileRaised(radius: CGFloat = 12) -> some View {
        modifier(TactileRaisedModifier(radius: radius))
    }
}

struct TactileRaisedModifier: ViewModifier {
    let radius: CGFloat
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .padding(.horizontal, 22)
            .foregroundStyle(Color("Bg"))
            .shadow(color: colorScheme == .dark
                    ? .black.opacity(0.40) : .black.opacity(0.30),
                    radius: 0, y: 1) // text shadow
            .background {
                ZStack {
                    Color("Primary")
                    LinearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.04 : 0.06),
                            .clear,
                            .black.opacity(colorScheme == .dark ? 0.30 : 0.22)
                        ],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                    Image("TactileNoise")
                        .resizable(resizingMode: .tile)
                        .opacity(colorScheme == .dark ? 0.10 : 0.08)
                        .blendMode(.softLight)
                        .allowsHitTesting(false)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                .white.opacity(colorScheme == .dark ? 0.15 : 0.30),
                                .black.opacity(colorScheme == .dark ? 0.40 : 0.20)
                            ],
                            startPoint: .top, endPoint: .bottom
                        ),
                        lineWidth: 1
                    )
            }
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.25 : 0.15),
                    radius: 4, y: 2)
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.20 : 0.10),
                    radius: 12, y: 6)
    }
}
```

##### Tactile Base / Inset / Pressed

四態 ViewModifier 對應 §5.4.1 web 規格：
- `.tactileBase()` — 弱 drop shadow（radius 4 + 8 兩層）、`Color("BgRaised")` 底
- `.tactileInset()` — 反向光源（頂緣 dark stroke、底緣 light stroke）、無 drop shadow、無 noise
- `.tactilePressed()` — `Color("Stone")` 底 + 1 層淺 drop shadow + 反向 stroke

完整四態 reference impl 見 [`preview-ios/LazzyMerlinDSPreview/LazzyMerlinDSPreview/Tokens/TactileMaterial.swift`](preview-ios/LazzyMerlinDSPreview/LazzyMerlinDSPreview/Tokens/TactileMaterial.swift)（v0.2.0 起 ship）。

##### 視覺一致性驗證

`preview-ios/screenshots/` 內 commit web vs iOS side-by-side screenshot 作 visual regression baseline。每次改動 §5.4 配方都要重截、確認跨平台「分不太出來」。

### 7.3 macOS（SwiftUI / AppKit）

完全沿用 §7.2 iOS 規範（Color / Typography / Spacing / Surface tier / Tactile material 共通配方），只在以下幾點 macOS 專屬調整：

- **`accentColor`** 設 Petrol `#46647C`（同 iOS）
- **Tactile 共通配方**：`.tactileRaised()` / `.tactileBase()` / `.tactileInset()` / `.tactilePressed()` ViewModifier 完全跨 iOS / macOS 通用（SwiftUI 同份 code）
- **Window chrome**：保持 macOS 原生 traffic light + title bar，**不要**自繪
- **Sidebar**：用 `.background(.regularMaterial)` 取得原生 macOS sidebar 質感，再疊 `tactileBase()` 內容卡片
- **長文件 / note-taking app**：可強化「書房感」，側邊欄用 `Surface Raised` token，hairline 用 Stone 色 `#967459`
- **macOS 14+ Liquid Glass**：可在 toolbar / sidebar 用 `.background(.ultraThinMaterial)` 達成 Liquid Glass 效果，跟 Tactile 卡片並存無衝突
- **Icon**：LazzyMerlin 專屬 icon 使用 Petrol + Parchment 組合（§8.3.3 macOS 規範）

**preview-ios/ 同樣 cover macOS target**：`preview-ios/LazzyMerlinDSPreview` 是 multiplatform SwiftUI app，iOS / macOS 共用同份 ContentView，只在需要 platform-specific 行為時用 `#if os(macOS)`。

### 7.4 Notion 模板
Notion 沒自訂 CSS，只能靠以下元素傳達品牌：
- **頁面 Icon**：使用 `✦` 或 LazzyMerlin 專屬 emoji
- **Cover**：奶茶米底 + 頁名（標題留左對齊，H1 用「嗨，我是 威爾 · Hey, I am Will.」風格）
- **頁面顏色 tag**：使用 Notion 的 blue（對齊 Primary）、gray（Stone）、brown（Surface Muted）
- **H1 排版**：遵守中英混排的雙語格式
- **區塊分隔**：用 `✦` 或 `---`
- **Callout 區塊**：用 blue 背景 + 星星 icon 作為「懶人提示」

### 7.5 Chrome Extension
- 共用 Web tokens
- popup 視窗尺寸通常 360-400px 寬 → 使用 Body Large scale，間距壓縮一級
- Dark mode 必做（Chrome extension 使用情境常是夜晚）

### 7.6 Instagram（內容版型）
- **貼文模板**：奶茶米底 + 大字楷體中文標題 + 右下角 `✦ LazzyMerlin` 小簽名（Petrol 色）
- **IG Story**：Deep Ink 深底 + Warm Ivory 文字 + Sky Petrol 重點
- **Highlight cover**：Petrol Ink 圓底 + Parchment 色楷體字 + 小 `✦` 符號
- **頭像**：LazzyMerlin icon，奶茶米底 + Petrol 圖示
- **限制**：IG 壓縮會讓細字讀性下降，字級要比 web 大 2 級

### 7.7 Game（Opt-out）
- 遊戲 UI 元件通常跟遊戲本身有關，**不強制**使用 LazzyMerlin 設計元素
- 建議：**splash screen 與 About 頁**帶入品牌色（Petrol + Parchment）與 `✦ LazzyMerlin` 簽名
- 遊戲選單 typography 不必強用楷體

---

## 八、Brand Mark（Logo）

### 8.1 主要 logo
檔案位置：`~/Projects/LazzyMerlin/assets/lazzymerlin-logo.png`

Logo 內容：戴藍色巫師帽的女巫（= 梅林）+ 兩隻貓（虎斑 + 白底虎斑）+ 米白圓底 + 星星月亮點綴 + 底部弧形「LAZZY MERLIN」。

使用原則：
- **不裁切、不修改顏色、不重繪**
- 最小尺寸建議 **120×120px**（低於此會失去細節）
- **縮小到 32×32 用作 favicon 可接受**（使用者偏好直接縮，不做簡化 sigil）
- Logo 下方至少保留 **24px 空白**，不要緊貼 footer 或其他元件

### 8.2 Logo 家族

| 版本 | 內容 | 用途 |
|---|---|---|
| **主 logo** | 女巫 + 雙貓 + 弧形字 + 米白圓底 | 網站 hero、About、IG header、OG |
| **Favicon** | 主 logo 直接縮小（不做 simplified sigil） | 瀏覽器 tab、bookmark |
| **App icon**（含家族）| 詳見 §8.3 | iOS / macOS / Android 應用程式 |
| **Watermark / decorative** | 主 logo 縮小 + opacity 0.4-0.6 | IG 貼文角落簽名、footer 浮印 |
| **Wordmark-only** | `✦ 威爾的懶人主義 · LazzyMerlin`（霞鶩文楷 + Geist Mono） | logo 放不下、純文字場景、email signature |
| **Sigil-only**（極簡簽名）| 單一 `✦` glyph，Petrol 色 | 文末分節、loading dot、bullet 替代 |

### 8.3 App Icon 家族規範

App icon 不是 favicon 放大版。各平台對「應用 icon」有強硬規範，不照做就上不了 store。

#### 8.3.1 共用設計原則
- **無圓底邊框**：iOS / macOS 系統會自動 mask 成圓角矩形 / 圓形，**不要**自己畫圓底（會重複圓角）
- **保留 10% padding**：icon 主元素內縮，避免被系統圓角裁掉
- **Light + Dark 雙版本**：iOS 18+ / macOS 15+ 支援（用戶可選 light / dark / tinted）
- **Tinted 版本**：iOS 18 新增、灰階 + 系統強調色染色 —— 需提供 desaturated 版本

#### 8.3.2 iOS App Icon

尺寸（@1x → @3x 全套）：
```
20×20    notification               iPhone @2x @3x
29×29    settings                   iPhone @2x @3x
40×40    spotlight                  iPhone @2x @3x
60×60    home                       iPhone @2x @3x = 120 / 180
1024×1024 app store                 1×（master）
```

實作流程：
1. 在 Figma / 任何向量工具畫 1024×1024 master
2. 主元素內縮 10%（內容區 ~922×922）
3. **不畫圓底**（iOS 自動套圓角 mask，半徑 ~22.5%）
4. 用 [Bakery](https://apps.apple.com/app/bakery) / `xcrun actool` 批量產出 `Assets.xcassets`
5. iOS 18 額外加 `Dark` 與 `Tinted` 兩個 variant

LazzyMerlin iOS icon 設計：
- **Light**：Parchment `#F5EFE4` 底 + Petrol `#46647C` 巫師帽 + 米白星芒 `✦`
- **Dark**：Midnight Petrol `#0F1C26` 底 + Parchment 巫師帽 + Sky Petrol 星芒
- **Tinted**：灰階主元素 +  `✦` 星芒留白讓系統染色（iOS 自動）

##### AI 生成 iOS icon · prompt template + 雙層輪廓警告

用 Midjourney / DALL-E / Stable Diffusion 等 AI image gen 產 iOS app icon 時，模型**默認會給 rounded square 底 + soft drop shadow**（因為 training data 多半是 marketing 用的 icon mockup）。iOS 系統會再套自己的 22.5% radius mask，疊起來變成「框中框」雙層輪廓 —— 在 simulator / 真機上 home screen 看極其詭異。

✅ **正確 prompt（強制 full bleed、square edges）**：
```
iOS app icon, 1024x1024, full bleed square canvas, no background frame,
no rounded corners, no drop shadow, edge-to-edge artwork,
[your concept · 例：minimalist witch hat with star sigil,
parchment cream background #F5EFE4, petrol blue accent #46647C,
flat illustration, 10% inner padding only]
```

✗ **錯誤 prompt（會出雙層輪廓）**：
```
beautiful iOS app icon design, modern, clean, with shadow
```

**落地驗收必做**：
1. 在 Xcode 真機 / simulator 裝上 build → 看 home screen icon
2. 檢查 icon 邊緣有沒有「外圈系統圓角 + 內圈 AI 多畫的圓角」雙層
3. 有就重抽 prompt 或手動 mask 掉 AI 多畫的底框（Figma / Pixelmator 用 alpha mask）

**Light / Dark / Tinted 三 variant 也要分別檢查**，AI 抽出來的 dark 版常會偷加暗色漸層底（同樣會疊出雙層）。

#### 8.3.3 macOS App Icon

macOS 給更多空間玩立體感、陰影、深度（不像 iOS 那麼平）。

尺寸：
```
16, 32, 64, 128, 256, 512, 1024 (各 @1x @2x)
最大 1024×1024 @2x = 2048×2048 master
```

實作：
- macOS 14+ 支援 `Liquid Glass` 風格（多層、可帶陰影投射）
- LazzyMerlin macOS icon **可以**畫圓底 + 厚度陰影（跟 iOS 平面風格不同）
- Source 出 `.icns` 用 `iconutil -c icns`，或直接在 Xcode Assets

LazzyMerlin macOS icon 設計：
- 多層構圖：背景 Petrol 漸層 + 中層巫師帽 + 前景 `✦`
- 模仿 macOS Sequoia 的 multi-plane 美學，但克制（不過度堆疊）

#### 8.3.4 Android Adaptive Icon

Android 8.0+ 用 adaptive icon = 兩層：foreground + background，系統根據 launcher 套不同 mask（圓 / 方 / 圓角方 / squircle）。

尺寸：
- Foreground: 108×108dp（主元素居中於中心 72×72dp 區）
- Background: 108×108dp（全填）

LazzyMerlin Android icon：
- **Foreground**：巫師帽 + 星芒（透明背景）
- **Background**：純 Petrol `#46647C`（dark 切 `#0F1C26`）
- **Monochrome**（Android 13+ themed icons）：純白色 silhouette 版本

#### 8.3.5 PWA / Web App Manifest

跨平台 web app 走 `manifest.json`，提供 `purpose: "any maskable"` 確保 mask 安全：

```json
{
  "icons": [
    { "src": "/icon-192.png", "sizes": "192x192", "type": "image/png", "purpose": "any maskable" },
    { "src": "/icon-512.png", "sizes": "512x512", "type": "image/png", "purpose": "any maskable" },
    { "src": "/icon-monochrome.svg", "sizes": "any", "purpose": "monochrome" }
  ]
}
```

Maskable icon **必留** 20% safe zone（中央 80% 是內容區，外圍 20% 可被裁），跟 iOS 10% 不同。

#### 8.3.6 統一產出建議

新專案需要全套 icon 時，流程：

1. 畫一張 **1024×1024 master**（Petrol + Parchment 配色）
2. 用 [icon.kitchen](https://icon.kitchen) 批量產 iOS / Android / Web 全套
3. macOS / iOS 的 Light / Dark / Tinted 三 variant 手動補
4. 存到專案 `assets/icons/{platform}/` 內
5. README 記錄 source `.fig` / `.sketch` 位置

---

## 九、Character 系統

LazzyMerlin 有 3 個 brand characters。每個都有明確用途：

| Character | 身份 | 使用場合 |
|---|---|---|
| **梅林**（女巫） | 創意 / 決策者 / 品牌主視覺 | Logo、About 頁、IG 貼文 header、OG image |
| **貓貓們**（全虎斑 + 白底虎斑） | 陪伴 / 日常 / 溫度 | About 頁、404 頁、empty state、signature illustrations |
| **威爾**（執行者） | 執行 / AI 實作 | **通常不入畫** — 作為旁白、敘事者、「手」的角色 |

**核心敘事規則：**
- **第三人稱談梅林**：「梅林說要做這個」
- **第一人稱談威爾**：「我用 AI 把她的想法做出來」
- **貓就是貓**：不擬人化、不給台詞，就是在畫面角落陪伴

**避免：**
- 梅林 cosplay 其他魔法師形象（Gandalf / 哈利波特 / Kiki）
- 畫貓時變成卡通擬人
- 把威爾也畫進主視覺（這會破壞「她是魔法師 / 我是實現者」的分工敘事）

---

## 十、命名 / 敘事系統（極簡版）

**原則：能平實就平實，不做系統化翻譯。品牌 tone 靠「邊緣狀態文案」+「簽名句」承載。**

### 10.1 主要 UI 命名 — 維持通用詞彙
```
首頁 / 關於我 / 專案 / 手札 / 聯絡我
Home / About / Projects / Notebook / Contact
```
**不要**把 Projects 翻成 Spells、Login 翻成 Summon。太 LARP、太用力，跟「懶」氣質打架。

### 10.2 品牌簽名元素（全站共用 3 句）

| 位置 | 文案 |
|---|---|
| Footer 固定句 | `Shine, lazily and steadily. ✦` |
| About tagline | `梅林出主意，威爾用 AI 把她的魔法實現出來` |
| Hero 副標 | `把一萬小時的功夫，壓縮成一個下午` |

### 10.3 邊緣狀態文案（冷面笑匠 + 自嘲）

| Scenario | 文案 |
|---|---|
| **404** | 「頁面沒了。可能我當初就沒做出來。」`回首頁 →` |
| **Empty list** | 「這裡還沒寫東西。懶人通常這樣。」 |
| **Empty search** | 「找不到。換個字試試？」 |
| **Loading** | 動畫 `✦ ◈ ❦` 循環，不寫字 |
| **Success toast** | `好了 ✦` |
| **Error** | 「壞了。可能是我沒做對 — 再試試看 ↻」 |
| **Offline** | 「網路斷了。會回來的。」 |
| **Rate limited** | 「點太快了。慢一點 ✦」 |
| **Delete confirm** | 「真的要刪？刪掉就沒了。」 |
| **Coming soon** | 「還沒做完。但會做完的。」 |
| **Form 空欄** | 「填一下這個？」 |
| **Email 格式錯** | 「Email 好像寫錯了。」 |
| **Paywall / locked** | 「這裡需要一把鑰匙。」 |
| **Subscribe success** | 「已經記下你了 ✦」 |
| **Log out** | 「掰。隨時回來 ✦」 |
| **Under construction** | 「施工中 — 但沒很認真 ✦」 |

### 10.4 禁用詞彙
- `Oops!` / `Whoops!` / `Oh no!` — 太美式滑稽
- 「系統錯誤」/「請稍後再試」— 企業官腔
- 「施法」/「咒語」/「魔法」作為 UI 動詞 — RPG cosplay 感
- `emoji` 取代 icon（除了 `✦ ◈ ❦ → ↻` 這類字符）

---

## 十一、Imagery 指南

### 11.1 允許的圖像類型

| 類型 | 規範 |
|---|---|
| **Project 截圖** | 真實 UI 截圖，不加 device mockup frame、不加陰影、圓角 12px、3:2 比例顯示（305×191 縮圖，原始 ≥1200 寬） |
| **Logo 變體** | 主 logo 或 wordmark，不重繪 |
| **SVG icons** | Lucide 系列、stroke 1.5-2px、24×24 viewport、顏色 `currentColor` |
| **手繪插畫（僅限同 logo 畫風）** | 只能是「minimal line + 圓潤 + petrol blue palette」的手繪插畫。梅林 / 貓 的各種衍生可以畫。 |
| **照片（稀用）** | 只用於 About 頁實拍（例如你 / 梅林 / 貓的真實照片）。絕不使用 stock photo。 |
| **Ambient orbs** | Hero 背景的 blur 漸層球（已定義於 SI-3） |

### 11.2 禁止清單
- ❌ Stock photos、stock illustration
- ❌ 非同 logo 畫風的手繪插畫（如 3D 卡通、Memoji 風、Pixel art）
- ❌ AI 生成人物照片 / 場景
- ❌ 3D render、gradient mesh
- ❌ Device mockup frame（iPhone/MacBook 外框裝飾）
- ❌ 裝飾性 pattern（blob、wave、dots）
- ❌ Emoji 代替 icon

### 11.3 OG Image 模板

每個 LazzyMerlin 專案的頁面都該有 OG image（避免分享時變醜）。

**模板檔案**：`preview/og-template.html`

用法：
1. 打開 HTML，即時輸入 kicker / title / subtitle / theme
2. 用截圖工具（CleanShot）選 **1200×630** 區域截圖
3. 儲存為 `/public/og/{project-name}.png`
4. `<head>` 加：
   ```html
   <meta property="og:image" content="/og/{name}.png" />
   <meta property="og:image:width" content="1200" />
   <meta property="og:image:height" content="630" />
   <meta name="twitter:card" content="summary_large_image" />
   ```

**模板結構**：
```
┌────────────────────────────────────┐
│ ✦  威爾的懶人主義 LazzyMerlin      │ ← 左上角 sigil + wordmark
│                                    │
│ ─── FEATURED                       │ ← kicker（small-caps, primary）
│                                    │
│   〈專案標題〉                       │ ← title（霞鶩文楷 96px）
│                                    │
│   (subtitle 一段說明)               │ ← subtitle（Geist 24px）
│                                    │
│ ─────────────────────────── ◈      │
│ LAZZYMERLIN · EST. MMXXVI · URL    │ ← footer（small-caps metadata）
└────────────────────────────────────┘
   + ambient orbs（右上 + 左下）
   + 細緻 grain
```

### 11.4 Favicon 規範
- 用主 logo 縮小，不做簡化版
- 尺寸：16 / 32 / 48（基本）/ 180（apple-touch）/ 512（android）
- 使用 [realfavicongenerator.net](https://realfavicongenerator.net) 批量產出
- Light / Dark 兩版：如果使用同一圖，保留米白底的 logo（本身就適應深色瀏覽器 tab）

### 11.5 Iconography（圖示系統）

§11.1 提了 SVG icons 用 Lucide，這裡是完整規範。**圖示是 UI 第二語言，要跟字體一樣 systematic**。

#### 套件選擇
- **主要**：[Lucide](https://lucide.dev)（fork 自 Feather Icons，社群維護更活躍）
- **fallback / 補充**：[Phosphor Icons](https://phosphoricons.com) — 同樣是 stroke 風，多了 thin/light/regular/bold/fill 五種 weight，需要 fill 版本時用
- **不混用**：選一套用到底，**不要** Lucide + Heroicons + Material Icons 同頁出現
- **iOS 專案例外**：用 SF Symbols（系統內建、跟 SF Pro 對齊）

#### 尺寸 Scale
| Token | px | viewBox | 用途 |
|---|---|---|---|
| `icon-xs` | 12 | 24×24 | 內嵌行內小圖示（如 `↗` 外連結） |
| `icon-sm` | 16 | 24×24 | 表單 prefix / chip 內 / 小型按鈕 |
| `icon-md` | 20 | 24×24 | **預設**、按鈕內、navigation、list item |
| `icon-lg` | 24 | 24×24 | Hero CTA、section icon |
| `icon-xl` | 32 | 24×24 | Empty state、illustration anchor |
| `icon-2xl` | 48 | 24×24 | Feature card 主視覺、404 |

**viewBox 永遠 `0 0 24 24`**（Lucide 預設），縮放透過 `width/height` 改，不改 viewBox。

#### Stroke 規範
- **Stroke width 1.75px**（介於 1.5 跟 2 之間，配合 LXGW 楷體手繪感最和諧）
- **Stroke linecap：round**
- **Stroke linejoin：round**
- 顏色一律 `currentColor`，不寫死 hex（讓 dark mode / hover 自動跟著文字色變）

#### Stroke vs Fill 何時用
- **預設 stroke**：所有 UI icon（navigation、按鈕、表單、metadata）
- **Fill 限定場景**：
  - 「已選中」狀態（filled star vs outline star）
  - Status badge 的同色 dot（success / warning / error）
  - Brand mark / 貓貓頭等 illustration 元素
- **不要混用**：同頁面 nav 用 stroke、按鈕用 fill 會視覺不一致

#### Icon 與文字對齊
- Icon 跟旁邊文字 baseline 對齊，**不是** center 對齊（後者會在小 size 時看起來下沉）
- 標準寫法：`display: inline-flex; align-items: center; gap: 8px;`
- gap 規範：`icon-sm` 配 `gap: 6px`、`icon-md` 配 `gap: 8px`、`icon-lg` 配 `gap: 10px`
- Icon-only 按鈕：square padding（`padding: 10px`），icon 置中

#### 在 Tactile 元件上的 icon
- Icon 顏色跟 Tactile 元件文字色同步（`currentColor` 自動處理）
- Tactile Raised（深底）上 icon stroke 會自動變成 `--bg` 米色，不用手動改
- **Icon 不需要自己的 text-shadow** —— stroke 1.75px 已經夠厚，加 shadow 反而糊

#### Custom Icon 規則
非要自己畫 icon 時：
- 畫在 24×24 viewBox（跟 Lucide 對齊）
- Stroke 1.75px、linecap/linejoin round
- 預留 2px padding，內容畫在 20×20 區域
- 命名：`icon-{kebab-case}.svg`，存在 `assets/icons/`
- 出 SVG 時先 SVGOMG 壓縮、移除 `<title>`、所有 `stroke` 改為 `currentColor`

#### 圖示語意對應
| 場景 | Lucide icon |
|---|---|
| 外連結 | `external-link` 或 `arrow-up-right` |
| 內導航箭頭 | `arrow-right`（hover gap 擴張用） |
| 成功 | `check-circle` |
| 警告 | `alert-triangle` |
| 錯誤 | `x-circle` |
| 資訊 | `info` |
| 重試 | `refresh-cw` |
| 設定 | `settings` |
| 搜尋 | `search` |
| 外觀切換 | `sun` / `moon`（不用 `circle-half`） |

避免：用 emoji 當 icon（除了 §6.1 定義的 unicode glyphs `✦ ◈ ❦ ☾`）。

---

## 十二、反面教材（Anti-patterns）

這些永遠不做：

- 紫色 / 粉色漸層 hero
- 3 欄 icon-in-circle feature grid
- Centered 一切 + uniform spacing
- 全部使用 full 圓角
- Gradient CTA 按鈕
- 通用 stock 產品截圖
- "Built for X" / "Trusted by" 滿版 badge
- 紫粉霓虹色、賽博龐克色
- 純白或純黑底
- Inter / Roboto 作為主字型
- 金色作為 primary brand color
- 多 accent 同時出現（藍 + 金 + 紅）
- 滿屏動態、浮誇 parallax
- 企業官腔文案（「致力於...」「讓您體驗...」）
- UI 詞彙翻成奇幻魔法用語（Spells / Summon / Grimoire）
- AI 生成的場景 / 人物照片
- 梅林 cosplay 其他角色形象

---

## 十三、實作參考

### 13.1 Canonical Preview（材質規範事實依據）
- **`v3/preview-v5-morandi.html`** ⭐ — **§5 材質規範的唯一事實來源**。任何材質視覺有疑義時，以此檔為準（不是 DESIGN.md 文字描述）。
  - 路徑：`~/.gstack/projects/LazzyMerlin/designs/design-system-20260422/v3/preview-v5-morandi.html`

### 13.2 已 deprecated 的 Preview（保留作歷史對照、勿引用）
- `v3/preview.html`、`v3/preview-v4.html` — Tactile 主風格確立前的版本，視覺已過時
- `v3/signatures-preview.html` — 舊 SI-1 Hard Shadow 探索檔
- `v3/sigil-exploration.html` — 早期 logo sigil 探索

> 過去曾有兩份 deprecated preview 在 repo 內（`preview/components-preview-palette-A.html` 三層藍 what-if、`preview/preview.html` v0.1.0 前的早期過渡版），v0.1.2 後刪除——歷史對照改信任 git tag（`git show v0.1.0:<path>` 可取回任一檔案）+ §16 文字描述，避免主 preview 升版時 deprecated 檔案越漂越遠的維護成本。

### 13.3 其他資產
- **品牌 Logo · 2D**：`assets/Lazzy Merlin Logo.png`
- **品牌 Logo · 3D**：`assets/Lazzy Merlin Logo_3D.png`
- **OG Image 模板**：`preview/og-template.html`
- **跨子專案落地 checklist**：[`docs/landing-checklist.md`](docs/landing-checklist.md) —— onboard 新 session Claude 套用 LazzyMerlin DS 到子專案的 step-by-step 流程，含字體載入 / tokens / CSS variables / 元件實作 / 邊緣狀態文案 / 反面教材 / 跟 DS repo 互動規則 / 落地驗收 checklist

### 13.4 參考對標
Paco Coursey (paco.me)、Steven Tey (steventey.com)、Anthropic.com、Rauno Freiberg (rauno.me)

---

## 十四、Accessibility（無障礙）

懶人哲學 ≠ 對使用者懶。**Tactile 視覺再美，鍵盤使用者按 Tab 看不到 focus、低視力使用者讀不懂 Pressed material 上的字、前庭敏感的人被 ambient orbs 暈到 —— 都是 DS 的失敗。**

### 14.1 Focus Ring（鍵盤焦點環）

Tactile 元件最大的隱藏陷阱：浮雕陰影會讓「沒 focus 環」的元件看起來像「有 focus」，導致很多人為了視覺乾淨直接 `outline: none` —— 這是無障礙最嚴重的反面教材。

**規範：所有互動元件必用 `:focus-visible` 補上 ring，鍵盤 Tab 時可見、滑鼠點擊時不顯示。**

```css
/* 共用規則：所有互動元件 reset 預設 outline，改用 focus-visible */
button, a, [role="button"], input, textarea, select, [tabindex] {
  outline: none;
}

button:focus-visible,
a:focus-visible,
[role="button"]:focus-visible,
[tabindex]:focus-visible {
  outline: 2px solid var(--primary);
  outline-offset: 3px;
  border-radius: inherit;  /* 跟著元件 radius 走 */
}

/* Tactile 元件：offset 拉大避開浮雕陰影，避免 ring 跟 shadow 打架 */
.btn-tactile:focus-visible,
.tile-tactile:focus-visible,
.shadow-card:focus-visible {
  outline: 2px solid var(--primary);
  outline-offset: 4px;
}

/* Soft Inset 元件：focus 改 ring 套在元件外圍，不換 inset shadow（避免凹陷感變化干擾） */
.soft-input:focus-visible {
  outline: 2px solid var(--primary);
  outline-offset: 2px;
}

/* Dark mode 提亮，避免 ring 在深底上看不見 */
[data-theme="dark"] :focus-visible {
  outline-color: var(--primary-soft);
}
```

**規則：**
- ❌ **永不**用 `outline: none` 而沒給替代視覺
- ❌ 不用 `box-shadow` 當 focus ring（會跟 Tactile shadow 疊加打架）
- ✅ 用 `:focus-visible`，不要用 `:focus`（後者會在滑鼠點擊後也卡著 ring，很醜）
- ✅ Ring 顏色用 `--primary`（dark mode 自動換 `--primary-soft`）
- ✅ Ring 寬度 2px，offset 3-4px，跟 Tactile 元件 radius 同步

### 14.2 Reduced Motion（前庭安全）

§5.3 ambient layer 的 drift / orb 動畫對前庭敏感者會引發暈眩。所有持續動畫必須包：

```css
@media (prefers-reduced-motion: reduce) {
  /* Ambient drift / spin / scale → 全停 */
  .orb,
  .grain { animation: none !important; }
  .progress { transition: none !important; }
  .spinner,
  .demo-btn::before { animation: none !important; }

  /* translateY 上浮 → 改為純 color/border 變化 */
  *, *::before, *::after {
    transition-duration: 0.01ms !important;
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
  }
}
```

**保留可以的動畫：**
- ✅ Tactile box-shadow 強度變化（shadow 漸變不引發前庭反應）
- ✅ Color / border-color transition
- ✅ Opacity transition（≤ 250ms）

**必停的動畫：**
- ❌ 任何 `translate*`、`scale`、`rotate`
- ❌ `drift` 持續循環
- ❌ Reading progress bar 的 `scaleX` 平滑滾動（改為 `transition: none` 直接跳）
- ❌ Spinner 自轉（loading 狀態改用靜態 `…` 文字或 progress text）

### 14.3 Color Contrast

§2 已聲明 Ink on Surface 與 Primary on Surface 都過 WCAG AA，這裡補 Tactile 場景的細節：

| 場景 | 對比度要求 | 注意事項 |
|---|---|---|
| **Tactile Raised** 上的文字（`--bg` on `--primary`） | ≥ 4.5:1 | Light mode 過、Dark mode `--primary` = `#5E7A8D` 對 `#F5EFE4` 約 4.6:1，剛好 |
| **Tactile Pressed** 上的文字（`--bg` on `--stone`） | ≥ 4.5:1 | `#F5EFE4` 對 `#967459` 約 4.7:1，過 |
| **Tactile Inset** 上的文字（`--ink` on `--bg`） | ≥ 4.5:1 | 跟一般文字同對比，過 |
| **Disabled state** 文字 | ≥ 3:1 | opacity 0.4 後會掉到 ~3:1，邊緣 OK |
| **Hairline border** | 不當文字、不當意義載體 | 它就是裝飾線 |
| **Primary Soft** | **不做文字色** | 已在 §2.3 重申 |

**檢查工具：** Polypane / WebAIM Contrast Checker。每次新增 Tactile 變體（換新底色）都要過一次。

#### Surface / Border 對比度最低標（非文字場景）

文字對比走 WCAG AA（4.5:1 / 3:1）；**非文字** UI 元素（surface 階層、border、icon stroke、focus ring）走 WCAG 2.1 SC 1.4.11 Non-text Contrast（≥ 3:1），但 LazzyMerlin DS 在 surface tier 場景**主動放寬**，靠 Tactile shadow 做 affordance：

| 場景 | 對比度最低標 | 說明 |
|---|---|---|
| **Surface vs Card 階層**（`--bg` vs `--surface-1`） | luminance delta **≥ 1.5%**（light）/ **≥ 5%**（dark）| 對應 §2.2.1 surface tier 規範。Light 偏低、靠 §5.4 Tactile shadow 補階層；Dark 必須有純色亮度差，因 dark mode 下 shadow 視覺 affordance 弱 |
| **Border 在 surface 上**（`--border` 對 `--bg` 或 `--surface-1`） | **可驗證 ≥ 1.5:1** | 走 ARIA「decorative」級別。當 border 是元件**唯一**邊界（無 shadow / 無填色差），對比度需 **≥ 3:1** 過 SC 1.4.11 |
| **Hairline border** | **不限**（裝飾線、不傳達邊界語意） | 同 §6.2 |
| **Focus ring** | **≥ 3:1** | §14.1 已規範，這裡重申 |
| **Icon stroke**（無背景色襯底時） | **≥ 3:1** | 例如 chip 內 icon、button icon |

**判斷流程：** 元件邊界靠 (a) 填色 (b) shadow (c) border 三選一以上區分。如果 **只**靠 border，border 對 surface 對比度必須 ≥ 3:1 過 SC 1.4.11；如果有 (a) 或 (b) 補強，border 退為裝飾、走 ≥ 1.5:1 即可。

**iOS 落地對應：** §7.2 Tactile material iOS 等價方案（v0.2 規劃）會涵蓋 SwiftUI 上 surface tier 的 `.background(.regularMaterial)` / `.shadow()` 與此規範的對照。

### 14.4 不能單靠顏色傳達意義

色盲（特別是紅綠色盲）約 8% 男性。Status 表達必須**同時**有：
- ✅ 顏色 +  ✅ 圖示 +  ✅ 文字
- 例：success state = `check-circle` icon + 綠色 + 「已儲存」文字
- ❌ 只用紅色框標 error、只用綠色 dot 表示 online

### 14.5 Keyboard Navigation

- **所有互動元件可 Tab 到達**：button / link / input / [role="button"] / 自製元件加 `tabindex="0"`
- **Tab order** 跟視覺順序一致（不要靠 `tabindex` 重排，重排成本永遠比重排版高）
- **Skip link**：每頁第一個 focusable 元素是「跳到主內容」，預設 `position: absolute; left: -9999px`，focus 時跳出來
- **Modal / Drawer 開啟時 focus trap**：Tab 不會跳出 modal，Esc 關閉
- **下拉選單 / Menu**：箭頭鍵切換選項、Esc 關閉、Enter 確認
- **Loading state** 用 `aria-busy="true"`，screen reader 才會講「載入中」

### 14.6 Screen Reader / ARIA

最低限度：
- **Icon-only 按鈕** 必加 `aria-label`：`<button aria-label="關閉"><x-icon /></button>`
- **裝飾性圖示** 加 `aria-hidden="true"`：`<svg aria-hidden="true">…</svg>`
- **Toggle / Switch** 用 `aria-pressed` 或 `role="switch" aria-checked`
- **Toast / 即時訊息** 用 `role="status"`（一般訊息）或 `role="alert"`（錯誤），讓 screen reader 自動朗讀
- **Form 欄位** 用 `<label>` 顯式關聯，不只用 `placeholder`（後者 focus 後會消失，screen reader 也讀不到）
- **錯誤訊息** 用 `aria-describedby` 關聯到欄位，並 `aria-invalid="true"`
- **Heading 階層** 不跳級（H1 → H3 中間沒 H2 是壞範例）

### 14.7 觸控目標

行動裝置與 iOS / Android 規範：
- **最小觸控區 44×44px**（Apple HIG）/ **48×48dp**（Material）
- Icon-only 按鈕的 padding 要撐到 44px，不能只看 icon 本身
- 兩個 tap target 之間至少 8px 間距，避免誤觸

### 14.8 Tone 與 Microcopy 的可讀性

§10.4 已禁止「致力於」這類官腔，但無障礙還要再多一條：
- **Empty state、Error state 不要靠 wit 撐**：`「壞了。可能是我沒做對 — 再試試看 ↻」` OK，但**真的壞了**時要附上具體原因（e.g. 「無法連線：請檢查網路」）
- **連結文字描述行為**：避免 `[這裡](url)` / `[點這](url)`，改為 `[查看年度回顧](url)`（screen reader 用戶會用「列出所有連結」功能瀏覽）

### 14.9 各平台 Accessibility hooks

| 平台 | 對應 |
|---|---|
| Web | `prefers-reduced-motion`、`prefers-color-scheme`、`prefers-contrast` |
| iOS | UIAccessibility.isReduceMotionEnabled / preferredContentSizeCategory |
| macOS | NSWorkspace.shared.accessibilityDisplayShouldReduceMotion |
| Notion 模板 | 不適用（Notion 自帶 a11y） |
| IG 素材 | Alt text 必填（IG 後台「進階設定 → 替代文字」） |

---

## 十五、Components

DS 到 §14 為止都是「材料」（顏色、字、間距、材質、a11y）。本章是「家具」—— 用材料組成的具體元件規範。

**原則：每個元件 = Anatomy + Material（指向 §5.7）+ Variants + Sizes + States + Reference。** 避免把 §5 的 box-shadow 全文重抄，所有材質細節指回 §5；本章只規範元件層的決策（structure / variants / spacing / behavior）。

### 15.1 Component 命名與 Token 規約

```
.btn                     ← block
.btn--primary            ← variant
.btn--sm                 ← size
.btn[disabled]           ← state（用屬性 selector，不寫 class）
.btn .btn__icon          ← element
```

- 用 BEM-like，`block__element--modifier`，避免 `btn-primary-large-rounded` 這種堆疊命名
- State 一律用屬性（`disabled`、`aria-pressed`、`data-state="loading"`），**不**用 `.btn--disabled` class —— 因為 a11y 屬性本身就是狀態
- React / Vue 元件 props 跟 class 對齊：`<Button variant="primary" size="sm" />` ↔ `.btn.btn--primary.btn--sm`

### 15.2 Buttons

LazzyMerlin 最常用的元件。Material 跟著用途走，**不要**根據顏色決定 variant（例如「我想要紅色按鈕」不是設計決策，「這是 destructive 操作」才是）。

#### 15.2.1 Variants × Material

| Variant | 用途 | Material（§5.7） | Background | Text |
|---|---|---|---|---|
| **Primary** | 頁面主 CTA、表單送出 | Tactile Raised | `--primary` | `--bg` |
| **Secondary** | 次要動作、cancel、輔助 CTA | Hybrid | `--bg` | `--ink` |
| **Tertiary / Ghost** | 工具列、低調操作、列表內 inline action | 純文字 + color hover | transparent | `--ink-muted` → `--primary` (hover) |
| **Destructive** | 刪除、登出、不可逆操作 | Tactile Raised | semantic Error `#A84F3F` / dark `#D68F7A` | `--bg` |
| **Brand Deep** | 限定 hero、品牌強調，一頁不超過 1 個 | Tactile Raised | `--primary-deep` | `--bg` |

**一頁規則：** Primary 至多 1 個。Secondary 多個 OK。Destructive 不跟 Primary 並排（避免誤點），通常放在 modal 確認步驟內。

#### 15.2.2 Sizes

| Size | Padding | Font | Radius | Min height（觸控） |
|---|---|---|---|---|
| **sm** | `8px 14px` | 13px / 500 | `radius-md 10px` | 32px（密集列表內，**不**用於主 CTA） |
| **md** | `12px 22px` | 14px / 500 | `radius-lg 12px` | 44px（**預設**） |
| **lg** | `14px 28px` | 16px / 500 | `radius-lg 16px` | 52px（hero CTA、行銷頁） |

> sm 不到 §14.7 的 44px 觸控目標，僅用於 desktop 密集 UI。Mobile 預設 md。

#### 15.2.3 Anatomy（含 icon）

```html
<button class="btn btn--primary btn--md">
  <svg class="btn__icon" aria-hidden="true">…</svg>
  <span class="btn__label">送出</span>
  <svg class="btn__icon btn__icon--trailing" aria-hidden="true">…</svg>
</button>
```

- Icon 與 label 的 gap 跟 §11.5.4 一致（md 用 8px）
- Icon-only button：square padding（`padding: 12px`），加 `aria-label`
- Loading state：替換 leading icon 為 spinner（§5.8），label 保留但 `color-mix(ink 60%, transparent)`

#### 15.2.4 Button Group

- 多按鈕橫排：`gap: 12px`（md）
- Split button（主鈕 + dropdown）：兩者相連，中間 `1px` hairline 分隔
- Icon-only button 群組：`gap: 4px`，視為 toolbar

### 15.3 Form Elements

#### 15.3.1 Form Field（共用 anatomy）

任何輸入欄位（input / textarea / select / checkbox group）都用同一套 anatomy：

```
┌─────────────────────────────────┐
│ Label *                          │ ← required 加 `*`
│ ┌─────────────────────────────┐ │
│ │ Input / Textarea / ...      │ │ ← Material: Soft Inset
│ └─────────────────────────────┘ │
│ Helper text 或 Error message     │ ← 互斥，error 優先
└─────────────────────────────────┘
```

- **Label** 永遠在欄位上方（不左右排列，避免 RWD 斷行錯亂）
- **Helper text** 14px、`--ink-muted`、`margin-top: 6px`
- **Error message** 14px、Error 色（`#A84F3F` / dark `#D68F7A`）、配 `alert-circle` icon
- **Required indicator** 用 `*` 不用「(必填)」
- Label 用 `<label for="">` 顯式關聯（§14.6）

#### 15.3.2 Input / Textarea

- **Material：Soft Inset**（§5.6）
- Padding：`14px 20px`（md）/ `10px 16px`（sm）
- Radius：`16px`（md，配 Soft Inset 軟墊感）
- Focus：保留 inset shadow + 加 `:focus-visible` ring（§14.1）
- **Placeholder 不取代 label**（§14.6），placeholder 只放範例（如 `name@example.com`）
- Textarea：`min-height: 96px`，`resize: vertical`（不允許橫向 resize）

#### 15.3.3 Checkbox / Radio

```
☐ Unchecked → Soft Inset (small square 18×18, radius 5px)
☑ Checked   → Tactile Pressed + check icon
```

- 自製 SVG mark，不用瀏覽器預設 checkbox（後者無法套 Tactile）
- Mark icon 12×12，stroke 2px，`--bg` 色
- Radio 同 logic，`border-radius: 50%`
- Disabled：opacity 0.4、cursor not-allowed
- Click target ≥ 24×24（連 label 一起算 ≥ 44×44，§14.7）

#### 15.3.4 Switch / Slider

完整規格已在 §5.6，本節不重抄。**選用情境：**
- Switch：用於「立即生效」的二元狀態（深淺色切換、通知開關）。「需要 save 才生效」改用 Checkbox。
- Slider：用於連續區間選擇（音量、亮度、價格範圍）。離散選項不用 slider。

#### 15.3.5 Select / Dropdown

兩種實作策略：

| 場景 | 用什麼 |
|---|---|
| 簡單 ≤ 10 選項、無搜尋 | 原生 `<select>` + 客製樣式（樣式有限但 a11y / mobile 自動處理） |
| 需要搜尋 / 多選 / 自訂選項樣式 | 自製 Combobox（trigger looks like Soft Inset input + popover menu） |

自製 Combobox 必須：
- `role="combobox"`、`aria-expanded`、`aria-controls`
- 鍵盤導航：箭頭上下切換、Enter 確認、Esc 關閉、首字母 jump
- Popover menu 用 §15.6.3 規範

#### 15.3.6 Form Layout

- 欄位間距：`24px`（md）/ `16px`（緊湊表單）
- Section 分組：用 `<fieldset>` + `<legend>`（H4 樣式），group 之間 `48px`
- 送出按鈕：靠左對齊（不置中），跟 hero 對齊原則一致（§4.3）
- Cancel + Submit 並排時：Cancel 在左（Secondary）、Submit 在右（Primary）—— 跟 macOS 慣例一致

#### 15.3.7 Validation Pattern（驗證行為）

**驗證時機：** 沒選對時機 = 表單體驗最大破口。LazzyMerlin 的標準：

| 觸發點 | 該驗證什麼 | 不該驗證什麼 |
|---|---|---|
| **on input（敲鍵當下）** | 從錯誤態變回正確（user 在修） | 不要當下亮紅 —— user 還沒打完 |
| **on blur（離開欄位）** | 該欄位的格式 / 必填 | 不要驗整張表單 |
| **on submit（按送出）** | 整張表單所有欄位 | — |

換句話說：**「越打越紅」是地獄體驗。錯誤訊息只在 blur 或 submit 時亮，user 開始修時要立即清掉。**

```
First blur with invalid value  → show error
While typing to fix            → clear error
Re-blur, still invalid         → show error again
Re-blur, now valid             → show success indicator (optional)
```

#### 15.3.8 Error 顯示策略

| 策略 | 何時用 |
|---|---|
| **Inline error**（欄位下方） | 單欄錯誤、可立即修正（格式錯、必填漏） |
| **Summary error**（表單頂部 Alert） | 多欄錯誤、伺服器返回的整體錯誤、跨欄位驗證失敗 |
| **Inline + Summary（並用）** | 長表單（≥ 8 欄位）的 submit 錯誤 —— 頂部 Alert 列出「3 個欄位需修正」並 anchor link 到第一個錯誤 |

Inline error 規範（§15.3.1 已定義 anatomy，這裡補行為）：
- Error 訊息 + `alert-circle` icon 同色
- 欄位本身 box-shadow 可加紅調 inset 強化（不換 background color）
- 訊息要**具體**：`「Email 格式錯誤」` 不夠 → `「請含 @ 符號，例：name@example.com」` 才夠
- 不要寫「無效輸入」/「Invalid」這類 robot 語

Summary error 用 §15.7.1 Alert（Error variant），第一行寫「請修正以下 X 個欄位」，下面 `<ul>` 列出錯誤欄位 + 該欄位 anchor。

#### 15.3.9 Success State

**多數情況不需要 success indicator**（user 看到表單消失、跳到下一頁就知道成功了）。需要的場景：

- **Inline 即時儲存** —— 編輯個資、settings：用 `check` icon + `已儲存` 文字 fade in 後 2 秒消失
- **Async 驗證通過**（如 username 可用）：欄位右側 `check-circle` icon、`--success` 色
- **Submit 後留在原頁**：用 §15.6.6 Toast，**不**用 inline alert（inline 會跟下一次填寫的欄位打架）

**禁止：** 整片綠色 banner 寫「成功！」（太誇張、太美式）。LazzyMerlin 走 §10.3 冷面笑匠 tone，成功訊息用 `好了 ✦` 配 toast 即可。

#### 15.3.10 Async / Loading 期間的表單

按下 Submit 後：
- 整張表單 `aria-busy="true"`，所有欄位 `disabled`
- Submit 按鈕進入 loading state（§5.8）—— 文字保留、加 spinner、`disabled`
- Cancel 按鈕**保持可用**（讓 user 可以中止）
- Loading > 3 秒未回應：在 button 旁加文字 `處理中…`
- Loading > 10 秒：顯示「比預期久一點，再等一下 ✦」

### 15.4 Cards

#### 15.4.1 Variants

| Variant | Material | 用途 |
|---|---|---|
| **Editorial Card** | Tactile Base | 文章 tile、Hero feature card、長文摘錄 |
| **Stat Card** | Tactile Base 或 Hybrid（同頁統一） | Dashboard 數值卡片 |
| **Link Tile** | Tactile Base | 列表內每一項，hover 上浮 |
| **Plain Card** | Hybrid | 列表 / 表格內輕量容器 |

#### 15.4.2 Anatomy

```
┌──────────────────────────────┐
│ [Optional kicker / tag]      │ ← Geist Mono small-caps
│ Title                        │ ← LXGW WenKai 22px
│ Body / description           │ ← Geist Body 14px, ink-muted
│                              │
│ [Optional meta · footer]     │ ← Geist Mono 11px
└──────────────────────────────┘
```

- Padding：`24-28px`（Tactile 不能小，撐不起浮雕）
- Title 跟 Body 之間 `12-16px`
- Body 跟 footer 之間 `16-20px`
- Card 之間（grid）`gap: 24px`

#### 15.4.3 Hover 行為

- Editorial / Link Tile：套 §5.4 / §5.8 Tactile hover（translateY -3px + shadow 放大）
- Stat Card：靜態（不 hover），點擊整片才用 hover
- Plain Card：套 Hybrid hover

### 15.5 Chip / Tag / Badge

三者外觀近似，**用途不同**：

| 元件 | 用途 | 互動 |
|---|---|---|
| **Chip** | 篩選器、可選標籤 | 可點擊切換 selected |
| **Tag** | 文章 / 內容分類，純展示 | 通常不可點，或點擊跳到 tag 列表 |
| **Badge** | 狀態指示器（new / 數字計數 / online dot） | 不可點，依附在其他元件上 |

#### 15.5.1 Chip / Tag 樣式

- **Material：Tactile-Raised 縮減版**（2026-04-25 二度修訂）—— 跟 button 同套配方但強度等比例縮小：
  - 對角微暗化 `linear-gradient 135deg`（左上微亮、右下加深）
  - 雙層 inset rim（頂緣 highlight `rgba(255,255,255,0.35)` / 底緣 shadow `rgba(15,28,38,0.18)` / 整圈細邊 `rgba(15,28,38,0.06)`）
  - 三層 drop shadow（近 `1px 2px / blur 3` → 中 `3px 5px / blur 8` → 遠 `6px 10px / blur 16`，比 button 弱一階）
  - Noise overlay（`::after + z-index: -1` pattern，§15.5.3）
  - Text-shadow 配合底色：深底用 `0 1px 0 rgba(0,0,0,0.25)` / 淺底用 `0 1px 0 rgba(255,255,255,0.4)`
- Padding：`6px 14px`
- Radius：`radius-full`（pill）
- Font：Geist Mono 11px、letter-spacing 0.1em、uppercase
- Variants：
  - `chip--primary`：bg `--primary`、text `--bg`
  - `chip--soft`：bg `--primary-soft`、text `--bg`（**只做輕量 tint / hover bg / selected bg**，不建議當主 fill —— 跟 `chip--primary` 並排視覺差異被 noise 壓縮，難分辨）
  - `chip--stone`：bg `--stone`、text `--bg`
  - `chip--muted`：bg `--bg-muted`、text `--ink`
- Selected state（Chip only）：套 Tactile Pressed inset shadow（**override** raised box-shadow）
- Hover：`translateY(-2px)`，drop shadow 不另放大（chip 本身已小）

**並排 chip 用色原則：避免兩藍同框**
多個 chip 並排時（如 filter chip group / status chip 序列），**不要把 `chip--primary` 跟 `chip--soft` 同時放出來** —— 三層藍 `#334D5C / #46647C / #5E7A8D` 在 wood palette 的 narrow blue range 內本來就靠近（明度差約 10%），加 Tactile + noise 後視覺擠壓會難分辨。

並排序列建議用「藍 + 棕 + 綠」三 hue 交錯：
- `chip--primary`（藍）+ `chip--stone`（棕）+ inline earth-green sage（綠）+ `chip--muted`（米）
- 識別性最高，每個 chip 一眼可辨

需要表達 emphasis 階級（重要 → 次要）的場景才用 primary → primary-soft 漸層，但**不要超過兩階出現在同個視野**。

#### 15.5.2 Badge

- **Number badge**：`min-width: 18px; height: 18px; border-radius: 9999px;` 純色 fill + 白字 + Tactile-Raised 縮減版（兩層 drop shadow `1px 1px / blur 2` + `2px 3px / blur 5`，inset rim 比 chip 更細）
- **Dot badge**（online indicator）：`6×6` 或 `8×8` 圓 + 2px 邊框（用 surface 色當 ring）。**不加 Tactile shadow / noise** —— 太小（< 10px）紋理會看起來像髒污、shadow 會跟外圈 ring 打架
- 依附位置：`position: absolute; top: -4px; right: -4px`（依附在 avatar / icon button 角落）

#### 15.5.2.1 Avatar Tactile 配方

Avatar 是圓形不是 pill，球體感比 chip 更需要 inset rim 雕刻：
- 對角 linear gradient 用 `135deg, white 0.08 → 0 → black 0.22`（比 chip 強一點）
- Inset rim **加粗到 `2px`**（chip 是 `1px`），更撐起球體感
- Drop shadow 三層比 chip 強：`2px 3px / 5` + `5px 7px / 12` + `12px 16px / 22`
- Text-shadow `0 1px 0 rgba(0,0,0,0.30)`（首字母看起來像浮雕字）
- **Avatar Stack**（多個 avatar 重疊）：把 ring（`box-shadow: 0 0 0 3px var(--bg)`）**整合進 box-shadow list**，不能只設 ring，否則會 override 掉 Tactile shadow：

```css
.avatar-stack > .avatar {
  margin-left: -10px;
  box-shadow:
    0 0 0 3px var(--bg),                              /* ring 第一層 */
    inset 0 2px 1px rgba(255, 255, 255, 0.32),        /* inset rim highlight */
    inset 0 -2px 1px rgba(0, 0, 0, 0.30),             /* inset rim shadow */
    inset 0 0 0 1px rgba(0, 0, 0, 0.10),              /* 細邊 */
    2px 3px 5px rgba(15, 28, 38, 0.20),               /* drop 近 */
    5px 7px 12px rgba(15, 28, 38, 0.18);              /* drop 中 */
}
```

#### 15.5.2.2 為什麼 chip / badge / avatar 也要立體感

§15.5 第一輪規範寫「不加 shadow」，把 chip / badge / avatar 視為純平面元件。實際落地時跟 button 對比視覺斷層 —— 元件高低不一致看起來不像同一塊木頭做的。2026-04-25 二度修訂：**所有純色填色元件都套 Tactile-Raised 縮減版**，按元件大小縮減 shadow 強度。例外仍是 Dot badge（< 10px）跟 Tooltip / Skeleton 等不適用浮雕的場景。

#### 15.5.4 底色 × 字色 / text-shadow 配對規則（**全 component 通用**）

加了 Tactile + noise 後，底色跟字色的搭配比純平面更敏感 —— 中藍底配深字會看起來像「字被染黑」。**本規則 v0.2.0-rc.3 起 generalize 為全 component 通用**（不限 chip / avatar），涵蓋 Button / Chip / Badge / Avatar / Toast / Modal action / 任何 Tactile 彩色填色 fill。

| 底色等級 | 字色 | text-shadow（raised letter）|
|---|---|---|
| **深底**（primary, primary-deep, stone, earth-red, earth-green, earth-ochre） | `var(--ink-on-brand)` 米色 | `0 1px 0 rgba(0, 0, 0, 0.30)` 黑色 |
| **中底**（primary-soft 中藍） | `var(--ink-on-brand)` 米色 | `0 1px 0 rgba(0, 0, 0, 0.25)` 黑色 |
| **淺底**（bg-muted Tan） | `var(--ink)` 深 | `0 1px 0 rgba(255, 255, 255, 0.4)` 白色 |
| **page surface**（bg / bg-raised 米色 light / Midnight Petrol dark）— 一般文字 | `var(--ink)` 跟著 mode 翻轉 | 視 Tactile 強度、可省略 |

**關鍵：`--ink-on-brand` ≠ `--bg`**

`--ink-on-brand` **永遠是 Parchment `#F5EFE4`**（light + dark 都一樣、不翻轉）；`--bg` 是 page surface、會跟著 mode 翻轉（light Parchment / dark Midnight Petrol）。彩色底用 `--ink-on-brand` 確保跨 mode 對比度都過 WCAG AA Large（≥3:1），避免 dark mode 下 Mid Petrol 配 Midnight Petrol 字（3.4:1 邊緣）或 Deep Petrol 配 Midnight Petrol 字（**1.7:1 不過 AA**）的問題。詳見 §2.2.1。

**例外：chip 預設變體（無 modifier）**
chip default 走淺底（`bg-muted` Tan）規則：深字 + 白 text-shadow。

**例外：button ghost / secondary（hairline / 透明底）**
無 fill 的 button（`.btn--ghost` / `.btn--secondary`）走 page surface 規則：`var(--ink-muted)` 或 `var(--ink)` 深字，hover 時轉 `var(--primary)` 藍色。

#### 15.5.5 currentColor 在 color rule 內的踩坑警告

不要寫：
```css
/* ❌ 不要這樣 */
.btn[data-state="loading"] {
  color: color-mix(in srgb, currentColor 75%, transparent);
}
```

CSS 為了避免循環解析，當 `color` rule 自己內部出現 `currentColor` 時，**會從 parent inherited 取**，不是 element 當前的 color。如果你期望「降低 button variant 的 fg 色透明度」，會誤抓到 body 的 ink 色變成深字。

正解兩種：
1. **顯式指定 fg token** 取代 currentColor：
   ```css
   .btn--primary[data-state="loading"] {
     color: color-mix(in srgb, var(--bg) 75%, transparent);
   }
   ```
2. **不弱化 color**，靠其他 affordance 表達 state（推薦）：
   ```css
   .btn[data-state="loading"] {
     text-shadow: none;
     pointer-events: none;
     cursor: not-allowed;
   }
   ```
   Spinner（§15.8）已足夠 indicate loading，不需要再弱化文字 — 反而避免 alpha mix 出來的字色跟其他按鈕不一致。

`currentColor` 在 **非 color property**（border / box-shadow / fill / stroke / text-shadow）內**不會踩此坑** —— 那邊取的是 element 自己的 color。所以 `border: 2px solid currentColor` 在 ::before spinner 上仍 work。

#### 15.5.3 Noise overlay 套用原則（跨 §15）

LazzyMerlin 的 Tactile 觸感是**全域語言**，不限 Tactile-Raised button / Card / Modal 大型元件。Chip / Badge / Avatar / Switch ON track / Slider fill 這些**純色填色區塊**也套同款雙層 turbulence noise，讓所有元件「看起來是同一塊木頭做的」。

**正解：`::after` 偽元素 + `z-index: -1` + `isolation: isolate`**

```css
:root {
  --noise-bg:
    url("data:image/svg+xml,...feTurbulence baseFrequency='2.2' seed='5'..."),
    url("data:image/svg+xml,...feTurbulence baseFrequency='1.4 0.5' seed='9'...");
  --noise-bg-size: 90px 90px, 220px 220px;
}

.your-element {
  background-color: var(--your-color);
  position: relative;
  isolation: isolate;
  overflow: hidden;
}
.your-element::after {
  content: '';
  position: absolute; inset: 0;
  z-index: -1;                              /* 推到 background 之上、內容之下 */
  border-radius: inherit;
  background-image: var(--noise-bg);
  background-size: var(--noise-bg-size);
  mix-blend-mode: overlay;
  opacity: 0.55;                            /* 控制強度，不要 100% */
  pointer-events: none;
}
[data-theme="dark"] .your-element::after {
  mix-blend-mode: soft-light;
  opacity: 0.75;
}
```

**為什麼 `z-index: -1` + `isolation: isolate`？**
SVG turbulence 的 noise 是「黑色像素 + alpha」（為了讓 overlay blend 產生紋理感）。如果 noise 直接 paint 在元件最上層，會用 overlay 公式 blend 元件內所有 pixel —— **包括文字**，導致：
1. 純色填色區塊整體變暗（black overlay color = 加深）
2. 文字被 noise 染成深色

`isolation: isolate` 讓元件成為獨立 stacking context，`z-index: -1` 把 ::after 推到 stacking 最底層（仍在 background-color 之上），這樣 noise 只跟 background 互動，不會碰到文字 / icon / thumb。

**`::after` 已被佔用時用 `::before`**（如 Switch 的 thumb 是 `::after`）：
```css
.switch[aria-checked="true"]::before { /* noise */ }
.switch::after { z-index: 1; /* thumb 浮上 */ }
```
此時 noise `::before` 不需要 `z-index: -1`，自然 paint order 已在 background 之上、normal-flow `::after` 之下；但 `::after` 要加 `position: relative; z-index: 1` 確保 pop 上來（因為 positioned `::before` 預設會 paint 在 non-positioned `::after` 之上）。

**反面教材：不要用 `background-blend-mode`**
```css
/* ❌ 這個寫法看似簡潔但會踩兩個坑 */
.your-element {
  background-color: var(--your-color);
  background-image: var(--noise-bg);
  background-blend-mode: overlay;   /* 100% 強度，無法用 opacity 壓低 */
}
```
1. **強度不可控**：`background-blend-mode` 沒有對應的 opacity，noise 是 100% 強度。黑色 noise overlay 純色 = 整體變很暗（chip 變黑、avatar 變黑）
2. **HTML inline style 會 reset**：`style="background: var(--xxx)"` 是 shorthand，會 reset 掉 `background-image`，noise 失效

對 background-blend-mode 路徑改用 ::after 後，HTML inline style 用 `background: ...` shorthand 也安全（因為 noise 在 ::after 不在 element 自己）。

**例外：不加 noise 的元件**
- ❌ 任何 < 10px 的填色（dot badge、tiny indicator）—— 紋理像髒污
- ❌ 純文字按鈕 / 純文字 link —— 沒材質這層
- ❌ Tooltip 簡化版（§15.6.1 已聲明）—— 會讓提示太雜
- ❌ Skeleton placeholder —— 它就是要看起來「沒內容」

### 15.6 Overlays

所有 overlay 走 §4.4 z-index scale，由低到高：tooltip < popover < dropdown < modal < drawer < toast。

#### 15.6.1 Tooltip

- **用途**：短 hint（≤ 1 行），不含互動
- **Material**：Tactile Base 簡化版（單層 drop shadow + radius 8px，**不**加 noise overlay，太雜）
- Padding：`8px 12px`
- Font：13px / 400
- Trigger：hover 0.4s 後出現 / focus 立即出現
- Caret（箭頭）：6×6 旋轉方塊，跟 tooltip 同色
- z-index：`var(--z-tooltip)`（最上層）
- ARIA：`role="tooltip"`，trigger 加 `aria-describedby`

#### 15.6.2 Popover

跟 Tooltip 區別：**含互動內容**（按鈕、表單、列表）。

- **Material**：Tactile Base（完整版，含 noise）
- Padding：`16px`
- Min-width：`240px`、max-width：`400px`
- Radius：`radius-lg 12px`
- Caret：可選（trigger 旁邊用、自由位置不用）
- Trigger：click（不用 hover，避免誤觸）
- 關閉：點 backdrop / 按 Esc / 再次點 trigger

#### 15.6.3 Dropdown Menu

特殊的 popover，內容為「可選列表」。

- 結構：`<ul>` + `<li role="menuitem">`
- Item 樣式：`padding: 10px 14px`、hover `background: var(--bg-muted)`
- Separator：`hairline` 細線
- Item 含 icon：左 icon（icon-sm）、右 chevron / shortcut
- 鍵盤：箭頭上下、Enter、Esc、首字母 jump
- ARIA：`role="menu"`、active item `aria-current="true"`

#### 15.6.4 Modal / Dialog

- **Backdrop**：`background: rgba(15, 28, 38, 0.55)` + `backdrop-filter: blur(4px)`
- **Dialog 本體**：Tactile Base，置中（垂直可偏上 40%，比純置中順眼）
- Max-width：`520px`（小型）/ `720px`（含 form）/ `90vw`（行動）
- Padding：`32px`
- Anatomy：

  ```
  ┌──────────────────────────────┐
  │  Title (LXGW 24px)           │
  │  Description / body          │
  │                              │
  │  [Cancel]  [Confirm Primary] │
  └──────────────────────────────┘
  ```

- 關閉：點 backdrop / Esc / 右上 close icon button
- **Focus trap**（§14.5）：Tab 不跳出 modal
- z-index：`var(--z-modal)`
- 進場：fade-in 250ms（reduced-motion 直接顯示）

#### 15.6.5 Drawer

從邊緣滑入的 modal 變體，適合長表單 / detail panel。

- 從右側或左側滑入（行動裝置從底部）
- Width：`min(480px, 90vw)`（側邊）/ `90vh`（底部）
- Material：Tactile Base
- 邊緣（靠主畫面那一側）保留 hairline border
- 關閉：點 backdrop / Esc / drag 關閉（行動裝置）
- z-index：`var(--z-modal)`

#### 15.6.6 Toast / Snackbar

短暫訊息提示，自動消失。

- **Material**：Tactile Base（簡化、shadow 弱化）
- Position：右下（desktop）/ 底部置中（行動）
- Padding：`12px 16px`
- 含 leading icon（依語意：check / alert / info / x）+ 文字 + 可選 close
- 自動消失：4 秒（success）/ 6 秒（error，給時間讀）/ 永久（含 action button 時）
- Stack：新 toast 從底部冒出，舊的往上推；同時最多 3 個，超過就 queue
- z-index：`var(--z-toast)`
- ARIA：`role="status"`（一般）/ `role="alert"`（錯誤）

### 15.7 Feedback

#### 15.7.1 Alert / Banner（inline，非 toast）

**用途：** 永久顯示的狀態訊息，用戶必須看到（非自動消失）。

- 結構：leading icon + title + description + optional action / dismiss
- Material：Tactile Base 但 background 換成語意色的 5% 混合
  - Info：`color-mix(in srgb, var(--primary) 8%, var(--bg))`
  - Success / Warning / Error 同邏輯
- Border-left：4px 該語意色實心，作為強烈視覺 anchor
- Padding：`16px 20px`
- Dismissable：右上 `x` icon button

#### 15.7.2 Progress Indicator

兩種：

- **Linear progress**：3px 高，背景 hairline、填充 `--primary`，有兩種模式：
  - Determinate（已知百分比）：`scaleX` 平滑前進
  - Indeterminate（未知）：固定一段往返移動（reduced-motion 改為脈動 opacity）
- **Circular spinner**：12-24px，§5.8 已定義（border-top primary、`spin 700ms linear`）

頁面層 reading progress（§5.3 A-1）走專屬 token（fixed top, z-progress）。

#### 15.7.3 Skeleton

**規則：** 用 hairline 色長條 + slow pulse animation，**不用** shimmer 漸變掃光（§5.8 已禁）。

```css
.skeleton {
  background: var(--hairline);
  border-radius: 6px;
  animation: skeleton-pulse 1.4s ease-in-out infinite;
}
@keyframes skeleton-pulse {
  0%, 100% { opacity: 0.4; }
  50% { opacity: 0.7; }
}
```

形狀：
- 文字行：高 `1em`，寬度隨機 60-90%
- 標題：高 1.4em
- Avatar：圓形配 size
- Card：完整 card 形狀的 outline，內部塞文字 / 標題 skeleton

Reduced-motion：`animation: none; opacity: 0.5;` 靜態顯示。

### 15.8 Navigation

#### 15.8.1 Tabs

- Style：**Underline tabs**（不用 pill tabs，pill 太「軟體 SaaS」）
- Active：底部 2px `--primary` 線條
- Inactive：`--ink-muted`
- Hover：`--ink`
- 切換 transition：250ms color
- Mobile：橫向 scrollable，不折行

#### 15.8.2 Breadcrumb

- Separator：用 `·` midline dot 或 `→`，不用 `/`（太工程感）
- Last item（current page）：`--ink`、不可點
- Other items：`--ink-muted` → `--primary` (hover)
- ARIA：`aria-label="Breadcrumb"`、current 加 `aria-current="page"`

#### 15.8.3 Pagination

- Number-based：`< 1 2 [3] 4 5 ... 12 >`
- **Page button 統一 `36×36px` 方形 + `padding: 0` + `justify-content: center`** —— 確保所有 button 同尺寸、文字精確置中
- Inactive page 用 Tertiary（Ghost）樣式（無 background）
- **Active page：Tactile Pressed**（不用 Raised）—— Raised 的 4 層 drop shadow 視覺中心會偏右下，造成數字看起來偏左上；且 Raised 在 list 內顯得太重。Pressed inset shadow 表達「被選中」，跟 §15.5.1 chip-selected 同邏輯：
  ```css
  .pagination .btn--primary {
    background-color: var(--primary);
    background-image: none;       /* 取消 Tactile-Raised 的 linear gradient */
    box-shadow:
      inset 3px 4px 8px rgba(0, 0, 0, 0.30),
      inset -1px -1px 4px rgba(255, 255, 255, 0.18),
      inset 0 0 0 1px rgba(0, 0, 0, 0.15);
  }
  ```
- 純文字 prev/next（不用「Previous」/「Next」全字）：用 `←` / `→` icon

#### 15.8.4 Avatar

- Size scale：xs 24 / sm 32 / md 40 / lg 56 / xl 80
- 形狀：圓形（`radius-full`）、不用方形
- Fallback：純色背景 + 大寫姓名首字母（Geist 500、`--bg` 色文字）
- Fallback 背景色從 palette 取（不是隨機色）：以 user id hash 對應 **`--primary` 藍 / `--stone` 棕 / `--earth-green` sage 綠** 三 hue 循環（不再用 primary-soft，避免跟 primary 視覺擠壓）
- Status badge：右下 dot badge（§15.5.2）

**為什麼 fallback 改 sage 不用 primary-soft：**
原本三色循環是 `--primary / --stone / --primary-soft`，三色靠近 wood palette 的 narrow blue range 跟 stone 棕，加 Tactile + noise 後 primary 跟 primary-soft 兩藍視覺擠壓難分辨（特別是 avatar stack 重疊時）。改用「藍 + 棕 + 綠」三 hue → 任兩個並排都色相不同，識別性最高。

借用 `--earth-green`（status palette）為 avatar fill 是 dual use —— avatar fallback 的色不傳達 status 語意（user 不會把「綠 avatar」誤解成「線上 / 成功」狀態），借色 OK。需要更多色循環時可再借 `--earth-ochre` 補一階。

### 15.9 Data Display

#### 15.9.1 Table

- Border：行間用 `hairline`，**不**加垂直分隔線（垂直線太雜）
- Header：`background: transparent`、`border-bottom: 1px solid var(--ink) / 30%`、Geist Mono 11px small-caps
- Cell padding：`12px 16px`
- 數字欄：`font-variant-numeric: tabular-nums; text-align: right`
- Hover row：`background: var(--bg-muted) / 50%`
- Sortable header：加 `↕` icon，active 換 `↑` / `↓`
- Mobile：橫向 scrollable，第一欄 sticky 不動

#### 15.9.2 List

簡單 vertical stack，跟 Table 區別在「無欄位對齊需求」。

- Item padding：`16px 0`
- 分隔：`hairline` 細線
- Hover（如可點擊）：`background: var(--bg-muted) / 30%`、整行可點
- Item 內可含 avatar / title / meta / trailing icon

### 15.10 State Layouts（Empty / Loading / Error / 404）

§10.3 已定義文案，本節補**視覺 layout**。所有狀態頁共用 anatomy：

```
┌─────────────────────────────────┐
│                                 │
│         [Visual element]        │ ← icon / unicode glyph / illustration
│                                 │
│         Title (LXGW 24-32px)    │
│         Description (Body)       │
│                                 │
│         [Action button]         │ ← optional
│                                 │
└─────────────────────────────────┘
   左對齊（跟 §4.3 hero 對齊原則一致）
   max-width: 480px
   vertical padding: 96-128px（給空間呼吸）
```

**禁止：** 整片置中、巨型卡通插畫、emoji 大字。LazzyMerlin 走克制路線。

#### 15.10.1 Empty State

**用途：** 列表為空、搜尋無結果、新建專案前的初始狀態。

| 場景 | Visual element | 文案來源 |
|---|---|---|
| 列表為空 | `✦` 大字（48px、`--ink-muted`） | §10.3「這裡還沒寫東西。懶人通常這樣。」 |
| 搜尋無結果 | `search` icon-2xl + 細線描邊圓 | §10.3「找不到。換個字試試？」 |
| 新建初始 | 主 logo 縮放版 + 引導文案 | 自訂 |
| Filter 過濾後空 | `filter-x` icon | 「條件太嚴。鬆一點？」+ 重設按鈕 |

Visual element 統一規範：
- 純色 / hairline 描邊，**不**用 stock illustration
- 放在 title 上方 `24-32px` 距離
- icon 顏色 `--ink-muted`（不要強調色搶 visual）

#### 15.10.2 Loading State（頁面 / 區塊層級）

跟 §15.7.2 Progress、§15.7.3 Skeleton、§5.8 spinner 都不同 —— 這是「**整頁** / **整區塊** 還在 fetch」時的 layout。

優先序：

1. **Skeleton 優先**（§15.7.3）：知道 UI 結構時用，user 一看就知道在 load 什麼
2. **Centered spinner + 文字**：不知道結構或 < 1 秒會回的場景

Centered spinner layout：
- Spinner 24px（§5.8）+ 下方 `Geist Mono 12px small-caps` 標籤
- 標籤文案：`LOADING ✦`、`正在準備…`、絕不寫「請稍候」
- 整體 `min-height: 320px` 置中

**Loading 持續 > 8 秒**：附帶可選文案「比預期久一點，再等一下」（§15.3.10 表單版本同邏輯）

#### 15.10.3 Error State（頁面層級）

用於 5xx / network error / unexpected exception 等**非用戶操作**造成的錯誤。

- Visual：`alert-triangle` icon-2xl，色 `--ink-muted`（**不**用 Error 紅，避免太刺激；錯誤本身已經是壞消息）
- Title：「壞了。」（§10.3 tone）
- Description：具體原因 +「再試試看 ↻」
- Action：Primary 按鈕「重試」+ Secondary「回首頁」並排
- 角落：可選 `--ink-muted` 小字 error code（給開發者 debug 用）

#### 15.10.4 404 / 410 / 403

四種「找不到 / 沒權限」狀態的視覺區分：

| Status | Visual | 文案 |
|---|---|---|
| **404** Not Found | `✦` 飄移 ambient（單顆 orb）+ 大字 `404` LXGW 88px | 「頁面沒了。可能我當初就沒做出來。」 |
| **410** Gone（曾存在） | hairline 描邊空框 | 「這頁以前在，現在沒了。」 |
| **403** Forbidden | 鎖頭 `lock` icon-2xl | 「這裡需要一把鑰匙。」（§10.3） |
| **500** Server Error | `alert-triangle` | 同 §15.10.3 |

404 頁特殊規則：
- **保留** ambient orbs（A-2）但簡化成單顆，避免 404 看起來太繁華
- **去掉** reading progress bar（A-1）——「沒內容能 progress」
- **保留** theme toggle 與 footer 簽名

#### 15.10.5 Maintenance / Coming Soon

施工中、即將推出狀態的視覺：

- Visual：`✦ ◈ ❦` 三個 unicode glyph 並排（§5.8 spinner 不適合，因為這是長期狀態）
- Title：「施工中 — 但沒很認真 ✦」 / 「還沒做完。但會做完的。」（§10.3）
- 可選：訂閱 email 表單（§15.3）讓 user 留聯絡方式

---

### 15.11 元件實作順序建議

新專案落地時不需要一次寫完所有元件。**最低可用集合（MVP）：**

1. Button（Primary / Secondary / Ghost）
2. Input / Textarea
3. Card（Editorial）
4. Chip / Tag
5. Toast
6. Modal

剩下的按需擴充。**順序原則**：先寫 hero / landing 用得到的（Button / Card / Tag），再寫 form 用得到的（Input / Select / Checkbox），最後才是 navigation / data display（Tabs / Table / Pagination）。

---

## 十六、Decisions Log

| Date | Decision | Rationale |
|---|---|---|
| 2026-04-22 | 建立初版 DS | 為跨 Web/iOS/macOS/Notion/Chrome ext/IG/Game 的一人公司多專案建立品牌核心 DS + 平台套用指南 |
| 2026-04-22 | Light/Dark palette 完全對齊現有個人網站（shadcn oklab）| 使用者兩次明確表示「原本網站配色比較好看」—— DS 應該從現實出發而非重新發明。現有配色已經協調，僅需制度化 |
| 2026-04-22 | 魔法感不靠顏色，靠字體與裝飾承載 | 試過深空金字（Sandy Clay 古書金字）方向，使用者最終還是回到 shadcn 冷藍系。結論：用「霞鶩文楷 + unicode + 羅馬數字」三個手工感元素帶出魔法氛圍 |
| 2026-04-22 | Display 統一用霞鶩文楷，砍掉 Cormorant Garamond | 使用者回饋字體太多（原本 5 family）。楷體本身英文字母也有手繪感，砍掉 serif 可減少視覺複雜度，統整為 3 family（LXGW + Geist + Noto Sans TC，加 Geist Mono 做 label）|
| 2026-04-22 | Palette 精簡到 4 個 role（Surface / Ink / Primary / Stone） | 不做紅色系、不做金色、不做綠色。一個 brand accent 就夠 |
| 2026-04-22 | Dark mode 底色 `#070D14` Deep Ink，不用 Onyx / Ink Black / Deep Space 這些「六色 palette」的變體 | 直接沿用現有網站 dark mode 的 `--background` token，保持視覺一致性 |
| 2026-04-23 | Signature Interactions 4 組全部歸納（Hard Shadow / Progress Bar / Ambient Orbs / Halo）| 從使用者現有網站（/projects）抓出的 fingerprint，不是憑空設計。Document 它們讓跨專案能複用 |
| 2026-04-23 | 邊緣狀態文案走「冷面笑匠 + 自嘲」tone | Signature 元件不新增（現有 Hard Shadow 已足夠辨識度）。改用文案承載品牌個性 |
| 2026-04-23 | 加入 Imagery 指南 + OG template HTML | 原本 DS 缺 OG image 規範，會讓分享到 IG/FB 變醜。給一個可複用 HTML 模板 |
| 2026-04-23 | **重要**：品牌重新定位為「二人（+雙貓）實驗室」 | 使用者提供 logo 後揭露 LazzyMerlin 的 `Merlin` 是其老婆名字諧音。品牌是：梅林（創意）+ 威爾（執行）+ 雙貓 + AI 的組合，不是單人 |
| 2026-04-23 | Tone 加入「冷面笑匠 + 水瓶座機鋒」層 | 梅林本人是水瓶座冷面笑匠，外硬內軟的機鋒感才是真實的品牌 voice。不走溫柔童話也不走嚴肅編輯，走機鋒自嘲 |
| 2026-04-23 | 加入 Character 系統（梅林 / 貓 / 威爾） | 威爾不入主視覺（他是執行者/旁白），梅林是 brand face，貓是陪伴 character |
| 2026-04-23 | Logo 直接使用，不做 simplified sigil | 使用者偏好直接縮小。32×32 favicon 可能失真但使用者接受此 tradeoff |
| 2026-04-24 | 短暫加入莫蘭迪 Accent palette 後撤除 | 曾一度加入 4 色莫蘭迪作為 secondary tier，但實際套用後視覺失焦。使用者反省「原本太貪心」，決定收斂成純暖調 6 色 palette + 1 淺藍 tint |
| 2026-04-24 | Palette 整體替換為木質暖調 6 色（Coolors）| 使用者提供 Coolors 色盤 `334C5C / F5EFE4 / DCC8AF / 97735A / 413029 / 221A18`。Surface/Ink/Primary/Stone 全部重新對應，方向從「shadcn oklab 冷中性」轉向「木質書房暖調 + Petrol 冷 accent」。Dark mode Primary 提亮到 `#6B94AD` 以符合 WCAG AA |
| 2026-04-24 | 新增 Primary Soft `#B0C4D4` 作為淺藍 tint token | Deep Petrol `#334C5C` 太暗無法做 info bg / hover tint / illustration 亮調，在 light mode 會讓藍色出場太少。新增 Soft 變體，只做 tint 不做內容，保證 light mode 仍有足夠的藍色能見度 |
| 2026-04-24 | Petrol 藍升級成雙色系（`#46647C` + `#5E7A8D`），palette 微調 6 → 7 色 | 原本 Primary Soft `#B0C4D4` 太 pastel 不好看。改採雙藍結構：深藍 Primary + 中藍 Soft，兩模式直接互換角色，不需 derive。同時 Stone → `#967459`、Ink → `#211715`、Surface Muted → `#DECCA7` 微調飽和度 |
| 2026-04-24 | 加入 Primary Deep `#334D5C`，palette 7 → 8 色 | 既有的中藍 + 中深藍兩層不夠支撐品牌強調場景（hero、logo 底、深色 mood）。新增最深藍作為第三層。Dark mode 對比不足 AA，僅限裝飾 / 填色，不當文字。同時校正 Ink Muted `#413029` → `#4E3029` 與官方 palette 對齊 |
| 2026-04-24 | Midnight Petrol `#0F1C26` 替換 `#211715` Warm Black，palette 維持 8 色 | 使用者要求 dark mode 以藍色為主，最初解讀為「新增」第 9 色，實為「替換」。Midnight Petrol 一色同扛 Light Ink ↔ Dark Surface 的互換，Warm Black 從 palette 移除。結果：整個 DS 連 light mode 的文字都帶藍調，品牌藍錨深入到文字層 |
| 2026-04-24 | `bg-raised` 與 `bg-muted` 全部改用 palette 內色 | 先前 `bg-raised` 與 dark `bg-muted` 使用 derived 色不在 palette 裡。改為：Light/Dark `bg-raised = bg`（depth 由 Tactile 陰影創造）、Light `bg-muted = #DECCA7`、Dark `bg-muted = #4E3029`。所有 surface 色都從 8 色 palette 取，無 derived |
| 2026-04-24 | **全 DS 主風格統一為 Tactile**（取代 Hybrid）| 使用者選定 Tactile 材質感為 DS 主風格。Hybrid（editorial 輕薄 + 硬陰影混合版）廢棄，所有卡片 / 按鈕 / 開關 / 滑桿 / 輸入框 / theme toggle / 狀態系統統一改用 Tactile 四態材質（Base / Raised / Inset / Pressed）。深度靠雙層陰影 + 邊緣雕刻 + noise overlay，不用 border line。§5 系列規範需要後續大改重寫 |
| 2026-04-24 | Hybrid Shadow System（合體招牌）統一 SI-1 + SI-5 | 原本 Hard Shadow 與 Soft Neumorphic 並存不混用。使用者要求合併成單一風格：rounded-rect 形狀 + hairline 線框 + 雙層浮雕陰影（靜態小、hover 放大）+ translateY 上浮 + border 轉 Primary。一套打遍 CTA / 卡片 / 控制元件 |
| 2026-04-24 | 完整定義 Interactive State System（default/hover/pressed/loading/disabled）| 原本 §5.3 只定義 hover。補完五態規範，基於 Hybrid Shadow 語言擴展，避免跨專案時各自實作出不一致的 pressed/disabled |
| 2026-04-25 | §5 全節重寫 · 對齊 `preview-v5-morandi.html` | 04-24 已決定主風格改 Tactile，但 §5 文字仍是舊的 SI-1 Hard Shadow + Soft Neumorphic 並存版，跟實作不一致。重寫後規範三層 register：**Tactile**（主招牌、CTA / 卡片 / Tile，配方 = 對角光源 + 雙層 inset rim + 多層 drop shadow + noise overlay）、**Hybrid**（輕量替代、線框 + soft shadow + 上浮）、**Soft Inset**（input / switch / slider 觸感）。原 SI-1 ~ SI-4 重新分類：SI-1 deprecated 改 Tactile、SI-2/3/4 改名 A-1/A-2/A-3 ambient layer 獨立。新增 reduced-motion hook、Tactile 配套參數（overflow / radius / padding / text-shadow）、5.7 元件→Material 對照表、5.9 材質層反面教材。視覺零變動，文字追上事實。 |
| 2026-04-25 | 鎖定 `preview-v5-morandi.html` 為 §5 材質規範的唯一事實依據 | v3 資料夾長期累積 preview / preview-v4 / signatures-preview / sigil-exploration / preview-v5-morandi 五個檔案並存，跨專案落地時不知道該看哪個。明訂 v5-morandi 為 canonical，其他四個保留作歷史對照。文字描述與 preview 衝突時以 preview 為準。 |
| 2026-04-25 | §4.4 新增 Z-index Scale | 跨專案會有 progress / modal / toast / tooltip 同層出現的場景，缺了共通 token 各專案自己亂寫會打架（toast 被 modal 蓋住、tooltip 被 grain 蓋住）。明訂 base / ambient / grain / content / sticky / overlay / progress / modal / toast / tooltip / debug 十一階。 |
| 2026-04-25 | §11.5 補完 Iconography 完整規範 | 原本只在 §11.1 寫一行 Lucide stroke 1.5-2px，跨專案落地時各自決定 size scale、stroke / fill 切換、與文字對齊策略。明訂主套件 Lucide（fallback Phosphor）、6 階 size scale、stroke 1.75px（配 LXGW 楷體）、icon 跟 baseline 對齊、Tactile 元件上 icon 不加 text-shadow 等細節。 |
| 2026-04-25 | §14 新增 Accessibility 章節 | DS 原本只在 §2.3 提了 WCAG AA 對比度，缺 focus ring / reduced motion / ARIA / 觸控目標等規範。Tactile 主風格特別容易誘導工程師 `outline: none`（因為浮雕陰影看起來就像 focus），必須明訂 `:focus-visible` ring 規範避開這個陷阱。同時補 reduced motion hook（ambient orbs 對前庭敏感者會引發暈眩）、不能單靠顏色傳達意義、icon-only 按鈕 aria-label、Tab order 等基本 a11y 規則。 |
| 2026-04-25 | §15 新增 Components 章節 | DS 原本只有 tokens 跟 motion / 材質，沒有具體元件規範，導致每個專案落地時自己造輪子（同樣的 Button 在稷下、聽了以後、Sortless 各有寫法）。本章定義 10 大類元件（Button / Form / Card / Chip / Overlay / Feedback / Navigation / Data Display）的 anatomy + variants + sizes + states，避免重複造輪子。**重點原則**：每個元件指向 §5.7 Material 對照表決定材質，避免 §5 box-shadow 細節在本章重抄；變體（variant）跟著「用途」而非「顏色」；最後給 MVP 元件清單（Button / Input / Card / Chip / Toast / Modal）作為新專案落地的最低可用集。 |
| 2026-04-25 | §15.3.7-10 補完 Form Pattern 行為規範 | §15.3 原本只寫 anatomy，缺驗證時機 / error 顯示 / success state / async loading 等行為決策。明訂「越打越紅」是地獄體驗（驗證觸發改用 blur + submit、on input 只清錯不亮錯）、Inline vs Summary error 何時用、Success 多數場景不需要 indicator（避免美式「成功！」banner）、Submit loading > 8 秒附帶體諒文案。 |
| 2026-04-25 | §15.10 新增 State Layouts（Empty / Loading / 404 / Error） | §10.3 已有文案規範，但缺視覺 layout。明訂共用 anatomy（左對齊、max-width 480px、上下 96-128px padding）、Empty 視覺用 `✦` glyph 不用 stock illustration、Error 用 `--ink-muted` 不用 Error 紅（錯誤本身已壞消息、不要更刺激）、404 簡化 ambient（單顆 orb）、施工中用 `✦ ◈ ❦` 三 glyph 並排。 |
| 2026-04-25 | §2.4 新增 Theme Switch 規範 | DS 原本只在 §7.1 一句帶過 `prefers-color-scheme + 手動 toggle`。本節補完三件事：**初始判定優先序**（localStorage > 系統偏好 > 預設 light，`<head>` inline 執行避 FOUC）、**Toggle 元件規範**（fixed 右上、顯示「切換到」目標而非當前模式）、**過渡動畫**（只動 body 的 `bg/color` 400ms ease，**不**動 `*`、**不**動 `box-shadow` 避免 Tactile shadow 閃爍）、reduced-motion 下瞬變反而更舒服。 |
| 2026-04-25 | §8.3 新增 App Icon 家族規範 | §8.2 原本只列「favicon / app icon = 主 logo 直接縮小」，但 iOS / macOS / Android 對 app icon 有強硬規範，照「直接縮 favicon」會被 store 拒。本節補：iOS 不畫圓底（系統會 mask）+ 10% padding + Light / Dark / Tinted 三 variant；macOS 可用立體多層 Liquid Glass 美學；Android adaptive icon 兩層（foreground + background）+ monochrome themed；PWA maskable 留 20% safe zone。產出流程：1024×1024 master → icon.kitchen 批量 → 手動補 macOS Tinted。 |
| 2026-04-25 | §2.2 重寫 · 嚴格 8 色 palette、status 不引入新 hex | §2.2 原本偷渡了 `#4A7A5F` 綠 / `#B8863A` 黃 / `#A84F3F` 紅作為 success / warning / error，跟 §2.1 Decisions Log（2026-04-24）「**不做紅色系、不做金色、不做綠色**」直接矛盾。從 components-preview 落地時被使用者抓出（「只會有八個顏色，為什麼還會出現紅色？」）。修法：semantic token 全部 alias 到 8 色 palette 內 —— Info / Success → `--primary` 藍、Warning / Error / Destructive → `--stone` 咖啡。Severity 不靠色相區分，靠 icon + 文案 tone（success = 「好了 ✦」；error = 「壞了。」）+ border 粗細 + 背景透明度承擔。哲學：跟 LazzyMerlin 「冷面笑匠 / 反美式紅綠燈情緒對比 / 克制」tone 一致 —— 「壞了」用咖啡比刺眼紅更耐看。dark mode 不需要重寫 token，`var()` 動態 resolve 跟著 `--primary` / `--stone` 自動切。 |
| 2026-04-25 | components-preview 取消 Tactile button 的左上 radial 高光 | 使用者觀察到元件左上方那塊聚光燈式亮斑（`radial-gradient at 22% 18%`）太搶。取消第一層 radial、保留第二層 `linear-gradient 135deg` 的對角微暗化（讓右下還是比左上暗一點點，跟 drop shadow 方向一致）。Inset rim「頂緣 + 左緣」細白邊**保留** —— 那是邊緣雕刻、屬於 Tactile 材質本身的特徵，去掉就變成純色塊。 |
| 2026-04-25 | §2.2 二度修正 · 加入 Earth Tone Status Extension（terracotta / sage / ochre） | 上午剛把 status alias 全改成 8 色 palette（success / info → primary、warning / error → stone）後，使用者反映「紅綠還是要加回來，但要大地色系不能太鮮豔，融入現有配色」。修法：補 3 色 Earth Tone Extension（`#9E5949` Terracotta / `#6A7A60` Sage / `#8E6E37` Burnt Ochre，dark mode 提亮版），定位為 **Status-only Extension** 不擴 Brand Core 8 色。Semantic 重新映射：Success → Sage、Warning → Ochre、Error / Destructive → Terracotta、Info 保持 Primary。三色都跟 wood palette 同 saturation 量級（跟 Stone 同調），對比度全過 WCAG AA。跟 §2.1「不做紅綠金」決策的關係：那條針對 Brand Accent（hero / CTA），Status Extension 是另一層級，兩條決策並行不衝突。 |
| 2026-04-25 | components-preview Switch 加 button reset、所有 material button 觸感統一 | Switch 元件用 `<button>` HTML，但 CSS 沒 reset user-agent border / appearance，導致 default border 把 thumb 推出 track 邊界（使用者觀察到「歪歪的」）。修法：`border: none; appearance: none; -webkit-appearance: none; display: block; font: inherit;` 完整 normalize。同步把 Secondary button 加進 noise overlay 共用 selector group，讓所有 material button（Primary / Secondary / Deep / Destructive）觸感統一 —— 形態仍維持 Hybrid 跟 Tactile-Raised 的 fill / border / shadow 差異。Loading state spinner 從 `position: absolute + padding-left` 改成 inline flex item（border 用 `currentColor` + transparent top，每個 variant 上都自動有對比），文字回到置中。 |
| 2026-04-25 | §15.5 修訂 · Chip / Badge / Avatar 加 noise，Tactile 觸感升格為全域語言 | 使用者觀察到 §15.5 的 Chip / Badge / Avatar 跟 Switch ON track / Slider fill 沒紋理，跟 button 觸感不一致。原本 §5.7 對照表只把 noise 配給 Tactile-Raised / Card / Modal 等大型元件，純色 fill 的 chip / badge / avatar 排除在外。本次修訂：**Tactile 觸感升格為全域語言**，所有純色填色區塊（chip / badge / avatar / switch ON / slider fill）都套同款雙層 turbulence noise，讓所有元件「看起來是同一塊木頭做的」。實作方式：把 noise 抽成 `--noise-bg / --noise-bg-size / --noise-bg-blend` 三個 CSS variable token，dark mode 改 blend mode 為 soft-light。例外：< 10px 的填色（dot badge）不加（紋理會像髒污）、純文字按鈕 / Tooltip / Skeleton 不加。同時規範 HTML inline style 必須用 `background-color: ...` 不能用 shorthand `background: ...`（後者會 reset 掉 background-image 讓 noise 失效）。順帶修 loading state 字色（透明度 60% → 75% + cancel text-shadow，避免 Tactile 黑描邊在透明字下「描」出字）。 |
| 2026-04-25 | §15.5.3 Noise 實作從 `background-blend-mode` 改 `::after` + `z-index: -1` + `isolation` | 上一筆用 `background-blend-mode: overlay` 套 noise 後使用者觀察到「顏色都變很深」（chip 變黑、avatar 變黑、switch / slider 變深）+「處理中字仍是黑色」。根因：SVG turbulence noise 是「黑色像素 + alpha」，blend mode 是 100% 強度時黑色 overlay = 純加深底色。同時 button noise `::after` 用 `mix-blend-mode: overlay` 蓋整個 button（含文字），而「處理中」是純 text node 沒被 `> *` selector 抓到 z-index: 1，所以文字被黑 noise 染深。**統一修法**：所有 noise 改用 `::after`（或 `::before` 當 `::after` 已佔用，如 switch thumb）+ `z-index: -1` + `isolation: isolate`，讓 noise 永遠在 background 之上、所有內容之下；同時 `mix-blend-mode + opacity` 控制強度（取代不可控的 `background-blend-mode`）。優點：純色填色不會被染深、文字 / icon / thumb 自動浮上、HTML inline `background:` shorthand 不再會 reset 掉 noise（noise 在 ::after 不在 element 自己）。§15.5.3 規範重寫附完整 CSS pattern + 為什麼不用 background-blend-mode 的反面教材。 |
| 2026-04-25 | §15.5 二度修訂 · Chip / Badge / Avatar 套 Tactile-Raised 縮減版 | 加了 noise 之後使用者觀察到「跟按鈕的立體感不一樣」—— chip / badge / avatar 只有 noise 紋理，沒有 button 那套完整 Tactile-Raised 配方（對角 linear gradient + inset rim 雙層雕刻 + 多層 drop shadow + text-shadow），整體仍是平面元件。本次補完缺的三件，按元件大小**等比縮減 shadow 強度**：chip 用 1px inset rim + 三層 drop shadow（最遠 6px 10px）、badge 更小（兩層 drop shadow，最遠 2px 3px）、avatar 圓形強化用 2px inset rim 撐起球體感 + 三層 drop shadow。Avatar Stack 把 ring 整合進 box-shadow list（單獨設 ring 會 override 掉 Tactile shadow）。Dot badge 仍排除（< 10px 紋理像髒污 + shadow 跟外圈 ring 打架）。Selected chip 仍 override 為 Tactile Pressed（凹陷感）。 |
| 2026-04-25 | §15.5.4 底色 × 字色配對統一 · primary-soft 配米色字（不再配深字） | 加了 Tactile + noise 後使用者觀察到「Chip / Avatar / Table chip / List avatar 中藍底字看起來都是黑色」。根因：原本 `chip--soft` 跟 inline `primary-soft` avatar 用 `color: var(--ink)` 走「中底配深字反差」設計，但加了 Tactile material 的 inset rim + 對角 gradient + noise overlay 後視覺被擠壓，深字看起來像「被染黑」。修法：**所有彩色底（深 + 中）一律配米色字 + 黑 text-shadow**，只有淺底（bg-muted Tan）才配深字 + 白 text-shadow。`primary-soft` 對 `var(--bg)` 米色對比 ~4.0:1 過 AA Large，加 text-shadow 描邊補強可讀性。dark mode 同步處理，移除 inline `color: var(--ink)`。 |
| 2026-04-25 | §15.5.5 / §15.8 補 `currentColor` cycle 踩坑警告 + Loading state 簡化 | 使用者觀察到「處理中」字仍是黑色。根因：CSS spec 為避免循環解析，當 `color` rule 自己含 `currentColor` 時會從 parent inherited 取（不是 element 當前 color）。我寫 `.btn[data-state="loading"] { color: color-mix(currentColor 75%, transparent) }`，currentColor 從 body inherit `var(--ink)` 深色 → mix 出深色 alpha 0.75 字。第一次修法用 variant-specific override (`var(--bg)` for primary 等) 解決 cycle，但 alpha 0.75 在藍底上 blend 出來的色仍偏暗、跟其他按鈕純米色字不一致。**最終修法：不弱化 color，靠 spinner + `text-shadow: none + pointer-events: none + cursor: not-allowed` 表達 loading**（Stripe / Linear 也是這做法）—— 文字保持滿色跟其他按鈕完全一致。§15.5.5 補完整警告 + 兩種正解 pattern。 |
| 2026-04-25 | 三層藍識別性問題 · §15.5.1 並排原則 + §15.8.4 Avatar fallback 改 sage | 使用者觀察到三層藍 `#334D5C / #46647C / #5E7A8D` 加 Tactile + noise 後視覺擠壓難分辨（特別是 chip variants 兩藍並排、avatar stack 重疊）。根因是 wood palette 的 narrow blue range 內三層藍明度差只 8-10%，加 noise 染色後縮到 < 5%。考慮過動 palette hex（治本）但破壞 light/dark mode 互換對稱、影響整個 LazzyMerlin DS。**選不動 palette、改用法**：(1) §15.5.1 補「並排 chip 用色原則」—— 不要 chip--primary + chip--soft 兩藍同框，建議用「藍 + 棕 + 綠」三 hue 交錯；`chip--soft` token 退回 §2.3 原規則「只做 tint / hover bg」，不當主 fill。(2) §15.8.4 Avatar fallback 三色循環從 `primary / stone / primary-soft` 改成 `primary / stone / earth-green`（藍 + 棕 + 綠 三 hue 循環），借用 status palette earth-green 作 avatar fill —— avatar fallback 不傳達 status 語意，dual use OK。components-preview 中 SPELL chip / BETA chip / 三處 avatar 都改用 inline earth-green 套用。 |
| 2026-04-25 | 對照 Palette Variant A 後最終確認走 B | 為了讓使用者比較動 palette（A）vs 改用法（B）兩個方向的視覺效果，建立 `components-preview-palette-A.html` what-if 對照版：拉開三色明度（primary-deep `#2A3F4D` / primary `#46647C` / primary-soft `#7088A0`），保留 SPELL/BETA chip 跟 avatar 用 primary-soft 看識別性。對照結果：A 版 primary-soft 對 surface 對比僅 ~2.85:1（不過 AA Normal）、三色仍是同 hue「藍家族」感，且動 palette 影響整個 LazzyMerlin DS（個人網站 / 跨專案需重新校色）。最終確認走 **方向 B（不動 palette、avatar fallback 改用 sage 三 hue 循環、`chip--soft` 退回 tint role）**。A 版檔案保留 §13.2 作決策歷史對照，加 DEPRECATED banner 提示不再維護。 |
| 2026-04-26 | v0.1.0 release · 結構化 tokens + README + CHANGELOG + git tag | DS 從 markdown + HTML preview 升級成可被工具消費的 source of truth：(1) `tokens/` 目錄 5 檔（color / typography / dimension / shadow / motion）採 W3C Design Tokens 草案格式（`$value` / `$type` / `$description`），相容 Figma Tokens Studio + Style Dictionary。(2) `README.md` repo landing 給未來合作者 / AI 助理 / 自己看（包含快速開始 / 設計理念 / 反面教材 / 子專案位置）。(3) `CHANGELOG.md` 採 keep-a-changelog 格式，v0.1.0 從 §16 整理出 Added 清單 + 精選決策。(4) §17 Versioning 規範：semver 規則、Decisions Log vs CHANGELOG 分工、breaking change 政策、git tag 格式。(5) `git tag v0.1.0` 標記初始 stable release，子專案可 pin 版本。 |
| 2026-04-27 | v0.1.1 patch · 移除規範文件中的具名子專案引用 | DS 應該是 brand-level 的純規範，不該耦合具體子專案。子專案會更替、開源 / 對外分享時也不該強迫他人理解這些專案。修法：(1) 規範文件（DESIGN.md §7.7 / §11.3 / §13.3 / §17.6 + README.md）改用抽象敘述（「子專案」/「個人網站」/「遊戲類專案」）。(2) Demo HTML（components-preview / palette-A / preview / og-template）改 fictional placeholder（「範例 · 一」/「專案 A」），保留 typography 視覺溫度但不指名。(3) §16 本身的歷史條目**不動**（paper trail 跟 git log 同性質，改寫破壞 immutability）。(4) `CLAUDE.md` 仍保留具名（repo 內個人 working instructions，非 DS proper）。順帶修正 §13.3 logo 檔名（`lazzymerlin-logo.png` → `Lazzy Merlin Logo.png` + `Lazzy Merlin Logo_3D.png`）+ 移除「個人網站作配色 source of truth」過時條目。 |
| 2026-04-27 | v0.1.1 fix · `.progress-linear__bar` 補 noise overlay | 使用者觀察到「專案進度」progress bar fill 沒紋理但「音量」slider fill 有。根因：v0.1.0 整理「Tactile 觸感升格為全域語言」時改了 `.slider__fill` 加 `::after + z-index: -1` noise，但漏改 `.progress-linear__bar`（兩者結構幾乎相同，都是純色 fill 上 noise）。本次補完：兩個 preview 檔案的 `.progress-linear__bar` 加 isolation + overflow + ::after noise overlay。觸感現在跟 slider / chip / avatar / badge / button 全部統一。 |
| 2026-04-27 | Pagination active 從 Raised 改 Pressed · §15.8.3 補完整規範 | 使用者觀察到 pagination active 的「3」數字看起來沒置中。根因兩層：(1) 視覺：`.btn--primary` Tactile-Raised 的 4 層 drop shadow 全部往右下方延伸，造成「視覺感受的 button 中心」偏右下，相對地數字被推到左上感。(2) 規範：原本規範說「active = Tactile Pressed」但實作用了 `.btn--primary`（= Raised），active 在 list 內顯得太重、跟 ghost button (1/2/4/5) 大小視覺差太多，破壞 pagination「同階一排」的節奏感。修法：(1) `.pagination .btn` 統一 `36×36 + padding: 0 + justify-content: center`，所有 page button 同尺寸文字精確置中。(2) `.pagination .btn--primary` override 為 Pressed inset shadow（取消 raised 的 linear gradient + 4 層 drop shadow），跟 §15.5.1 chip-selected 用 Pressed override 同邏輯。§15.8.3 規範補完整 CSS pattern 跟 rationale。 |
| 2026-04-27 | 新增 `docs/landing-checklist.md` · 跨子專案落地 onboarding | 為了把 LazzyMerlin DS 套用到第一個子專案（個人網站 lazzywill），需要 cross-session hand-off：當前 session 對 DS 全熟，但 deploy 該在子專案 repo 內做（避免 DS repo 耦合具體產品）。修法：建 `docs/landing-checklist.md` 作為跨子專案重用的 onboarding doc，分 Phase 0~8（環境確認 / 字體 / tokens / CSS variables / Tactile material / 元件 MVP / Theme switch / Ambient layer / 邊緣狀態文案）+ 反面教材 12 條 + 跟 DS repo 互動規則（gap report 流程、升版同步流程）+ 落地驗收 checklist 9 項。第 0 段直接是「給新 session Claude 的 quick onboard prompt」可 paste 用。同時是 §17.6 v1.0 條件第 3 項「跨平台落地 QA Checklist」初步版本。DESIGN.md §13.3 加 reference 指向新 doc。未來其他子專案落地（iOS / macOS / Notion 等）走同一份 doc 的不同 phase。 |
| 2026-04-27 | Repo visibility · PRIVATE → PUBLIC + dual licensing | 把 hand-off doc URL 貼到新 session 後 Claude 回傳 404，根因：repo 是 private，`raw.githubusercontent.com` 是 anonymous public CDN，不接受 auth header，所以 private repo 的 raw URL 永遠 404。修法：執行 `gh repo edit --visibility public` 把 repo 改 public。配套更新 README License section 為 dual licensing：(1) Spec / Tokens / Preview / Docs 走 CC BY 4.0 精神（開放參考、需 attribution）。(2) Brand identity（logo / character / 品牌名 / 邊緣狀態文案具體 wording）保留所有權，不可商用 / 挪用 / 二次創作。「寫 LazzyMerlin DS 的目的是把 brand 規範開放給未來合作者 / 跨專案落地 / 給 AI 工具當設計 reference」跟「保護 brand identity」可以並存。Public 後 raw URL / GitHub link / Tokens Studio sync 都不需 auth 直接用。 |
| 2026-04-28 | **§17.6 v1.0 第 1 條達成** · 個人網站 lazzywill 完整落地 + Phase 1 Next.js 補強回流 | 第一個子專案落地：個人網站 lazzywill（Next.js 13+ App Router + shadcn/ui + Cloudflare Workers）。落地驗收 checklist 10 項全綠：字體載入 / Light + Dark mode / reduced motion / focus ring（shadcn cva 內建 `focus-visible:ring`）/ AA 對比 / 沒引入新 hex / 反面教材 9 條全沒踩 / 邊緣狀態文案套 §10.3 / Footer 簽名 / production build 成功。子專案 pin v0.1.1。**回流補強**：Phase 1 字體載入規範補 Next.js 框架專用建議 —— Next.js 場景必走 `next/font/google` 而非 CDN `<link>`，理由：SSR preload 防 FOUT/FOIT、build 時自動 self-host 不依賴 fonts.googleapis.com 線上、自動 subset（中文從 ~10MB 降到 ~200KB）、`size-adjust` 防 layout shift。LXGW WenKai TC 不在 Google Fonts ESM API，須走 `next/font/local` + 下載到 `public/fonts/`。其他 framework（純 HTML / Vite / Astro）保留 CDN link 路徑。**子專案 shadcn alias 命名差異不算 DS gap**（subproject 層面 alias bridge 即可）。 |
| 2026-04-28 | v0.1.2 release · 第一次「子專案落地驅動」的 patch release | LazzyMerlin DS 第一次因為實際子專案落地觸發的 release，自然的 milestone：(1) **§17.6 v1.0 第 1 條 ✓** 個人網站 lazzywill 落地驗證（驗收 10 項全綠、子專案 pin v0.1.1）。(2) **第 3 條 ✓** `docs/landing-checklist.md` 跨子專案 onboarding doc（Phase 0~8 + 反面教材 + 落地驗收 checklist + 給新 session Claude 的 quick onboard prompt）。(3) **Repo PRIVATE → PUBLIC + dual licensing**（spec / code CC BY 4.0 精神、brand identity 保留所有權）—— 起因 raw URL anonymous CDN 在 private repo 永遠 404，順勢把 brand 規範對外開放。(4) **Pagination active 從 Raised 改 Pressed**（§15.8.3 補完整規範 + button 統一 36×36）。(5) **3D logo 壓縮 8.4MB → 4.2MB**（半張保真度、git clone / Tokens Studio sync 都更輕）。(6) **Phase 1 字體載入** Next.js 規範補強（由 lazzywill 落地實測回流）。本 patch 不含 token 結構變更，§17.6 第 2 條（Token 結構穩定 3 個月）觀察期延續 v0.1.1 起點 2026-04-27。 |
| 2026-04-28 | v0.1.2 後 · 補 §2 Color Palette 色票卡 + 移除 deprecated preview 檔 | 使用者 review 時發現 components-preview.html 沒有色票卡，要查 hex 值得回頭翻 DESIGN.md §2 / tokens/color.json 不方便。補完整色票 section（Wood Palette 8 raw + Role Tokens Light ↔ Dark 並排對照 + Earth Tone status Light → Dark 提亮對照 + 透明度層 alpha 在 mode backdrop 上呈現）插在 §8 Brand Logo 之前作為 TOC 第一順位。同時順勢清掉兩份 deprecated preview：(1) `components-preview-palette-A.html` 三層藍 what-if 對照、(2) `preview.html` v0.1.0 前早期過渡版。歷史對照改信任 git tag（`git show v0.1.0:<path>`）+ §16 文字描述，避免主 preview 升版時 deprecated 檔案越漂越遠（這次補色票卡就漏改 palette-A，證明維護成本變雜訊）。§13.2 deprecated preview 列表保留 `v3/*` 那批（在 `~/.gstack/` 外部目錄不在 repo 內），但移除已刪除的兩份 preview 條目。og-template.html 仍用 v0.1.0 前舊 palette（`#F7F2E8 / #416880 / #1C1410`）跟現行 wood palette 不一致 —— 已記錄為 v0.1.3 candidate task，本次不動。 |
| 2026-04-28 | v0.1.3 release · og-template.html 升版 + §11.3 路徑修正 | 觸發點：使用者 2nd Brain（Obsidian vault）未來要做大量社群貼文 + IG 圖卡 + Notion 同步，會把 LazzyMerlin §11.3 OG template 當 reference。但 og-template.html 整檔仍用 v0.1.0 finalize 前的舊 palette（`#F7F2E8 / #416880 / #1C1410 / #5C5247`），跟現行 wood palette 不一致 —— 如果 2nd Brain 閻多比拿這檔當 reference 會學到錯的調色。修法：(1) **og-template.html palette 全面升版到 wood palette role tokens**（`#F5EFE4 Parchment / #0F1C26 Midnight Petrol / #46647C Petrol / #4E3029 Espresso / #967459 Stone / hairline `rgba(150,116,89,0.30)`），dark mode 同步（`#0F1C26 bg / #5E7A8D primary 互換 / #DECCA7 ink-muted`）。(2) **og-orb-2 暖色從 `oklch(0.65 0.06 65 / 0.2)` 換成 `var(--earth-ochre)`**（`#8E6E37` light / `#D4AB6E` dark 提亮），保留「左下暖調 vs 右上 Petrol 冷調」對比但對齊 §2.2 earth tone status extension。`◈` corner sigil 保留（跟左上 `✦` 上下呼應的有趣 detail）。(3) **§11.3 模板檔案路徑修正**：原本指 `~/.gstack/projects/LazzyMerlin/designs/design-system-20260422/v3/og-template.html`（指錯到 gstack 外部 designs 目錄），改成 repo 內實際路徑 `preview/og-template.html`，跟 §13.3 一致。(4) **不影響任何已生產的 OG image PNG**（那些是 static screenshots 不會自動 regen），僅 future regenerated OG image 才會套新 palette。 |
| 2026-05-01 | v0.1.4 release · evidence-driven patch · QTL iOS 落地 13 條 gap 一次到位 | LazzyMerlin DS **第一個 evidence-driven patch release**：所有變更都來自 QuickTimeLapse iOS 子專案 2026-04-29 ~ 2026-05-01 落地累積的 17 條 gap report（落地 commit 範圍 `49526a2..5ced89e`、M0 → M5 + 2 個 polish）。13 條納入本 patch，4 條留 v0.2 主菜統一處理。**P0（1 條）**：(#1) §7.2 L819 iOS `accentColor` 從 `#416880 / #699FC5`（v0.1.0-pre 舊 palette legacy、跟 og-template.html / preview.html 同批殘留、v0.1.3 修 og-template 時漏掃到）改 `#46647C / #5E7A8D`，對齊 §1 wood palette + dark mode 互換規則。**P1（5 條）**：(#2) §2.2.1 + §7.2.2 加 `surface-1 / surface-2` card tier token（light luminance delta +1.5%、dark +5%）；(#3) §7.2.3 加 iOS spacing 對齊建議表（DS 4px scale ↔ HIG 8pt grid）；(#10) §7.2.9 加 iOS noise opacity 0.05-0.08 或 opt-out（避免 Retina 高 DPI 認知為「螢幕髒」）；(#11) §2.2.1 + §14.3 補 surface vs card luminance delta 規範 + border 在 surface 上對比度 SC 1.4.11 標準；(#13) §7.2.4 加 iOS Type Scale 對照表（DS web px → iOS pt）。**P2（3 條）**：(#4) §7.2.7 補 `RoundedRectangle(cornerRadius:, style: .continuous)`；(#5) §7.2.8 加 dark mode 偏好（跟系統 + 三態 override）；(#8) §7.2.6 補 SwiftUI section label 範例（`.textCase(.uppercase) + tracking`）。**P3（4 條）**：(#7) landing-checklist title v0.1.1 → v0.1.4；(#12) landing-checklist + §16 註記 WebFetch summarize bias 警告（QTL M1 Tactile 強度只到 spec 1/4-1/8、M3.5 重做才修正，根因是 WebFetch 漏掉 §5.4.1 完整 box-shadow + §10.3 完整文案，用 curl raw 才完整）；(#16) landing-checklist 補 iOS 18 / Xcode 16 PBXFileSystemSynchronizedRootGroup Info.plist 須在 source folder 外的 specific note；(#17) §8.3.2 補 AI 生 icon prompt template + 雙層輪廓警告（AI 默認帶 rounded square 底會跟 iOS mask 疊成「框中框」）。**v0.2 留 4 條主菜**：#6 + #14 Tactile material iOS 等價 reference impl（需要完整章節 + reference QTL `TactileMaterial.swift`，太大顆）、#9 brand signature placement iOS（場景判斷需再想）、#15 text-shadow iOS 沒原生（跟 #6+#14 同主題、併入 Tactile iOS 章節）。回流報告 ref：`~/Projects/QuickTimeLapse/docs/lazzymerlin-ds-feedback.md`。本 patch 不含 token 結構變更（§17.6 第 2 條觀察期延續 v0.1.1 起點 2026-04-27）。 |
| 2026-05-04 | **Tactile 配方收斂為跨平台最大公約數**（v0.2.0 主菜）| 觸發點：使用者反思 LazzyMerlin DS 的核心問題 ——「web 端 Tactile-Heavy 在 SwiftUI 跑不出來，QTL / 未來 iOS 子專案永遠落地不到位」。技術根因：CSS 的 `inset` shadow + SVG turbulence + `mix-blend-mode` 是 web pipeline 獨有，SwiftUI 無等價，硬模擬出來只到 50% 像。三個策略方向（A 降規格全平台 Tactile-Lite / B 分層等價維護兩套 spec / C 退為氣質方向 Tactile 限 web-only）討論後使用者明確選 **方向 D · 兩平台都做 Tactile，但只做 SwiftUI 也能對齊的部分**——比 C 更嚴格，要求視覺氣質「分不太出來」。修法：(1) **§5.4 Tactile 重新定義為「跨平台共通六件配方」**：對角微暗化 / 上亮下暗單層 stroke（取代雙層 inset rim）/ 2 層 drop shadow（從 4 層降到 2 層）/ PNG noise tile（取代 SVG turbulence dynamic）/ text shadow / continuous radius —— 六件每件都 web + SwiftUI 等價可實作。(2) **§5.4.1 四態材質重寫**：Base / Raised / Inset / Pressed 仍是四態語意，但每態用六件 building blocks 組合，CSS 規格大幅簡化（drop shadow 4→2 層、雙層 inset rim → 單層 stroke、SVG turbulence → PNG tile）。(3) **§5.4.2 dark mode** 同步降規格 + 新增「dark 上 noise opacity 0.10-0.12（要稍強才看見）」。(4) **§5.7 Material 對照表加 platform column**：Web class ↔ SwiftUI ViewModifier 對照，明訂 SwiftUI 原生元件優先（Toggle / Slider / Checkbox 用 `.tint(.accent)` 不重造輪子）。(5) **§7.2.9 重寫**（v0.1.4 補的「iOS noise opt-out / 0.05-0.08 克制」**作廢**）改為「Tactile material 跨平台等價」附完整 `tactileRaised()` ViewModifier reference impl。(6) **§7.3 macOS** 沿用 §7.2 SwiftUI ViewModifier 同份 code。(7) **新增 [`assets/tactile-noise.png`](assets/tactile-noise.png)**：256×256 RGBA PNG，從 `<feTurbulence baseFrequency='1.6' numOctaves='4' seed='5' stitchTiles='stitch'>` 用 `rsvg-convert` render，stitchable 無縫，跨平台共用。**Trade-off**：web 端 Tactile 視覺強度約 -30%（雙層 inset rim → 單層 stroke 雕刻感弱、4 層 drop shadow → 2 層浮起感弱、SVG turbulence dynamic → PNG tile static），換得 iOS / macOS / web 三端視覺氣質「分不太出來」+ iOS 子專案有完整 reference impl 可 copy-paste。**v1.0 路徑加新條件第 6 條**：「跨平台 Tactile 等價 reference impl 落地驗證 ✓（建 preview-ios/ + components 6 個 MVP 截圖比對）」，作為 v0.2.0 主菜的下一步（階段 2）。 |
| 2026-05-05 | **新增 `--ink-on-brand` token · §15.5.4 generalize 為全 component 通用**（v0.2.0-rc.3）| 觸發點：使用者在 preview-ios buttons gallery dark mode 截圖觀察到藍色系按鈕（Primary / Brand Deep）內的文字「跟 light mode 反差不夠大」。技術根因：v0.1.x 起所有彩色底元件（button / chip / avatar / badge）都用 `color: var(--bg)` —— light mode `--bg = Parchment #F5EFE4` 米色字 ✓ OK，但 dark mode `--bg = Midnight Petrol #0F1C26` 深藍字 ⚠️：Mid Petrol `#5E7A8D` 底配 Midnight Petrol 字 = 對比 3.4:1（剛過 AA Large 但邊緣），Deep Petrol `#334D5C` 底配 Midnight Petrol 字 = **1.7:1 完全不過 AA**。§15.5.4「彩色底配米色字」原則 v0.1.0 已存在但只規範 chip / avatar，未 generalize 到 button，且實作上用 `var(--bg)` 而非「永遠米色」。修法：(1) **§2.2.1 加 `--ink-on-brand` token**：`#F5EFE4` Parchment 在 light + dark 都同值（**不翻轉**）。明確區分 `--bg`（page surface 翻轉）vs `--ink-on-brand`（彩色底文字不翻轉）。(2) **§15.5.4 重寫 generalize 為全 component 通用**：button / chip / badge / avatar / toast / modal action 任何 Tactile 彩色 fill 文字一律 `var(--ink-on-brand)`，例外只剩淺底（`bg-muted` Tan）走深字 + ghost / secondary 透明底走 page surface 規則。(3) **`tokens/color.json` 加 `ink-on-brand`** + (4) **components-preview.html `:root` + `[data-theme="dark"]` 加 `--ink-on-brand: #F5EFE4`**，所有彩色 button / chip 變體 `color` 改 `var(--ink-on-brand)`。(5) **新增 `InkOnBrand.colorset`**（light + dark 同 `#F5EFE4`），iOS auto-gen `Color.inkOnBrand`。(6) **iOS source files**（TactileMaterial.swift / ButtonsView / ChipsView / ButtonsTunerView）內彩色 fill 文字 `Color.bg` → `Color.inkOnBrand`，page background 用法（`Color.bg.ignoresSafeArea` 等）保持 `Color.bg` 不動。對比驗證：所有彩色底配 Parchment 字跨 light / dark 對比一致（Mid Petrol 5.4:1、Deep Petrol 7.5:1、Earth Red 5.3:1），全過 AA Large。 |

---

## 十七、Versioning 政策

### 17.1 Semver 規則

LazzyMerlin DS 遵循 [Semantic Versioning 2.0.0](https://semver.org/lang/zh-TW/)：版本號 `MAJOR.MINOR.PATCH`。

| Bump | 觸發條件 | 範例 |
|---|---|---|
| **MAJOR**（v1.x → v2.0）| Breaking change · 動到 `tokens/` 內任何 hex / 結構性 token；改 §2.1 wood palette；改既有元件 anatomy；移除 token | 換 brand 主色、刪除 chip variant、改 spacing scale 階數 |
| **MINOR**（v0.1 → v0.2）| 新增非破壞性功能 · 加新 token / 新元件 / 新 chapter；擴 size scale | 新增 chip--earth-green token、§17 Versioning 章節、新增 component spec |
| **PATCH**（v0.1.0 → v0.1.1）| 修正 / 補充 · 不影響落地的修字、補 example、修 typo、加 reference | DESIGN.md 修錯字、補 reference link、CHANGELOG 補一筆遺漏 |

**v0.x.y 階段**：API 不穩定，MINOR 也可能含 breaking change。v1.0.0 後嚴格遵守 semver。

### 17.2 Git Tag 格式

```bash
git tag v0.1.0          # release tag
git tag v0.1.0-rc.1     # release candidate（預期將成為 v0.1.0）
git tag v0.1.0-alpha.1  # 早期測試版
```

子專案 pin 版本範例（在子專案的 README 或 docs 寫）：

```
本專案使用 LazzyMerlin DS v0.1.0
規範文件：https://github.com/bbfcwhy/LazzyMerlinDS/blob/v0.1.0/DESIGN.md
Tokens：https://github.com/bbfcwhy/LazzyMerlinDS/tree/v0.1.0/tokens
```

### 17.3 CHANGELOG.md vs §16 Decisions Log 分工

兩者並存，角色不同：

| 文件 | 角色 | 寫法 |
|---|---|---|
| **`CHANGELOG.md`** | 給「使用 DS 的人」看的 release notes | Keep a Changelog 格式：Added / Changed / Deprecated / Removed / Fixed · 一句帶過 what changed |
| **`DESIGN.md §16 Decisions Log`** | 給「未來的自己 / 維護者」看的 paper trail | 每筆含 What + **Why**（背景 / 觸發 / 替代方案被否決原因）· 長段敘事 |

通常一個 PR 兩處都寫：CHANGELOG 簡述、Decisions Log 詳述。Decisions Log 是 narrative，記錄「為什麼這個決策」，未來看會懂；CHANGELOG 是 list，給快速 scan。

### 17.4 Breaking Change 政策

任何 hex 改動 = **automatic major bump**（影響整個 DS 視覺一致性）。要 break 必須：

1. **先在 §16 寫 deprecation notice**（一個版本前預告）
2. **CHANGELOG 標 `### Deprecated`**
3. **下個 MAJOR release 才實際移除**
4. 給子專案至少一個 release window 跟上

範例（hypothetical）：
- v0.5.0：CHANGELOG 標 「Deprecated: `chip--soft` token 將在 v1.0.0 移除，改用 `chip--earth-green`」
- v1.0.0：實際移除，子專案需 migrate

### 17.5 各子專案落地建議

新專案建立時：

```bash
# 在子專案 docs/DESIGN-VERSION.md 寫
LazzyMerlin DS pinned: v0.1.0
最後同步: 2026-04-26
下次同步檢查: 看 CHANGELOG 有 Breaking 才 bump
```

定期（每月 / 每季）跑同步 check：
1. 拉取 LazzyMerlin DS 最新版
2. 看 CHANGELOG 從 pinned 版本之後的所有 entry
3. 沒 breaking → 直接 bump pin 版本
4. 有 breaking → 評估 migration cost、決定何時跟上

### 17.6 v0.x → v1.0 路徑

當前 v0.1.4。預計 v1.0.0 release 條件（持續更新）：

- [x] 至少 1 個子專案完整落地驗證（任一 web 或 iOS / macOS 專案）— **2026-04-28 達成 · 個人網站 lazzywill** 完整落地，驗收 checklist 10 項全綠（見 CHANGELOG v0.1.2 · Validated 段）
- [ ] Token 結構穩定 3 個月無 breaking change（觀察期：v0.1.1 release 為起點 2026-04-27 → 2026-07-27）
- [x] 跨平台落地 QA Checklist 完成 — **2026-04-27 達成 · `docs/landing-checklist.md`**
- [ ] iOS / macOS SDK 範例專案（驗證 §7.2 / §7.3 規範可行）
- [ ] Accessibility audit 過一輪（§14 規範實測 · lazzywill 落地已過初步檢查，但未做正式 audit）

到 v1.0.0 後 LazzyMerlin DS 成為 brand 級穩定 SoT，破壞性更動需嚴格遵守 semver MAJOR bump。
