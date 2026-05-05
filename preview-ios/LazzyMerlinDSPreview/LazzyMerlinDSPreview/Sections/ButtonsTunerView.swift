import SwiftUI

// LazzyMerlin DS Tactile Raised tuner
// 即時拖拉 slider 調整 §5.4.1 共通六件配方所有參數，肉眼校到「分不太出來」
// 校好後按「查看 spec 數值」，把數值寫回 spec + components-preview.html + TactileMaterial.swift

// MARK: - Base fill color choice
// §2.1 Wood Palette 8 色 RAW VALUES (兩 mode 共用、不翻轉)
// + 主人選定 3 色 Earth Tone (#9E5949 / #6A7A60 / #D4AB6E、跨 mode 同 hex)
// Tuner 用固定 hex 不從 asset 翻轉，方便看每色在 light/dark surface 上各別效果

enum BaseFillChoice: String, CaseIterable, Identifiable {
    // Wood Palette 8 色 (§2.1)
    case parchment, tan, stone, espresso
    case midnight, primaryDeep, primaryBrand, primarySoft
    // Earth Tone 3 色 (主人 v0.2.0-rc 選定)
    case earthRed, earthGreen, earthOchre

    var id: Self { self }

    var label: String {
        switch self {
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
        case .parchment:    return "#F5EFE4"
        case .tan:          return "#DECCA7"
        case .stone:        return "#967459"
        case .espresso:     return "#4E3029"
        case .midnight:     return "#0F1C26"
        case .primaryDeep:  return "#334D5C"
        case .primaryBrand: return "#46647C"
        case .primarySoft:  return "#5E7A8D"
        case .earthRed:     return "#9E5949"
        case .earthGreen:   return "#6A7A60"
        case .earthOchre:   return "#D4AB6E"
        }
    }

    var displayName: String {
        switch self {
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
        case .earthGreen:   return Color(red: 0x6A/255, green: 0x7A/255, blue: 0x60/255)
        case .earthOchre:   return Color(red: 0xD4/255, green: 0xAB/255, blue: 0x6E/255)
        }
    }
}

struct ButtonsTunerView: View {
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - BASE FILL
    @State private var baseFillChoice: BaseFillChoice = .primaryBrand
    @State private var fillDarken: Double = 0.10

    // MARK: - 對角 GRADIENT (#1) · CSS angle (0=up, 90=right, 180=down, 270=left, 135=top-left→bottom-right)
    @State private var gradAngle: Double = 135
    @State private var gradWhiteTL: Double = 0.06
    @State private var gradBlackBR: Double = 0.30

    // MARK: - 單層 STROKE (#2) · default 頂亮(white)底暗(black) = raised 浮雕光源 convention
    @State private var strokeTopColor: Color = .white
    @State private var strokeTopOpacity: Double = 0.34
    @State private var strokeBottomColor: Color = .black
    @State private var strokeBottomOpacity: Double = 0.34
    @State private var strokeWidth: Double = 1.0

    // MARK: - DROP SHADOW 近層 (#3a)
    @State private var shadowNearOpacity: Double = 0.24
    @State private var shadowNearRadius: Double = 5
    @State private var shadowNearX: Double = 0
    @State private var shadowNearY: Double = 3

    // MARK: - DROP SHADOW 遠層 (#3b)
    @State private var shadowFarOpacity: Double = 0.18
    @State private var shadowFarRadius: Double = 14
    @State private var shadowFarX: Double = 0
    @State private var shadowFarY: Double = 9

    // MARK: - PNG NOISE (#4)
    @State private var noiseOpacity: Double = 0.20
    @State private var noiseScale: Double = 0.55
    @State private var noiseBlend: BlendMode = .overlay

    // MARK: - TEXT SHADOW (#5)
    @State private var textShadowOpacity: Double = 0.42
    @State private var textShadowY: Double = 1

    // MARK: - CONTINUOUS RADIUS (#6)
    @State private var radius: Double = 12

    // MARK: - PADDING
    @State private var paddingV: Double = 12
    @State private var paddingH: Double = 22

    @State private var showSpec: Bool = false
    @State private var isPreviewPressed: Bool = false

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Sticky preview area
            ZStack {
                Color.bg
                VStack(spacing: 8) {
                    previewButton("送出 Primary", isPressed: isPreviewPressed)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    guard !isPreviewPressed else { return }
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

                    Button {
                        playPressAnimation()
                    } label: {
                        Label("播放按下動畫", systemImage: "play.fill")
                            .font(.lmCaption)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(Color.inkMuted)
                }
            }
            .frame(height: 140)

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
                    Text("CSS 角度語意：0° 從下到上、90° 從左到右、135° 從左上到右下（預設）、180° 從上到下、270° 從右到左")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Section {
                    ColorPicker("頂緣顏色", selection: $strokeTopColor, supportsOpacity: false)
                    sliderRow("頂緣 opacity",  value: $strokeTopOpacity,    in: 0.0...1.0, step: 0.01)
                    ColorPicker("底緣顏色", selection: $strokeBottomColor, supportsOpacity: false)
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
                    sliderRow("opacity",     value: $shadowNearOpacity, in: 0.0...0.50, step: 0.01)
                    sliderRow("radius (pt)", value: $shadowNearRadius,  in: 0...12,     step: 1, fmt: "%.0f")
                    sliderRow("x (pt)",      value: $shadowNearX,       in: -8...8,     step: 1, fmt: "%.0f")
                    sliderRow("y (pt)",      value: $shadowNearY,       in: 0...6,      step: 1, fmt: "%.0f")
                } header: {
                    Text("DROP SHADOW · 近層").sectionLabel()
                }

                Section {
                    sliderRow("opacity",     value: $shadowFarOpacity, in: 0.0...0.50, step: 0.01)
                    sliderRow("radius (pt)", value: $shadowFarRadius,  in: 0...30,     step: 1, fmt: "%.0f")
                    sliderRow("x (pt)",      value: $shadowFarX,       in: -12...12,   step: 1, fmt: "%.0f")
                    sliderRow("y (pt)",      value: $shadowFarY,       in: 0...16,     step: 1, fmt: "%.0f")
                } header: {
                    Text("DROP SHADOW · 遠層").sectionLabel()
                }

                Section {
                    sliderRow("opacity", value: $noiseOpacity, in: 0.0...0.30, step: 0.01)
                    sliderRow("scale", value: $noiseScale, in: 0.30...1.20, step: 0.05)
                    Picker("blend mode", selection: $noiseBlend) {
                        Text("soft").tag(BlendMode.softLight)
                        Text("overlay").tag(BlendMode.overlay)
                        Text("multiply").tag(BlendMode.multiply)
                        Text("normal").tag(BlendMode.normal)
                    }
                    .pickerStyle(.segmented)
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
                        applyWebLightTarget()
                    } label: {
                        Label("套用 Web Light primary target", systemImage: "sun.max")
                    }
                    Button {
                        applyWebDarkTarget()
                    } label: {
                        Label("套用 Web Dark primary target", systemImage: "moon")
                    }
                    Button {
                        showSpec = true
                    } label: {
                        Label("查看 spec 數值（CSS + SwiftUI）", systemImage: "doc.text")
                    }
                    Button(role: .destructive) {
                        resetDefaults()
                    } label: {
                        Label("還原目前外觀 target", systemImage: "arrow.counterclockwise")
                    }
                }
            }
        }
        .navigationTitle("Buttons Tuner")
        #if os(iOS)
        .toolbarBackground(Color.bg, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        #endif
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
            Slider(value: value, in: range, step: step)
                .tint(Color.primaryBrand)
        }
    }

    // MARK: - Preview button

    @ViewBuilder
    private func previewButton(_ title: String, isPressed: Bool) -> some View {
        Text(title)
            .font(.system(.body, design: .default).weight(.semibold))
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .foregroundStyle(Color.inkOnBrand)
            .shadow(color: .black.opacity(textShadowOpacity),
                    radius: 0, y: textShadowY)
            .background {
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
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(
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
            .shadow(
                color: .black.opacity(isPressed ? min(shadowNearOpacity, 0.10) : shadowNearOpacity),
                radius: isPressed ? 2 : shadowNearRadius,
                x: isPressed ? 0 : shadowNearX,
                y: isPressed ? 1 : shadowNearY
            )
            .shadow(
                color: .black.opacity(isPressed ? 0 : shadowFarOpacity),
                radius: isPressed ? 0 : shadowFarRadius,
                x: isPressed ? 0 : shadowFarX,
                y: isPressed ? 0 : shadowFarY
            )
            .offset(y: isPressed ? 2 : 0)
            .scaleEffect(isPressed ? 0.985 : 1.0)
    }

    private func playPressAnimation() {
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
        if colorScheme == .dark {
            applyWebDarkTarget()
        } else {
            applyWebLightTarget()
        }
    }

    private func applyWebLightTarget() {
        baseFillChoice = .primaryBrand
        fillDarken = 0.10
        gradAngle = 135
        gradWhiteTL = 0.06
        gradBlackBR = 0.30
        strokeTopColor = .white
        strokeTopOpacity = 0.34
        strokeBottomColor = .black
        strokeBottomOpacity = 0.34
        strokeWidth = 1.0
        shadowNearOpacity = 0.24
        shadowNearRadius = 5
        shadowNearX = 0
        shadowNearY = 3
        shadowFarOpacity = 0.18
        shadowFarRadius = 14
        shadowFarX = 0
        shadowFarY = 9
        noiseOpacity = 0.20
        noiseScale = 0.55
        noiseBlend = .overlay
        textShadowOpacity = 0.42
        textShadowY = 1
        radius = 12
        paddingV = 12
        paddingH = 22
    }

    private func applyWebDarkTarget() {
        baseFillChoice = .primaryBrand
        fillDarken = 0.06
        gradAngle = 135
        gradWhiteTL = 0.04
        gradBlackBR = 0.30
        strokeTopColor = .white
        strokeTopOpacity = 0.15
        strokeBottomColor = .black
        strokeBottomOpacity = 0.40
        strokeWidth = 1.0
        shadowNearOpacity = 0.25
        shadowNearRadius = 6
        shadowNearX = 0
        shadowNearY = 2
        shadowFarOpacity = 0.20
        shadowFarRadius = 16
        shadowFarX = 0
        shadowFarY = 8
        noiseOpacity = 0.10
        noiseScale = 0.55
        noiseBlend = .softLight
        textShadowOpacity = 0.40
        textShadowY = 1
        radius = 12
        paddingV = 12
        paddingH = 22
    }

    // MARK: - Spec sheet

    private var blendName: String {
        switch noiseBlend {
        case .softLight: return ".softLight"
        case .overlay:   return ".overlay"
        case .multiply:  return ".multiply"
        default:         return ".normal"
        }
    }

    private var cssBlendName: String {
        switch noiseBlend {
        case .softLight: return "soft-light"
        case .overlay:   return "overlay"
        case .multiply:  return "multiply"
        default:         return "normal"
        }
    }

    private var specText: String {
        let f02: (Double) -> String = { String(format: "%.02f", $0) }
        let i: (Double) -> String = { String(Int($0)) }
        let f1: (Double) -> String = { String(format: "%.1f", $0) }
        let noiseSize = Int(256 * noiseScale)

        return """
        // ───────────────────────────────────────────────
        // SwiftUI tactileRaised() params
        // ───────────────────────────────────────────────
        fill:        \(baseFillChoice.hexCSS) \(baseFillChoice.displayName) + black overlay \(f02(fillDarken))
        gradient:    angle \(i(gradAngle))° · white \(f02(gradWhiteTL)) → clear → black \(f02(gradBlackBR))
        stroke:      top \(hex(of: strokeTopColor)) opacity \(f02(strokeTopOpacity)) → bottom \(hex(of: strokeBottomColor)) opacity \(f02(strokeBottomOpacity)),
                     width \(f1(strokeWidth))pt
        shadow #1:   opacity \(f02(shadowNearOpacity)), radius \(i(shadowNearRadius)), x \(i(shadowNearX)), y \(i(shadowNearY))
        shadow #2:   opacity \(f02(shadowFarOpacity)), radius \(i(shadowFarRadius)), x \(i(shadowFarX)), y \(i(shadowFarY))
        noise:       opacity \(f02(noiseOpacity)), scale \(f02(noiseScale)), blend \(blendName)
        text shadow: opacity \(f02(textShadowOpacity)), y \(i(textShadowY))
        radius:      \(i(radius))pt continuous
        padding:     V \(i(paddingV))pt × H \(i(paddingH))pt

        // ───────────────────────────────────────────────
        // CSS 等價 (web 端 .btn--primary)
        // ───────────────────────────────────────────────
        background-color: color-mix(in srgb, \(baseFillChoice.hexCSS) \(Int((1 - fillDarken) * 100))%, black);
        background-image:
          linear-gradient(\(i(gradAngle))deg,
            rgba(255,255,255,\(f02(gradWhiteTL))) 0%,
            transparent 50%,
            rgba(0,0,0,\(f02(gradBlackBR))) 100%),
          url('/assets/tactile-noise.png');
        background-size: auto, \(noiseSize)px \(noiseSize)px;
        background-blend-mode: normal, \(cssBlendName);
        box-shadow:
          inset 0 1px 0 \(rgba(of: strokeTopColor, opacity: strokeTopOpacity)),
          inset 0 -1px 0 \(rgba(of: strokeBottomColor, opacity: strokeBottomOpacity)),
          \(i(shadowNearX))px \(i(shadowNearY))px \(i(shadowNearRadius))px rgba(15,28,38,\(f02(shadowNearOpacity))),
          \(i(shadowFarX))px \(i(shadowFarY))px \(i(shadowFarRadius))px rgba(15,28,38,\(f02(shadowFarOpacity)));
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .textSelection(.enabled)
            }
            .navigationTitle("Spec 數值")
            .brandPage()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("關閉") { showSpec = false }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ButtonsTunerView()
    }
}
