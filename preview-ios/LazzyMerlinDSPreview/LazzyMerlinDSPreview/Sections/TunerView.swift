import SwiftUI

// LazzyMerlin DS Tactile Raised tuner
// 即時拖拉 slider 調整 §5.4.1 共通六件配方所有參數，肉眼校到「分不太出來」
// 校好後按「查看 spec 數值」，把數值寫回 spec + components-preview.html + TactileMaterial.swift

// MARK: - Base fill color choice
// §2.1 Wood Palette 8 色 RAW VALUES (兩 mode 共用、不翻轉)
// + 主人選定 3 色 Earth Tone (#9E5949 / #6A7A60 / #D4AB6E、跨 mode 同 hex)
// Tuner 用固定 hex 不從 asset 翻轉，方便看每色在 light/dark surface 上各別效果

enum BaseFillChoice: String, CaseIterable, Identifiable {
    // ★ Mode-aware tokens (asset catalog · light/dark 自動翻轉)
    case bg, bgRaised, bgMuted
    // Wood Palette 8 色 (§2.1 · 跨 mode 同 raw hex)
    case parchment, tan, stone, espresso
    case midnight, primaryDeep, primaryBrand, primarySoft
    // Earth Tone 3 色 (主人 v0.2.0-rc 選定)
    case earthRed, earthGreen, earthOchre

    var id: Self { self }

    var label: String {
        switch self {
        case .bg:           return "BG"
        case .bgRaised:     return "Raised"
        case .bgMuted:      return "Muted"
        case .parchment:    return "Parchment"
        case .tan:          return "Tan"
        case .stone:        return "Stone"
        case .espresso:     return "Espresso"
        case .midnight:     return "Midnight"
        case .primaryDeep:  return "Deep"
        case .primaryBrand: return "Primary"
        case .primarySoft:  return "Soft"
        case .earthRed:     return "Red"
        case .earthGreen:   return "Green"
        case .earthOchre:   return "Ochre"
        }
    }

    var hexCSS: String {
        switch self {
        // mode-aware tokens 沒有單一 hex、給 CSS var 名稱代替
        case .bg:           return "var(--bg)"
        case .bgRaised:     return "var(--bg-raised)"
        case .bgMuted:      return "var(--bg-muted)"
        case .parchment:    return "#F5EFE4"
        case .tan:          return "#DECCA7"
        case .stone:        return "#967459"
        case .espresso:     return "#4E3029"
        case .midnight:     return "#0F1C26"
        case .primaryDeep:  return "#334D5C"
        case .primaryBrand: return "#46647C"
        case .primarySoft:  return "#5E7A8D"
        case .earthRed:     return "#9E5949"
        case .earthGreen:   return "#596751"
        case .earthOchre:   return "#CB9B52"
        }
    }

    var displayName: String {
        switch self {
        case .bg:           return "BG · auto"
        case .bgRaised:     return "Raised · auto"
        case .bgMuted:      return "Muted · auto"
        case .parchment:    return "Parchment"
        case .tan:          return "Tan"
        case .stone:        return "Stone"
        case .espresso:     return "Espresso"
        case .midnight:     return "Midnight Petrol"
        case .primaryDeep:  return "Deep Petrol"
        case .primaryBrand: return "Petrol"
        case .primarySoft:  return "Mid Petrol"
        case .earthRed:     return "Terracotta"
        case .earthGreen:   return "Sage"
        case .earthOchre:   return "Ochre"
        }
    }

    var color: Color {
        switch self {
        // ★ Mode-aware · 從 Asset Catalog 取色、跟 colorScheme 自動翻轉
        case .bg:           return Color.bg
        case .bgRaised:     return Color.bgRaised
        case .bgMuted:      return Color.bgMuted
        // Wood Palette 8 色 raw hex (跨 mode 共用)
        case .parchment:    return Color(red: 0xF5/255, green: 0xEF/255, blue: 0xE4/255)
        case .tan:          return Color(red: 0xDE/255, green: 0xCC/255, blue: 0xA7/255)
        case .stone:        return Color(red: 0x96/255, green: 0x74/255, blue: 0x59/255)
        case .espresso:     return Color(red: 0x4E/255, green: 0x30/255, blue: 0x29/255)
        case .midnight:     return Color(red: 0x0F/255, green: 0x1C/255, blue: 0x26/255)
        case .primaryDeep:  return Color(red: 0x33/255, green: 0x4D/255, blue: 0x5C/255)
        case .primaryBrand: return Color(red: 0x46/255, green: 0x64/255, blue: 0x7C/255)
        case .primarySoft:  return Color(red: 0x5E/255, green: 0x7A/255, blue: 0x8D/255)
        // Earth Tone 3 色 (主人選定、跨 mode 同 hex)
        case .earthRed:     return Color(red: 0x9E/255, green: 0x59/255, blue: 0x49/255)
        case .earthGreen:   return Color(red: 0x59/255, green: 0x67/255, blue: 0x51/255)
        case .earthOchre:   return Color(red: 0xCB/255, green: 0x9B/255, blue: 0x52/255)
        }
    }

    /// 淺色 base 需要深字才有對比。光度高於 ~50% 的 token 列為「淺色」、用 dark ink。
    /// Mode-aware token 直接用 .ink (asset 自己會翻)、回傳 true 觸發 ink 路徑
    var prefersDarkInk: Bool {
        switch self {
        case .bg, .bgRaised, .bgMuted, .parchment, .tan, .earthOchre:
            return true
        case .stone, .espresso, .midnight, .primaryDeep, .primaryBrand, .primarySoft, .earthRed, .earthGreen:
            return false
        }
    }
}

// MARK: - Preview component switcher

enum PreviewComponent: String, CaseIterable, Identifiable {
    case button
    case secondaryButton
    case pressed
    case card
    case plain
    case chip
    case circle
    case modal
    case sheet
    case alert
    case toast
    case input
    case segmented
    case switchControl
    case sliderControl

    var id: Self { self }

    var label: String {
        switch self {
        case .button:          return "Button"
        case .secondaryButton: return "Secondary"
        case .pressed:         return "Pressed"
        case .card:            return "Card"
        case .plain:           return "Plain"
        case .chip:            return "Chip"
        case .circle:          return "Circle"
        case .modal:           return "Modal"
        case .sheet:           return "Sheet"
        case .alert:           return "Alert"
        case .toast:           return "Toast"
        case .input:           return "Input"
        case .segmented:       return "Segmented"
        case .switchControl:   return "Switch"
        case .sliderControl:   return "Slider"
        }
    }

    /// 是否 interactive (按下去有 pressed state)。
    /// 複合 control 自己可互動，但不吃這組 pressed animation。
    var isInteractive: Bool {
        switch self {
        case .button, .secondaryButton, .pressed, .card, .plain, .chip, .circle:
            return true
        case .modal, .sheet, .alert, .toast, .input, .segmented, .switchControl, .sliderControl:
            return false
        }
    }
}

// MARK: - BlendMode wrapper (RawRepresentable String for @AppStorage)

enum BlendModeChoice: String, CaseIterable, Identifiable {
    case softLight, overlay, multiply, normal

    var id: Self { self }

    var blendMode: BlendMode {
        switch self {
        case .softLight: return .softLight
        case .overlay:   return .overlay
        case .multiply:  return .multiply
        case .normal:    return .normal
        }
    }

    var label: String {
        switch self {
        case .softLight: return "soft"
        case .overlay:   return "overlay"
        case .multiply:  return "multiply"
        case .normal:    return "normal"
        }
    }

    var swiftName: String {
        switch self {
        case .softLight: return ".softLight"
        case .overlay:   return ".overlay"
        case .multiply:  return ".multiply"
        case .normal:    return ".normal"
        }
    }

    var cssName: String {
        switch self {
        case .softLight: return "soft-light"
        case .overlay:   return "overlay"
        case .multiply:  return "multiply"
        case .normal:    return "normal"
        }
    }
}

// MARK: - Color hex serialization (for @AppStorage Color persistence)

extension Color {
    init(hexString: String) {
        var s = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if s.hasPrefix("#") { s.removeFirst() }
        var v: UInt64 = 0
        Scanner(string: s).scanHexInt64(&v)
        let r = Double((v >> 16) & 0xFF) / 255
        let g = Double((v >> 8) & 0xFF) / 255
        let b = Double(v & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }

    func toHexString() -> String {
        #if os(iOS) || os(visionOS) || os(tvOS) || os(watchOS)
        let ui = UIColor(self)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        ui.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(format: "%02X%02X%02X",
                      Int((r * 255).rounded()),
                      Int((g * 255).rounded()),
                      Int((b * 255).rounded()))
        #elseif os(macOS)
        guard let ns = NSColor(self).usingColorSpace(.sRGB) else { return "FFFFFF" }
        return String(format: "%02X%02X%02X",
                      Int((ns.redComponent * 255).rounded()),
                      Int((ns.greenComponent * 255).rounded()),
                      Int((ns.blueComponent * 255).rounded()))
        #else
        return "FFFFFF"
        #endif
    }
}

struct TunerView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dismiss) private var dismiss

    // MARK: - BASE FILL  (@AppStorage 持久化跨 navigate / app launch)
    @AppStorage("tuner_baseFillChoice") private var baseFillChoice: BaseFillChoice = .primaryBrand
    @AppStorage("tuner_fillDarken") private var fillDarken: Double = 0.10

    // MARK: - 對角 GRADIENT (#1) · CSS angle (0=up, 90=right, 180=down, 270=left, 135=top-left→bottom-right)
    @AppStorage("tuner_gradAngle") private var gradAngle: Double = 135
    @AppStorage("tuner_gradWhiteTL") private var gradWhiteTL: Double = 0.06
    @AppStorage("tuner_gradBlackBR") private var gradBlackBR: Double = 0.30

    // MARK: - HIGHLIGHT BAND (#1b) · 純垂直 white-to-clear band (頂部受光面)
    // 單位改絕對 pt (透過 GeometryReader 換算回 UnitPoint)、跟 LEFT 同 pt 視覺一致
    @AppStorage("tuner_highlightBandOpacity") private var highlightBandOpacity: Double = 0.0
    @AppStorage("tuner_highlightBandHeightPt") private var highlightBandHeight: Double = 12

    // MARK: - LEFT HIGHLIGHT BAND (#1c) · 純水平 white-to-clear band (左邊受光面)
    @AppStorage("tuner_leftHighlightBandOpacity") private var leftHighlightBandOpacity: Double = 0.0
    @AppStorage("tuner_leftHighlightBandWidthPt") private var leftHighlightBandWidth: Double = 12

    // MARK: - CORNER HIGHLIGHT (#1d) · RadialGradient 從左上角點出發 (specular hotspot · 真實光點感)
    @AppStorage("tuner_cornerHighlightOpacity") private var cornerHighlightOpacity: Double = 0.0
    @AppStorage("tuner_cornerHighlightRadiusPt") private var cornerHighlightRadius: Double = 40

    // MARK: - 單層 STROKE (#2) · Color 用 hex string @AppStorage + Binding wrapper
    @AppStorage("tuner_strokeTopColorHex") private var strokeTopColorHex: String = "FFFFFF"
    @AppStorage("tuner_strokeTopOpacity") private var strokeTopOpacity: Double = 0.34
    @AppStorage("tuner_strokeBottomColorHex") private var strokeBottomColorHex: String = "000000"
    @AppStorage("tuner_strokeBottomOpacity") private var strokeBottomOpacity: Double = 0.34
    @AppStorage("tuner_strokeWidth") private var strokeWidth: Double = 1.0

    // MARK: - HAIRLINE RIM (#2b) · 細外框 (color + opacity + 線寬)
    @AppStorage("tuner_hairlineColorHex") private var hairlineColorHex: String = "FFFFFF"
    @AppStorage("tuner_hairlineOpacity") private var hairlineOpacity: Double = 0.0
    @AppStorage("tuner_hairlineWidth") private var hairlineWidth: Double = 1.0

    // MARK: - DROP SHADOW 近層 (#3a) · color 可調 (white = halo / black = drop / brand = aura)
    @AppStorage("tuner_shadowNearColorHex") private var shadowNearColorHex: String = "0F1C26"
    @AppStorage("tuner_shadowNearOpacity") private var shadowNearOpacity: Double = 0.24
    @AppStorage("tuner_shadowNearRadius") private var shadowNearRadius: Double = 5
    @AppStorage("tuner_shadowNearX") private var shadowNearX: Double = 0
    @AppStorage("tuner_shadowNearY") private var shadowNearY: Double = 3

    // MARK: - DROP SHADOW 遠層 (#3b) · color 可調
    @AppStorage("tuner_shadowFarColorHex") private var shadowFarColorHex: String = "0F1C26"
    @AppStorage("tuner_shadowFarOpacity") private var shadowFarOpacity: Double = 0.18
    @AppStorage("tuner_shadowFarRadius") private var shadowFarRadius: Double = 14
    @AppStorage("tuner_shadowFarX") private var shadowFarX: Double = 0
    @AppStorage("tuner_shadowFarY") private var shadowFarY: Double = 9

    // MARK: - INNER SHADOW (#3c) · mask + blur trick (SwiftUI 無原生 inset shadow)
    // stroke = 光環厚度 (lineWidth) · blur = 邊緣柔軟度 (兩個獨立、不再綁死)
    @AppStorage("tuner_innerShadowColorHex") private var innerShadowColorHex: String = "000000"
    @AppStorage("tuner_innerShadowOpacity") private var innerShadowOpacity: Double = 0.0
    @AppStorage("tuner_innerShadowStroke") private var innerShadowStroke: Double = 8
    @AppStorage("tuner_innerShadowBlur") private var innerShadowBlur: Double = 4
    @AppStorage("tuner_innerShadowX") private var innerShadowX: Double = 0
    @AppStorage("tuner_innerShadowY") private var innerShadowY: Double = -2

    // MARK: - INNER SHADOW #2 (#3d) · 第二組內暈 (典型用法：頂亮 white、跟 #1 底暗 black 對打做曲面 pillow)
    @AppStorage("tuner_innerShadow2ColorHex") private var innerShadow2ColorHex: String = "FFFFFF"
    @AppStorage("tuner_innerShadow2Opacity") private var innerShadow2Opacity: Double = 0.0
    @AppStorage("tuner_innerShadow2Stroke") private var innerShadow2Stroke: Double = 8
    @AppStorage("tuner_innerShadow2Blur") private var innerShadow2Blur: Double = 4
    @AppStorage("tuner_innerShadow2X") private var innerShadow2X: Double = 0
    @AppStorage("tuner_innerShadow2Y") private var innerShadow2Y: Double = 2

    // MARK: - PNG NOISE (#4) · BlendMode 用 BlendModeChoice wrapper enum
    @AppStorage("tuner_noiseOpacity") private var noiseOpacity: Double = 0.20
    @AppStorage("tuner_noiseScale") private var noiseScale: Double = 0.55
    @AppStorage("tuner_noiseBlend") private var noiseBlendChoice: BlendModeChoice = .overlay

    // MARK: - TEXT SHADOW (#5)
    @AppStorage("tuner_textShadowOpacity") private var textShadowOpacity: Double = 0.42
    @AppStorage("tuner_textShadowY") private var textShadowY: Double = 1

    // MARK: - CONTINUOUS RADIUS (#6)
    @AppStorage("tuner_radius") private var radius: Double = 12

    // MARK: - PADDING
    @AppStorage("tuner_paddingV") private var paddingV: Double = 12
    @AppStorage("tuner_paddingH") private var paddingH: Double = 22

    // MARK: - Preview switcher (component · appearance 交給 BrandPage 頂部 tabs)
    @AppStorage("tuner_previewComponent") private var previewComponent: PreviewComponent = .button

    // Runtime-only state (不持久化)
    @State private var showSpec: Bool = false
    @State private var isPreviewPressed: Bool = false
    @State private var previewSegment: String = "B"
    @State private var previewSwitchOn: Bool = true
    @State private var previewSliderValue: Double = 0.64

    // MARK: - Color computed bindings (wrap @AppStorage hex string for ColorPicker)

    private var strokeTopColor: Color {
        Color(hexString: strokeTopColorHex)
    }
    private var strokeBottomColor: Color {
        Color(hexString: strokeBottomColorHex)
    }
    private var strokeTopColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: strokeTopColorHex) },
            set: { strokeTopColorHex = $0.toHexString() }
        )
    }
    private var strokeBottomColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: strokeBottomColorHex) },
            set: { strokeBottomColorHex = $0.toHexString() }
        )
    }
    private var innerShadowColor: Color {
        Color(hexString: innerShadowColorHex)
    }
    private var innerShadowColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: innerShadowColorHex) },
            set: { innerShadowColorHex = $0.toHexString() }
        )
    }
    private var innerShadow2Color: Color {
        Color(hexString: innerShadow2ColorHex)
    }
    private var innerShadow2ColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: innerShadow2ColorHex) },
            set: { innerShadow2ColorHex = $0.toHexString() }
        )
    }
    private var hairlineColor: Color {
        Color(hexString: hairlineColorHex)
    }
    private var hairlineColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: hairlineColorHex) },
            set: { hairlineColorHex = $0.toHexString() }
        )
    }
    private var shadowNearColor: Color {
        Color(hexString: shadowNearColorHex)
    }
    private var shadowNearColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: shadowNearColorHex) },
            set: { shadowNearColorHex = $0.toHexString() }
        )
    }
    private var shadowFarColor: Color {
        Color(hexString: shadowFarColorHex)
    }
    private var shadowFarColorBinding: Binding<Color> {
        Binding(
            get: { Color(hexString: shadowFarColorHex) },
            set: { shadowFarColorHex = $0.toHexString() }
        )
    }
    private var noiseBlend: BlendMode {
        noiseBlendChoice.blendMode
    }

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Sticky preview area (component picker + preview body)
            VStack(spacing: 0) {
                // Toolbar: component menu picker
                HStack(spacing: 12) {
                    LMMenuPicker(
                        selection: $previewComponent,
                        options: PreviewComponent.allCases,
                        title: "選元件"
                    ) { sel in
                        Text(sel.label)
                    } optionLabel: { opt in
                        Text(opt.label)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity, alignment: .leading)

                // Preview body (套 §5.4 配方、跟著 component 變 layout)
                ZStack {
                    Color.bg
                    VStack(spacing: 8) {
                        previewBody(isPressed: previewComponent.isInteractive ? isPreviewPressed : false)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { _ in
                                        guard previewComponent.isInteractive,
                                              !isPreviewPressed else { return }
                                        withAnimation(.easeOut(duration: 0.08)) {
                                            isPreviewPressed = true
                                        }
                                    }
                                    .onEnded { _ in
                                        withAnimation(.spring(response: 0.24, dampingFraction: 0.72)) {
                                            isPreviewPressed = false
                                        }
                                    }
                            )

                        if previewComponent.isInteractive {
                            Button {
                                playPressAnimation()
                            } label: {
                                Label("播放按下動畫", systemImage: "play.fill")
                                    .font(.lmCaption)
                            }
                            .buttonStyle(.plain)
                            .foregroundStyle(Color.inkMuted)
                        } else {
                            Text("Non-interactive · 不 demo pressed state")
                                .font(.lmCaption)
                                .foregroundStyle(Color.inkMuted.opacity(0.6))
                        }
                    }
                }
                .frame(height: 160)
            }

            Divider()

            // MARK: - Sliders Form
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("主色 token")
                            .font(.subheadline)
                            .foregroundStyle(Color.inkMuted)
                        LazyVGrid(
                            columns: [GridItem(.adaptive(minimum: 72), spacing: 10)],
                            spacing: 14
                        ) {
                            ForEach(BaseFillChoice.allCases) { c in
                                Button {
                                    baseFillChoice = c
                                } label: {
                                    VStack(spacing: 6) {
                                        ZStack {
                                            Circle()
                                                .fill(c.color)
                                                .frame(width: 38, height: 38)
                                            Circle()
                                                .strokeBorder(
                                                    baseFillChoice == c
                                                        ? Color.primaryBrand
                                                        : Color.gray.opacity(0.25),
                                                    lineWidth: baseFillChoice == c ? 2.5 : 1
                                                )
                                                .frame(width: 38, height: 38)
                                        }
                                        Text(c.label)
                                            .font(.caption2)
                                            .foregroundStyle(
                                                baseFillChoice == c
                                                    ? Color.primaryBrand
                                                    : Color.secondary
                                            )
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .padding(.vertical, 4)

                    sliderRow("black overlay", value: $fillDarken, in: 0.0...0.50, step: 0.01)
                } header: {
                    Text("BASE FILL · 主色 + 暗化").sectionLabel()
                } footer: {
                    Text("§2.1 Wood Palette 8 色 RAW VALUES (跨 mode 共用、不翻轉) + 3 色 Earth Tone (#9E5949 / #6A7A60 / #D4AB6E)。\n⚠️ Ochre #D4AB6E 在 light surface 上對比 ~2:1 不過 WCAG AA、僅適合 status icon / chip 小面積、不建議大面積 button fill。\n⚠️ Parchment / Tan 通常作 surface 用、作 fill 看起來像 hollow button。Midnight / Espresso 是 dark 版深色、light mode 上看起來會很重。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    sliderRow("角度 (°)",    value: $gradAngle,    in: 0...360,    step: 5,  fmt: "%.0f")
                    sliderRow("頂左 white",  value: $gradWhiteTL,  in: 0.0...0.50, step: 0.01)
                    sliderRow("底右 black",  value: $gradBlackBR,  in: 0.0...0.50, step: 0.01)
                } header: {
                    Text("對角 GRADIENT").sectionLabel()
                } footer: {
                    Text("CSS 角度語意：0° 從下到上、90° 從左到右、135° 從左上到右下(預設)、180° 從上到下、270° 從右到左")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    sliderRow("opacity",   value: $highlightBandOpacity, in: 0.0...0.60, step: 0.01)
                    sliderRow("高度 (pt)", value: $highlightBandHeight,  in: 0...60,     step: 1, fmt: "%.0f")
                } header: {
                    Text("TOP HIGHLIGHT BAND · 頂部受光面").sectionLabel()
                } footer: {
                    Text("純垂直 white-to-clear gradient、頂部受光。高度 = white 漸到 clear 的絕對 pt (12pt = 頂 12pt 內漸層)、跟 LEFT 同 pt 視覺一致。opacity 預設 0 = 關閉。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    sliderRow("opacity",   value: $leftHighlightBandOpacity, in: 0.0...0.60, step: 0.01)
                    sliderRow("寬度 (pt)", value: $leftHighlightBandWidth,  in: 0...60,      step: 1, fmt: "%.0f")
                } header: {
                    Text("LEFT HIGHLIGHT BAND · 左邊受光面").sectionLabel()
                } footer: {
                    Text("純水平 white-to-clear gradient、左邊受光。跟 TOP 一起開可模擬左上光源、左上交集處最亮、強化 directional lighting 立體感。寬度 = white 漸到 clear 的絕對 pt (跟 TOP 同單位、視覺寬度一致)。opacity 預設 0 = 關閉。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    sliderRow("opacity",   value: $cornerHighlightOpacity, in: 0.0...0.80, step: 0.01)
                    sliderRow("半徑 (pt)", value: $cornerHighlightRadius,  in: 10...120,   step: 2, fmt: "%.0f")
                } header: {
                    Text("CORNER HIGHLIGHT · 左上角光點").sectionLabel()
                } footer: {
                    Text("RadialGradient 從左上角點 (0,0) 發出、漸到 clear。模擬「光源從左上射入」的 specular hotspot、是 highlight band 做不到的『真實光點感』。建議起手 opacity 0.35 + 半徑 50pt。opacity 預設 0 = 關閉。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LMColorPicker(title: "頂緣顏色", color: strokeTopColorBinding)
                    sliderRow("頂緣 opacity",  value: $strokeTopOpacity,    in: 0.0...1.0, step: 0.01)
                    LMColorPicker(title: "底緣顏色", color: strokeBottomColorBinding)
                    sliderRow("底緣 opacity",  value: $strokeBottomOpacity, in: 0.0...1.0, step: 0.01)
                    sliderRow("線寬 (pt)",     value: $strokeWidth,         in: 0.5...3.0, step: 0.1, fmt: "%.1f")
                } header: {
                    Text("單層 STROKE · 邊緣描色").sectionLabel()
                } footer: {
                    Text("光源 convention：頂亮 + 底暗 (default white/black) = raised 凸起浮雕；反之 (頂暗 + 底亮) = inset 凹陷感。可以照規矩、也可以亂玩同色 / 任意配色看效果。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LMColorPicker(title: "顏色", color: hairlineColorBinding)
                    sliderRow("opacity",   value: $hairlineOpacity, in: 0.0...0.50, step: 0.01)
                    sliderRow("線寬 (pt)", value: $hairlineWidth,   in: 0.0...2.0,  step: 0.1, fmt: "%.1f")
                } header: {
                    Text("HAIRLINE RIM · 細外框").sectionLabel()
                } footer: {
                    Text("最外層 strokeBorder、套在所有 inner shadow 之上。CSS 對應 `inset 0 0 0 Npx ...` 細鋒線、增加精細鋒利感。線寬 0.5pt = inset 凹槽用、1.0pt = 一般、>1.5pt = 厚邊框感。opacity 預設 0 = 關閉、建議白色 0.10 試。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LMColorPicker(title: "顏色", color: innerShadowColorBinding)
                    sliderRow("opacity",     value: $innerShadowOpacity, in: 0.0...0.80, step: 0.01)
                    sliderRow("stroke (pt)", value: $innerShadowStroke,  in: 0...20,     step: 1, fmt: "%.0f")
                    sliderRow("blur (pt)",   value: $innerShadowBlur,    in: 0...12,     step: 1, fmt: "%.0f")
                    sliderRow("x (pt)",      value: $innerShadowX,       in: -8...8,     step: 1, fmt: "%.0f")
                    sliderRow("y (pt)",      value: $innerShadowY,       in: -8...8,     step: 1, fmt: "%.0f")
                } header: {
                    Text("INNER SHADOW #1 · 內暈邊緣").sectionLabel()
                } footer: {
                    Text("SwiftUI 無原生 inset shadow、用 mask + blur trick 模擬。stroke = 光環厚度 (越大越深)、blur = 邊緣 falloff (越大越糊)、兩個獨立。\n\n方向慣例同 CSS inset：(+x, +y) = 左上 inset shadow / (-x, -y) = 右下 inset shadow。典型用法：black + stroke 5 + blur 4 + (+2, +2) = 柔軟左上凹槽。opacity 預設 0 = 關閉。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LMColorPicker(title: "顏色", color: innerShadow2ColorBinding)
                    sliderRow("opacity",     value: $innerShadow2Opacity, in: 0.0...0.80, step: 0.01)
                    sliderRow("stroke (pt)", value: $innerShadow2Stroke,  in: 0...20,     step: 1, fmt: "%.0f")
                    sliderRow("blur (pt)",   value: $innerShadow2Blur,    in: 0...12,     step: 1, fmt: "%.0f")
                    sliderRow("x (pt)",      value: $innerShadow2X,       in: -8...8,     step: 1, fmt: "%.0f")
                    sliderRow("y (pt)",      value: $innerShadow2Y,       in: -8...8,     step: 1, fmt: "%.0f")
                } header: {
                    Text("INNER SHADOW #2 · 第二組內暈").sectionLabel()
                } footer: {
                    Text("跟 #1 對打做曲面 pillow。典型用法：white + stroke 5 + blur 4 + (-2, -2) = 右下受光 rim light、跟 #1 black 左上凹陷一起做出方向感曲面。pressed 時 opacity × 0.6 削弱受光。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LMColorPicker(title: "顏色", color: shadowNearColorBinding)
                    sliderRow("opacity",     value: $shadowNearOpacity, in: 0.0...0.50, step: 0.01)
                    sliderRow("radius (pt)", value: $shadowNearRadius,  in: 0...12,     step: 1, fmt: "%.0f")
                    sliderRow("x (pt)",      value: $shadowNearX,       in: -16...16,   step: 1, fmt: "%.0f")
                    sliderRow("y (pt)",      value: $shadowNearY,       in: -16...16,   step: 1, fmt: "%.0f")
                } header: {
                    Text("DROP SHADOW · 近層").sectionLabel()
                } footer: {
                    Text("color 預設深 navy #0F1C26 (對應 web rgba(15,28,38))。dark mode 想做 halo 把 color 換 white、x=0 y=0、radius 拉大。x/y > 0 = directional drop (光從反方向)。")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    LMColorPicker(title: "顏色", color: shadowFarColorBinding)
                    sliderRow("opacity",     value: $shadowFarOpacity, in: 0.0...0.50, step: 0.01)
                    sliderRow("radius (pt)", value: $shadowFarRadius,  in: 0...30,     step: 1, fmt: "%.0f")
                    sliderRow("x (pt)",      value: $shadowFarX,       in: -16...16,   step: 1, fmt: "%.0f")
                    sliderRow("y (pt)",      value: $shadowFarY,       in: -16...16,   step: 1, fmt: "%.0f")
                } header: {
                    Text("DROP SHADOW · 遠層").sectionLabel()
                }

                Section {
                    sliderRow("opacity", value: $noiseOpacity, in: 0.0...0.30, step: 0.01)
                    sliderRow("scale", value: $noiseScale, in: 0.30...1.20, step: 0.05)
                    LMSegmentedPicker(
                        selection: $noiseBlendChoice,
                        options: BlendModeChoice.allCases
                    ) { c in
                        Text(c.label)
                    }
                    .padding(.vertical, 6)
                } header: {
                    Text("PNG NOISE TILE").sectionLabel()
                }

                Section {
                    sliderRow("opacity", value: $textShadowOpacity, in: 0.0...0.80, step: 0.05)
                    sliderRow("y (pt)",  value: $textShadowY,       in: 0...2,      step: 1, fmt: "%.0f")
                } header: {
                    Text("TEXT SHADOW · 雕刻字").sectionLabel()
                }

                Section {
                    sliderRow("cornerRadius (pt)", value: $radius, in: 0...24, step: 1, fmt: "%.0f")
                } header: {
                    Text("CONTINUOUS RADIUS").sectionLabel()
                }

                Section {
                    sliderRow("vertical (pt)",   value: $paddingV, in: 4...24, step: 1, fmt: "%.0f")
                    sliderRow("horizontal (pt)", value: $paddingH, in: 8...40, step: 1, fmt: "%.0f")
                } header: {
                    Text("PADDING").sectionLabel()
                }

                Section {
                    Button {
                        showSpec = true
                    } label: {
                        Label("查看 spec 數值(CSS + SwiftUI)", systemImage: "doc.text")
                    }
                    Button(role: .destructive) {
                        resetDefaults()
                    } label: {
                        Label("還原目前外觀 target", systemImage: "arrow.counterclockwise")
                    }
                }
            }
        }
        // 跟其他頁面統一 · 隱藏系統 nav bar 後，改用 DS 自訂 back button。
        .brandPage()
        .sheet(isPresented: $showSpec) {
            specSheet
        }
    }

    // MARK: - Slider row helper

    @ViewBuilder
    private func sliderRow(_ label: String,
                           value: Binding<Double>,
                           in range: ClosedRange<Double>,
                           step: Double,
                           fmt: String = "%.02f") -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(label)
                    .font(.lmCaption)
                    .foregroundStyle(Color.inkMuted)
                Spacer()
                Text(String(format: fmt, value.wrappedValue))
                    .font(.system(.caption, design: .monospaced))
                    .foregroundStyle(Color.primaryBrand)
            }
            LMSlider(value: value, range: range, step: step)
        }
    }

    // MARK: - Preview body dispatch

    @ViewBuilder
    private func previewBody(isPressed: Bool) -> some View {
        switch previewComponent {
        case .button:
            tactileLook(
                paddingV: paddingV, paddingH: paddingH,
                shape: AnyShape(RoundedRectangle(cornerRadius: radius, style: .continuous)),
                isPressed: isPressed
            ) {
                Text("送出 Primary")
                    .font(.system(.body, design: .default).weight(.semibold))
            }
        case .secondaryButton:
            tactileLook(
                paddingV: paddingV, paddingH: paddingH,
                shape: AnyShape(RoundedRectangle(cornerRadius: radius, style: .continuous)),
                isPressed: isPressed
            ) {
                Text("Cancel Secondary")
                    .font(.system(.body, design: .default).weight(.semibold))
            }
        case .pressed:
            tactileLook(
                paddingV: paddingV, paddingH: paddingH,
                shape: AnyShape(RoundedRectangle(cornerRadius: radius, style: .continuous)),
                isPressed: true
            ) {
                Text("已選取")
                    .font(.system(.body, design: .default).weight(.semibold))
            }
        case .card:
            tactileLook(
                paddingV: 18, paddingH: 22,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 12), style: .continuous)),
                isPressed: isPressed
            ) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Laziness sets your soul free.")
                        .font(.system(.subheadline, design: .default).weight(.semibold))
                }
                .frame(maxWidth: 220, alignment: .leading)
            }
        case .plain:
            tactileLook(
                paddingV: 14, paddingH: 16,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 12), style: .continuous)),
                isPressed: isPressed
            ) {
                HStack(spacing: 12) {
                    Text("01")
                        .font(.lmLabel)
                        .foregroundStyle(Color.inkMuted)
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Plain List Row")
                            .font(.system(.subheadline, design: .default).weight(.semibold))
                        Text("Hybrid container")
                            .font(.caption)
                            .opacity(0.70)
                    }
                    Spacer(minLength: 0)
                }
                .frame(width: 240, alignment: .leading)
            }
        case .chip:
            tactileLook(
                paddingV: 5, paddingH: 12,
                shape: AnyShape(Capsule()),
                isPressed: isPressed
            ) {
                Text("BETA")
                    .chipLabel()
            }
        case .circle:
            tactileLook(
                paddingV: 0, paddingH: 0,
                shape: AnyShape(Circle()),
                isPressed: isPressed
            ) {
                Text("威")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 56, height: 56)
            }
        case .modal:
            tactileLook(
                paddingV: 20, paddingH: 24,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 16), style: .continuous)),
                isPressed: isPressed
            ) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("壞了。")
                        .font(.system(.headline))
                    Text("可能是我沒做對，再試試看 ↻")
                        .font(.system(.footnote))
                        .opacity(0.85)
                }
                .frame(maxWidth: 240, alignment: .leading)
            }
        case .sheet:
            tactileLook(
                paddingV: 18, paddingH: 22,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 18), style: .continuous)),
                isPressed: false
            ) {
                VStack(alignment: .leading, spacing: 8) {
                    Capsule()
                        .fill(baseFillChoice.prefersDarkInk ? Color.inkMuted.opacity(0.45) : Color.inkOnBrand.opacity(0.45))
                        .frame(width: 36, height: 4)
                    Text("Sheet Chrome")
                        .font(.system(.headline))
                    Text("底部 sheet / drawer")
                        .font(.caption)
                        .opacity(0.75)
                }
                .frame(width: 230, alignment: .leading)
            }
        case .alert:
            tactileLook(
                paddingV: 14, paddingH: 16,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 12), style: .continuous)),
                isPressed: false
            ) {
                HStack(spacing: 10) {
                    Image(systemName: "exclamationmark.triangle.fill")
                    VStack(alignment: .leading, spacing: 3) {
                        Text("注意")
                            .font(.system(.subheadline, design: .default).weight(.semibold))
                        Text("這是 inline alert")
                            .font(.caption)
                            .opacity(0.75)
                    }
                }
                .frame(width: 230, alignment: .leading)
            }
        case .toast:
            tactileLook(
                paddingV: 10, paddingH: 14,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 10), style: .continuous)),
                isPressed: isPressed
            ) {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(.footnote))
                    Text("好了")
                        .font(.system(.footnote).weight(.medium))
                }
            }
        case .input:
            tactileLook(
                paddingV: paddingV, paddingH: paddingH,
                shape: AnyShape(RoundedRectangle(cornerRadius: max(radius, 12), style: .continuous)),
                isPressed: false
            ) {
                HStack {
                    Text("name@example.com")
                        .font(.system(size: 14))
                        .opacity(0.45)
                    Spacer(minLength: 0)
                }
                .frame(maxWidth: 260, alignment: .leading)
            }
        case .segmented:
            LMSegmentedPicker(
                selection: $previewSegment,
                options: ["A", "B", "C"]
            ) { item in
                Text(item)
            }
            .frame(width: 220)
        case .switchControl:
            Toggle("啟用", isOn: $previewSwitchOn)
                .toggleStyle(.lmSwitch)
                .font(.lmBodySmall.weight(.semibold))
                .foregroundStyle(Color.ink)
                .frame(width: 180)
        case .sliderControl:
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Texture")
                    Spacer()
                    Text("\(Int(previewSliderValue * 100))%")
                        .monospacedDigit()
                }
                .font(.lmCaption)
                .foregroundStyle(Color.inkMuted)
                LMSlider(value: $previewSliderValue, range: 0...1, step: 0.01)
            }
            .frame(width: 250)
        }
    }

    // MARK: - Tactile look (shared §5.4 配方·跨 component 共用)

    @ViewBuilder
    private func tactileLook<Content: View>(
        paddingV pV: Double,
        paddingH pH: Double,
        shape: AnyShape,
        isPressed: Bool,
        @ViewBuilder content: () -> Content
    ) -> some View {
        content()
            .padding(.vertical, pV)
            .padding(.horizontal, pH)
            .foregroundStyle(baseFillChoice.prefersDarkInk ? Color.ink : Color.inkOnBrand)
            .shadow(color: .black.opacity(textShadowOpacity), radius: 0, y: textShadowY)
            .background { tactileBackground(isPressed: isPressed) }
            .clipShape(shape)
            .overlay { tactileStroke(shape: shape, isPressed: isPressed) }
            .overlay {
                tactileInnerShadow(
                    shape: shape,
                    color: innerShadowColor,
                    opacity: innerShadowOpacity * (isPressed ? 1.4 : 1.0),
                    stroke: innerShadowStroke,
                    blur: innerShadowBlur,
                    x: innerShadowX,
                    y: innerShadowY
                )
            }
            .overlay {
                tactileInnerShadow(
                    shape: shape,
                    color: innerShadow2Color,
                    opacity: innerShadow2Opacity * (isPressed ? 0.6 : 1.0),
                    stroke: innerShadow2Stroke,
                    blur: innerShadow2Blur,
                    x: innerShadow2X,
                    y: innerShadow2Y
                )
            }
            .overlay {
                shape
                    .stroke(hairlineColor.opacity(hairlineOpacity), lineWidth: hairlineWidth)
                    .allowsHitTesting(false)
            }
            .shadow(
                color: shadowNearColor.opacity(isPressed ? min(shadowNearOpacity, 0.10) : shadowNearOpacity),
                radius: isPressed ? 2 : shadowNearRadius,
                x: isPressed ? 0 : shadowNearX,
                y: isPressed ? 1 : shadowNearY
            )
            .shadow(
                color: shadowFarColor.opacity(isPressed ? 0 : shadowFarOpacity),
                radius: isPressed ? 0 : shadowFarRadius,
                x: isPressed ? 0 : shadowFarX,
                y: isPressed ? 0 : shadowFarY
            )
            .offset(y: isPressed ? 2 : 0)
            .scaleEffect(isPressed ? 0.985 : 1.0)
    }

    // MARK: - Tactile sub-views (拆 helper 避免 SwiftUI type-check timeout)

    @ViewBuilder
    private func tactileBackground(isPressed: Bool) -> some View {
        GeometryReader { geo in
            // 把絕對 pt 換算回 UnitPoint (highlight band 寬高跟 view 大小無關、跨 component 視覺一致)
            let topUnit = min(1.0, highlightBandHeight / max(geo.size.height, 1))
            let leftUnit = min(1.0, leftHighlightBandWidth / max(geo.size.width, 1))
            ZStack {
                baseFillChoice.color
                Color.black.opacity(fillDarken + (isPressed ? 0.04 : 0.0))
                LinearGradient(
                    colors: isPressed
                        ? [
                            .black.opacity(max(0.18, gradBlackBR * 0.85)),
                            .clear,
                            .white.opacity(max(0.06, gradWhiteTL))
                        ]
                        : [
                            .white.opacity(gradWhiteTL),
                            .clear,
                            .black.opacity(gradBlackBR)
                        ],
                    startPoint: gradientStartPoint,
                    endPoint: gradientEndPoint
                )
                LinearGradient(
                    colors: [.white.opacity(highlightBandOpacity), .clear],
                    startPoint: .top,
                    endPoint: UnitPoint(x: 0.5, y: topUnit)
                )
                .allowsHitTesting(false)
                LinearGradient(
                    colors: [.white.opacity(leftHighlightBandOpacity), .clear],
                    startPoint: .leading,
                    endPoint: UnitPoint(x: leftUnit, y: 0.5)
                )
                .allowsHitTesting(false)
                // Corner highlight (#1d) · radial 從左上角點出發、做 specular hotspot
                RadialGradient(
                    colors: [.white.opacity(cornerHighlightOpacity), .clear],
                    center: UnitPoint(x: 0, y: 0),
                    startRadius: 0,
                    endRadius: cornerHighlightRadius
                )
                .allowsHitTesting(false)
                Rectangle()
                    .fill(ImagePaint(
                        image: Image("TactileNoise"),
                        sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1),
                        scale: CGFloat(noiseScale)
                    ))
                    .opacity(noiseOpacity)
                    .blendMode(noiseBlend)
                    .allowsHitTesting(false)
            }
        }
    }

    @ViewBuilder
    private func tactileStroke(shape: AnyShape, isPressed: Bool) -> some View {
        shape.stroke(
            LinearGradient(
                colors: isPressed
                    ? [
                        strokeBottomColor.opacity(max(0.28, strokeBottomOpacity)),
                        strokeTopColor.opacity(max(0.10, strokeTopOpacity * 0.35))
                    ]
                    : [
                        strokeTopColor.opacity(strokeTopOpacity),
                        strokeBottomColor.opacity(strokeBottomOpacity)
                    ],
                startPoint: .top,
                endPoint: .bottom
            ),
            lineWidth: strokeWidth
        )
    }

    /// Inner shadow (mask + blur trick · SwiftUI 沒原生 inset shadow)
    /// stroke = 光環厚度 (一半在外被 mask 切掉、一半在內形成 inner ring)
    /// blur   = 邊緣 falloff 柔軟度 (跟 stroke 解耦、可獨立調)
    @ViewBuilder
    private func tactileInnerShadow(
        shape: AnyShape,
        color: Color,
        opacity: Double,
        stroke: Double,
        blur: Double,
        x: Double,
        y: Double
    ) -> some View {
        shape
            .stroke(color.opacity(opacity), lineWidth: max(0.001, stroke))
            .blur(radius: blur)
            .offset(x: x, y: y)
            .mask(shape)
            .allowsHitTesting(false)
    }

    private func playPressAnimation() {
        guard previewComponent.isInteractive else { return }
        withAnimation(.easeOut(duration: 0.08)) {
            isPreviewPressed = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.32) {
            withAnimation(.spring(response: 0.24, dampingFraction: 0.72)) {
                isPreviewPressed = false
            }
        }
    }

    // MARK: - Color hex helpers (cross-platform)

    private func rgbComponents(of color: Color) -> (r: Double, g: Double, b: Double)? {
        #if os(iOS) || os(visionOS) || os(tvOS) || os(watchOS)
        let ui = UIColor(color)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        ui.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (Double(r), Double(g), Double(b))
        #elseif os(macOS)
        guard let ns = NSColor(color).usingColorSpace(.sRGB) else { return nil }
        return (Double(ns.redComponent), Double(ns.greenComponent), Double(ns.blueComponent))
        #else
        return nil
        #endif
    }

    private func hex(of color: Color) -> String {
        guard let c = rgbComponents(of: color) else { return "—" }
        return String(format: "#%02X%02X%02X",
                      Int((c.r * 255).rounded()),
                      Int((c.g * 255).rounded()),
                      Int((c.b * 255).rounded()))
    }

    private func rgba(of color: Color, opacity: Double) -> String {
        guard let c = rgbComponents(of: color) else { return "rgba(0,0,0,\(opacity))" }
        let r = Int((c.r * 255).rounded())
        let g = Int((c.g * 255).rounded())
        let b = Int((c.b * 255).rounded())
        return "rgba(\(r),\(g),\(b),\(String(format: "%.02f", opacity)))"
    }

    // MARK: - Gradient angle helper (CSS angle → SwiftUI UnitPoint)
    // CSS: 0° = up, 90° = right, 180° = down, 270° = left, 135° = top-left → bottom-right
    // direction vector: (sin θ, -cos θ) in SwiftUI coord (x→right, y→down)

    private var gradientStartPoint: UnitPoint {
        let radians = gradAngle * .pi / 180
        let dx = sin(radians)
        let dy = -cos(radians)
        return UnitPoint(x: 0.5 - dx * 0.5, y: 0.5 - dy * 0.5)
    }

    private var gradientEndPoint: UnitPoint {
        let radians = gradAngle * .pi / 180
        let dx = sin(radians)
        let dy = -cos(radians)
        return UnitPoint(x: 0.5 + dx * 0.5, y: 0.5 + dy * 0.5)
    }

    // MARK: - Reset

    private func resetDefaults() {
        switch previewComponent {
        case .button:
            applyRaisedTarget(base: .primaryBrand)
        case .secondaryButton:
            applySecondaryTarget()
        case .pressed:
            applyPressedTarget()
        case .card, .modal, .sheet, .alert, .toast:
            applyBaseTarget()
        case .plain:
            applyPlainTarget()
        case .chip:
            applyPillTarget()
        case .circle:
            applyCircleTarget()
        case .input:
            applyInsetTarget()
        case .segmented:
            applySegmentedTarget()
        case .switchControl:
            applySwitchTarget()
        case .sliderControl:
            applySliderTarget()
        }
    }

    private func applyRaisedTarget(base: BaseFillChoice) {
        setTarget(
            base: base, fill: 0, white: 0.10, black: 0.10,
            strokeTop: "000000", strokeTopAlpha: 0.10,
            strokeBottom: "000000", strokeBottomAlpha: 0.10,
            shadow1Alpha: 0.50, shadow1Radius: 3, shadow1X: 5, shadow1Y: 5,
            shadow2Alpha: 0.50, shadow2Radius: 3, shadow2X: 5, shadow2Y: 5,
            noiseAlpha: 0.30, noiseScaleValue: 1.0,
            blend: colorScheme == .dark ? .softLight : .overlay,
            textAlpha: 0.80, textY: 2,
            corner: 12, padV: 12, padH: 22
        )
    }

    private func applySecondaryTarget() {
        setTarget(
            base: .bg, fill: 0, white: 0, black: 0,
            strokeTop: colorScheme == .dark ? "F5EFE4" : "967459",
            strokeTopAlpha: colorScheme == .dark ? 0.08 : 0.30,
            strokeBottom: colorScheme == .dark ? "F5EFE4" : "967459",
            strokeBottomAlpha: colorScheme == .dark ? 0.08 : 0.30,
            hairline: colorScheme == .dark ? "F5EFE4" : "967459",
            hairlineAlpha: colorScheme == .dark ? 0.08 : 0.30,
            shadow1Alpha: 0.50, shadow1Radius: 3, shadow1X: 5, shadow1Y: 5,
            shadow2Alpha: 0.50, shadow2Radius: 3, shadow2X: 5, shadow2Y: 5,
            noiseAlpha: colorScheme == .dark ? 0.70 : 0.55, noiseScaleValue: 1.0,
            blend: colorScheme == .dark ? .softLight : .overlay,
            textAlpha: 0, textY: 0,
            corner: 12, padV: 12, padH: 22
        )
    }

    private func applyBaseTarget() {
        setTarget(
            base: .bgRaised, fill: 0,
            white: colorScheme == .dark ? 0.04 : 0.08,
            black: colorScheme == .dark ? 0.10 : 0.04,
            strokeTop: colorScheme == .dark ? "FFFFFF" : "000000",
            strokeTopAlpha: colorScheme == .dark ? 0.03 : 0.05,
            strokeBottom: colorScheme == .dark ? "FFFFFF" : "000000",
            strokeBottomAlpha: colorScheme == .dark ? 0.03 : 0.05,
            shadow1: "000000",
            shadow1Alpha: colorScheme == .dark ? 0.45 : 0.12,
            shadow1Radius: 14, shadow1X: 4, shadow1Y: 6,
            shadow2Alpha: 0, shadow2Radius: 0, shadow2X: 0, shadow2Y: 0,
            noiseAlpha: colorScheme == .dark ? 0.75 : 0.55, noiseScaleValue: 1.0,
            blend: colorScheme == .dark ? .softLight : .overlay,
            textAlpha: 0, textY: 0,
            corner: 20, padV: 18, padH: 22
        )
    }

    private func applyPlainTarget() {
        setTarget(
            base: .bg, fill: 0, white: 0, black: 0,
            strokeTop: colorScheme == .dark ? "5E7A8D" : "967459",
            strokeTopAlpha: 0.30,
            strokeBottom: colorScheme == .dark ? "5E7A8D" : "967459",
            strokeBottomAlpha: 0.30,
            hairline: colorScheme == .dark ? "5E7A8D" : "967459",
            hairlineAlpha: 0.30,
            shadow1: "000000",
            shadow1Alpha: colorScheme == .dark ? 0.35 : 0.10,
            shadow1Radius: 3, shadow1X: 2, shadow1Y: 2,
            shadow2Alpha: 0, shadow2Radius: 0, shadow2X: 0, shadow2Y: 0,
            noiseAlpha: 0, noiseScaleValue: 1.0,
            blend: .overlay,
            textAlpha: 0, textY: 0,
            corner: 14, padV: 14, padH: 16
        )
    }

    private func applyInsetTarget() {
        setTarget(
            base: .bg, fill: 0, white: 0, black: 0,
            strokeTop: colorScheme == .dark ? "FFFFFF" : "000000",
            strokeTopAlpha: colorScheme == .dark ? 0.04 : 0.06,
            strokeBottom: colorScheme == .dark ? "FFFFFF" : "000000",
            strokeBottomAlpha: colorScheme == .dark ? 0.04 : 0.06,
            strokeLine: 0.5,
            hairline: colorScheme == .dark ? "FFFFFF" : "000000",
            hairlineAlpha: colorScheme == .dark ? 0.04 : 0.06,
            hairlineLine: 0.5,
            shadow1Alpha: 0, shadow1Radius: 0, shadow1X: 0, shadow1Y: 0,
            shadow2Alpha: 0, shadow2Radius: 0, shadow2X: 0, shadow2Y: 0,
            inner1Alpha: colorScheme == .dark ? 0.50 : 0.35,
            inner1StrokeValue: 5, inner1BlurValue: 3, inner1XValue: 2, inner1YValue: 2,
            inner2Alpha: colorScheme == .dark ? 0.30 : 0.15,
            inner2StrokeValue: 4, inner2BlurValue: 2, inner2XValue: 0, inner2YValue: 0,
            noiseAlpha: 0, noiseScaleValue: 1.0,
            blend: .overlay,
            textAlpha: 0, textY: 0,
            corner: 16, padV: 14, padH: 18
        )
    }

    private func applyPressedTarget() {
        setTarget(
            base: .stone, fill: 0, white: 0.06, black: 0.15,
            strokeTop: "000000", strokeTopAlpha: 0.20,
            strokeBottom: "000000", strokeBottomAlpha: 0.20,
            shadow1: "000000",
            shadow1Alpha: 0.30, shadow1Radius: 1, shadow1X: 1, shadow1Y: 1,
            shadow2Alpha: 0, shadow2Radius: 0, shadow2X: 0, shadow2Y: 0,
            noiseAlpha: colorScheme == .dark ? 0.15 : 0.20, noiseScaleValue: 1.0,
            blend: colorScheme == .dark ? .softLight : .overlay,
            textAlpha: 0.50, textY: 1,
            corner: 12, padV: 12, padH: 22
        )
    }

    private func applyPillTarget() {
        applyRaisedTarget(base: .primaryBrand)
        shadowNearOpacity = colorScheme == .dark ? 0.40 : 0.30
        shadowNearRadius = 2
        shadowNearX = 3
        shadowNearY = 3
        shadowFarOpacity = 0
        noiseOpacity = colorScheme == .dark ? 0.20 : 0.30
        textShadowOpacity = colorScheme == .dark ? 0.40 : 0.50
        radius = 16
        paddingV = 5
        paddingH = 12
    }

    private func applyCircleTarget() {
        applyPillTarget()
        paddingV = 0
        paddingH = 0
    }

    private func applySegmentedTarget() {
        setTarget(
            base: colorScheme == .dark ? .primaryDeep : .stone,
            fill: 0,
            white: colorScheme == .dark ? 0.06 : 0.12,
            black: colorScheme == .dark ? 0.16 : 0.14,
            strokeTop: "000000", strokeTopAlpha: colorScheme == .dark ? 0.25 : 0.18,
            strokeBottom: "000000", strokeBottomAlpha: colorScheme == .dark ? 0.25 : 0.18,
            shadow1: "000000",
            shadow1Alpha: colorScheme == .dark ? 0.45 : 0.22,
            shadow1Radius: 2, shadow1X: 1, shadow1Y: 2,
            shadow2Alpha: 0, shadow2Radius: 0, shadow2X: 0, shadow2Y: 0,
            noiseAlpha: colorScheme == .dark ? 0.20 : 0.28, noiseScaleValue: 1.0,
            blend: colorScheme == .dark ? .softLight : .overlay,
            textAlpha: colorScheme == .dark ? 0.40 : 0.50, textY: 2,
            corner: 18, padV: 7, padH: 18
        )
    }

    private func applySwitchTarget() {
        applySegmentedTarget()
        radius = 14
        paddingV = 3
        paddingH = 3
    }

    private func applySliderTarget() {
        applyCircleTarget()
        radius = 11
    }

    private func setTarget(
        base: BaseFillChoice,
        fill: Double,
        white: Double,
        black: Double,
        strokeTop: String,
        strokeTopAlpha: Double,
        strokeBottom: String,
        strokeBottomAlpha: Double,
        strokeLine: Double = 1.0,
        hairline: String = "FFFFFF",
        hairlineAlpha: Double = 0.0,
        hairlineLine: Double = 1.0,
        shadow1: String = "0F1C26",
        shadow1Alpha: Double,
        shadow1Radius: Double,
        shadow1X: Double,
        shadow1Y: Double,
        shadow2: String = "0F1C26",
        shadow2Alpha: Double,
        shadow2Radius: Double,
        shadow2X: Double,
        shadow2Y: Double,
        inner1: String = "000000",
        inner1Alpha: Double = 0.0,
        inner1StrokeValue: Double = 8,
        inner1BlurValue: Double = 4,
        inner1XValue: Double = 0,
        inner1YValue: Double = -2,
        inner2: String = "FFFFFF",
        inner2Alpha: Double = 0.0,
        inner2StrokeValue: Double = 8,
        inner2BlurValue: Double = 4,
        inner2XValue: Double = 0,
        inner2YValue: Double = 2,
        noiseAlpha: Double,
        noiseScaleValue: Double,
        blend: BlendModeChoice,
        textAlpha: Double,
        textY: Double,
        corner: Double,
        padV: Double,
        padH: Double
    ) {
        baseFillChoice = base
        fillDarken = fill
        gradAngle = 170
        gradWhiteTL = white
        gradBlackBR = black
        highlightBandOpacity = 0
        highlightBandHeight = 12
        leftHighlightBandOpacity = 0
        leftHighlightBandWidth = 12
        cornerHighlightOpacity = 0
        cornerHighlightRadius = 40
        strokeTopColorHex = strokeTop
        strokeTopOpacity = strokeTopAlpha
        strokeBottomColorHex = strokeBottom
        strokeBottomOpacity = strokeBottomAlpha
        strokeWidth = strokeLine
        hairlineColorHex = hairline
        hairlineOpacity = hairlineAlpha
        hairlineWidth = hairlineLine
        shadowNearColorHex = shadow1
        shadowNearOpacity = shadow1Alpha
        shadowNearRadius = shadow1Radius
        shadowNearX = shadow1X
        shadowNearY = shadow1Y
        shadowFarColorHex = shadow2
        shadowFarOpacity = shadow2Alpha
        shadowFarRadius = shadow2Radius
        shadowFarX = shadow2X
        shadowFarY = shadow2Y
        innerShadowColorHex = inner1
        innerShadowOpacity = inner1Alpha
        innerShadowStroke = inner1StrokeValue
        innerShadowBlur = inner1BlurValue
        innerShadowX = inner1XValue
        innerShadowY = inner1YValue
        innerShadow2ColorHex = inner2
        innerShadow2Opacity = inner2Alpha
        innerShadow2Stroke = inner2StrokeValue
        innerShadow2Blur = inner2BlurValue
        innerShadow2X = inner2XValue
        innerShadow2Y = inner2YValue
        noiseOpacity = noiseAlpha
        noiseScale = noiseScaleValue
        noiseBlendChoice = blend
        textShadowOpacity = textAlpha
        textShadowY = textY
        radius = corner
        paddingV = padV
        paddingH = padH
    }

    // MARK: - Spec sheet

    private var blendName: String { noiseBlendChoice.swiftName }
    private var cssBlendName: String { noiseBlendChoice.cssName }

    private var specText: String {
        let f02: (Double) -> String = { String(format: "%.02f", $0) }
        let i: (Double) -> String = { String(Int($0)) }
        let f1: (Double) -> String = { String(format: "%.1f", $0) }
        let noiseSize = Int(256 * noiseScale)

        let bandHeightPt = i(highlightBandHeight)
        let leftBandWidthPt = i(leftHighlightBandWidth)

        return """
        // ───────────────────────────────────────────────
        // SwiftUI tactileRaised() params
        // ───────────────────────────────────────────────
        fill:        \(baseFillChoice.hexCSS) \(baseFillChoice.displayName) + black overlay \(f02(fillDarken))
        gradient:    angle \(i(gradAngle))° · white \(f02(gradWhiteTL)) → clear → black \(f02(gradBlackBR))
        top hl:      opacity \(f02(highlightBandOpacity)), height \(bandHeightPt)pt (vertical white→clear)
        left hl:     opacity \(f02(leftHighlightBandOpacity)), width \(leftBandWidthPt)pt (horizontal white→clear)
        corner hl:   opacity \(f02(cornerHighlightOpacity)), radius \(i(cornerHighlightRadius))pt (radial from top-left)
        stroke:      top \(hex(of: strokeTopColor)) opacity \(f02(strokeTopOpacity)) → bottom \(hex(of: strokeBottomColor)) opacity \(f02(strokeBottomOpacity)),
                     width \(f1(strokeWidth))pt
        hairline:    \(hex(of: hairlineColor)) opacity \(f02(hairlineOpacity)), width \(f1(hairlineWidth))pt
        shadow #1:   \(hex(of: shadowNearColor)) opacity \(f02(shadowNearOpacity)), radius \(i(shadowNearRadius)), x \(i(shadowNearX)), y \(i(shadowNearY))
        shadow #2:   \(hex(of: shadowFarColor)) opacity \(f02(shadowFarOpacity)), radius \(i(shadowFarRadius)), x \(i(shadowFarX)), y \(i(shadowFarY))
        inner #1:    \(hex(of: innerShadowColor)) opacity \(f02(innerShadowOpacity)), stroke \(i(innerShadowStroke))pt, blur \(i(innerShadowBlur))pt, x \(i(innerShadowX)), y \(i(innerShadowY))
        inner #2:    \(hex(of: innerShadow2Color)) opacity \(f02(innerShadow2Opacity)), stroke \(i(innerShadow2Stroke))pt, blur \(i(innerShadow2Blur))pt, x \(i(innerShadow2X)), y \(i(innerShadow2Y))
        noise:       opacity \(f02(noiseOpacity)), scale \(f02(noiseScale)), blend \(blendName)
        text shadow: opacity \(f02(textShadowOpacity)), y \(i(textShadowY))
        radius:      \(i(radius))pt continuous
        padding:     V \(i(paddingV))pt × H \(i(paddingH))pt

        // ───────────────────────────────────────────────
        // CSS 等價 (web 端 .btn--primary)
        // ───────────────────────────────────────────────
        background-color: color-mix(in srgb, \(baseFillChoice.hexCSS) \(Int((1 - fillDarken) * 100))%, black);
        background-image:
          radial-gradient(circle at 0% 0%,
            rgba(255,255,255,\(f02(cornerHighlightOpacity))) 0,
            transparent \(i(cornerHighlightRadius))px),
          linear-gradient(180deg,
            rgba(255,255,255,\(f02(highlightBandOpacity))) 0,
            transparent \(bandHeightPt)px),
          linear-gradient(90deg,
            rgba(255,255,255,\(f02(leftHighlightBandOpacity))) 0,
            transparent \(leftBandWidthPt)px),
          linear-gradient(\(i(gradAngle))deg,
            rgba(255,255,255,\(f02(gradWhiteTL))) 0%,
            transparent 50%,
            rgba(0,0,0,\(f02(gradBlackBR))) 100%),
          url('/assets/tactile-noise.png');
        background-size: auto, auto, auto, auto, \(noiseSize)px \(noiseSize)px;
        background-blend-mode: normal, normal, normal, normal, \(cssBlendName);
        box-shadow:
          inset 0 0 0 \(f1(hairlineWidth))px \(rgba(of: hairlineColor, opacity: hairlineOpacity)),
          inset 0 \(f1(strokeWidth))px 0 \(rgba(of: strokeTopColor, opacity: strokeTopOpacity)),
          inset 0 -\(f1(strokeWidth))px 0 \(rgba(of: strokeBottomColor, opacity: strokeBottomOpacity)),
          inset \(i(innerShadowX))px \(i(innerShadowY))px \(i(innerShadowBlur * 2))px \(i(innerShadowStroke - innerShadowBlur))px \(rgba(of: innerShadowColor, opacity: innerShadowOpacity)),
          inset \(i(innerShadow2X))px \(i(innerShadow2Y))px \(i(innerShadow2Blur * 2))px \(i(innerShadow2Stroke - innerShadow2Blur))px \(rgba(of: innerShadow2Color, opacity: innerShadow2Opacity)),
          \(i(shadowNearX))px \(i(shadowNearY))px \(i(shadowNearRadius))px \(rgba(of: shadowNearColor, opacity: shadowNearOpacity)),
          \(i(shadowFarX))px \(i(shadowFarY))px \(i(shadowFarRadius))px \(rgba(of: shadowFarColor, opacity: shadowFarOpacity));
        border-radius: \(i(radius))px;
        text-shadow: 0 \(i(textShadowY))px 0 rgba(0,0,0,\(f02(textShadowOpacity)));
        padding: \(i(paddingV))px \(i(paddingH))px;
        """
    }

    private var specSheet: some View {
        NavigationStack {
            ScrollView {
                Text(specText)
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundStyle(Color.ink)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .textSelection(.enabled)
            }
            .navigationTitle("Spec 數值")
            #if os(iOS)
            .toolbarBackground(Color.bg, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            #endif
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("關閉") { showSpec = false }
                        .tint(Color.primaryBrand)
                }
            }
        }
        .lmSheetChrome()
    }
}

#Preview {
    NavigationStack {
        TunerView()
    }
}
