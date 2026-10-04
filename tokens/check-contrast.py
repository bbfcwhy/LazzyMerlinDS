#!/usr/bin/env python3
"""LazzyMerlin DS 文字對比檢查（WCAG 2.x）。

用法：python3 tokens/check-contrast.py
全部通過 exit 0；任何一組不過、或 iOS colorset 跟 color.json 對不上 → exit 1。

改任何色碼 / 角色 token / 元件字色配對之後都要跑一次。DESIGN.md §14.3 的對比數字以本腳本輸出為準，
不要手算後直接寫進文件（v0.4.0 以前文件裡有 3 組數字寫錯，見 §16 2026-10-04）。

算法（WCAG 2.2 SC 1.4.3 定義）：
  c = 8bit / 255；c_lin = c / 12.92（c ≤ 0.04045）否則 ((c + 0.055) / 1.055) ^ 2.4
  L = 0.2126 R_lin + 0.7152 G_lin + 0.0722 B_lin；對比 = (L_亮 + 0.05) / (L_暗 + 0.05)
半透明字色先用 alpha 在 sRGB 疊到底色上再算。
"""
import glob
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IOS = os.path.join(ROOT, "preview-ios/LazzyMerlinDSPreview/LazzyMerlinDSPreview")
COLORSETS = os.path.join(IOS, "Assets.xcassets")

TEXT = 4.5      # 一般文字（LMDS 的 chip 11–12pt、按鈕 13–16pt 都不是 WCAG 大字）
NON_TEXT = 3.0  # 非文字 UI（focus ring 等，SC 1.4.11）

# color.json 角色 token ↔ iOS colorset 名稱
ROLE_TO_COLORSET = {
    "bg": "Bg", "bg-raised": "BgRaised", "bg-muted": "BgMuted",
    "ink": "Ink", "ink-muted": "InkMuted", "ink-on-brand": "InkOnBrand", "ink-on-light": "InkOnLight",
    "primary-text": "PrimaryText", "primary": "PrimaryBrand", "primary-fill": "PrimaryFill",
    "primary-soft": "PrimarySoft", "primary-deep": "PrimaryDeep", "stone": "Stone",
    "success": "EarthGreen", "warning": "EarthOchre", "error": "EarthRed",
}


# ---------- WCAG ----------
def rgb(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i + 2], 16) for i in (0, 2, 4))


def lum(h):
    def lin(c8):
        c = c8 / 255
        return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4
    r, g, b = rgb(h)
    return 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b)


def ratio(a, b):
    la, lb = lum(a), lum(b)
    return (max(la, lb) + 0.05) / (min(la, lb) + 0.05)


def mix(fg, alpha, bg):
    f, b = rgb(fg), rgb(bg)
    return "#%02X%02X%02X" % tuple(round(alpha * f[i] + (1 - alpha) * b[i]) for i in range(3))


assert abs(ratio("#000000", "#FFFFFF") - 21) < 1e-9
assert abs(ratio("#777777", "#FFFFFF") - 4.478) < 0.001  # WebAIM 顯示 4.47


# ---------- 讀色碼 ----------
def load_roles():
    data = json.load(open(os.path.join(ROOT, "tokens/color.json"), encoding="utf-8"))["color"]

    def resolve(v):
        m = re.fullmatch(r"\{color\.(\w+)\.([\w-]+)\}", v)
        return data[m.group(1)][m.group(2)]["$value"].upper() if m else v.upper()

    return {mode: {k: resolve(v["$value"]) for k, v in data[mode].items() if not k.startswith("$")}
            for mode in ("light", "dark")}


def load_colorsets():
    out = {"light": {}, "dark": {}}
    for p in glob.glob(os.path.join(COLORSETS, "*.colorset/Contents.json")):
        name = os.path.basename(os.path.dirname(p))[: -len(".colorset")]
        for c in json.load(open(p))["colors"]:
            mode = "dark" if c.get("appearances") else "light"
            comp = c["color"]["components"]
            ch = lambda v: int(v, 16) if v.strip().startswith("0x") else round(float(v) * 255)  # noqa: E731
            out[mode][name] = "#%02X%02X%02X" % (ch(comp["red"]), ch(comp["green"]), ch(comp["blue"]))
    return out


def swift_alpha(name):
    src = open(os.path.join(IOS, "Tokens/Color+Brand.swift"), encoding="utf-8").read()
    m = re.search(rf"static var {name}: Color \{{ Color\.inkMuted\.opacity\(([\d.]+)\) \}}", src)
    if not m:
        raise SystemExit(f"找不到 Color+Brand.swift 的 {name}")
    return float(m.group(1))


roles = load_roles()
cs = load_colorsets()
problems = []

# 1. iOS colorset 必須跟 color.json 一致（含 Surface1 / Surface2 只在 iOS）
for mode in ("light", "dark"):
    for role, name in ROLE_TO_COLORSET.items():
        a, b = roles[mode].get(role), cs[mode].get(name)
        if a is None or b is None:
            problems.append(f"缺 token：{mode} {role}（color.json={a}）/ {name}.colorset={b}")
        elif a != b:
            problems.append(f"不一致：{mode} {role} color.json {a} ≠ {name}.colorset {b}")
    roles[mode]["surface-1"] = cs[mode].get("Surface1")
    roles[mode]["surface-2"] = cs[mode].get("Surface2")

if problems:
    print("\n".join("✗ " + p for p in problems))
    sys.exit(1)

# 2. 字色 × 底色規則（DESIGN.md §2.3 / §14.3 / §15.5.4）
SUBDUED = swift_alpha("inkMutedSubdued")
CHIP_SOFT_TINT = 0.20  # components-preview.html .chip--soft：color-mix(primary-soft 20%, bg)
SURFACES = ("bg", "bg-muted", "surface-1", "surface-2")

checks = []  # (說明, 字, 底, 門檻)
for mode in ("light", "dark"):
    R = roles[mode]
    for s in SURFACES:
        checks.append((f"{mode} 主文字 ink on {s}", R["ink"], R[s], TEXT))
        checks.append((f"{mode} 次文字 ink-muted on {s}", R["ink-muted"], R[s], TEXT))
        checks.append((f"{mode} inkMutedSubdued ({SUBDUED:.2f}) on {s}", mix(R["ink-muted"], SUBDUED, R[s]), R[s], TEXT))
        if s != "bg-muted":  # Tan / Espresso 區塊內的藍色文字改用 ink（連結再加底線，§2.3）
            checks.append((f"{mode} 藍色文字 primary-text on {s}", R["primary-text"], R[s], TEXT))
    for fill in ("primary-fill", "primary-deep", "stone", "error", "success"):
        checks.append((f"{mode} ink-on-brand on {fill}", R["ink-on-brand"], R[fill], TEXT))
    checks.append((f"{mode} ink-on-light on warning", R["ink-on-light"], R["warning"], TEXT))
    tint = mix(R["primary-soft"], CHIP_SOFT_TINT, R["bg"])
    checks.append((f"{mode} .chip--soft ink on tint {tint}", R["ink"], tint, TEXT))
    checks.append((f"{mode} focus ring primary on bg（非文字）", R["primary"], R["bg"], NON_TEXT))

fail = 0
for label, fg, bg, need in checks:
    r = ratio(fg, bg)
    ok = r >= need
    fail += not ok
    print(f"{'✓' if ok else '✗'} {r:5.2f}:1 (≥{need})  {fg} on {bg}  {label}")

print(f"\n{len(checks) - fail}/{len(checks)} 通過")
sys.exit(1 if fail else 0)
