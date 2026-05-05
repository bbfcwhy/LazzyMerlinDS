import SwiftUI

// LazzyMerlin DS Tactile Raised tuner
// 即時拖拉 slider 調整 §5.4.1 共通六件配方所有參數，肉眼校到「分不太出來」
// 校好後按「查看 spec 數值」，把數值寫回 spec + components-preview.html + TactileMaterial.swift

struct ButtonsTunerView: View {
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - BASE FILL
    @State private var fillDarken: Double = 0.10

    // MARK: - 對角 GRADIENT (#1)
    @State private var gradWhiteTL: Double = 0.06
    @State private var gradBlackBR: Double = 0.30

    // MARK: - 單層 STROKE (#2)
    @State private var strokeWhiteTop: Double = 0.34
    @State private var strokeBlackBottom: Double = 0.34
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
                VStack(spacing: 14) {
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
            .frame(height: 220)

            Divider()

            // MARK: - Sliders Form
            Form {
                Section {
                    sliderRow("black overlay", value: $fillDarken, in: 0.0...0.30, step: 0.01)
                } header: {
                    Text("BASE FILL · 底色密度").sectionLabel()
                }

                Section {
                    sliderRow("頂左 white",  value: $gradWhiteTL,  in: 0.0...0.20, step: 0.01)
                    sliderRow("底右 black",  value: $gradBlackBR,  in: 0.0...0.40, step: 0.01)
                } header: {
                    Text("對角 GRADIENT (135°)").sectionLabel()
                }

                Section {
                    sliderRow("頂緣 white",  value: $strokeWhiteTop,    in: 0.0...0.50, step: 0.01)
                    sliderRow("底緣 black",  value: $strokeBlackBottom, in: 0.0...0.50, step: 0.01)
                    sliderRow("線寬 (pt)",   value: $strokeWidth,       in: 0.5...3.0,  step: 0.1, fmt: "%.1f")
                } header: {
                    Text("單層 STROKE · 上亮下暗").sectionLabel()
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
                    sliderRow("opacity",     value: $shadowFarOpacity, in: 0.0...0.40, step: 0.01)
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
                    Color.primaryBrand
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
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
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
                                    .black.opacity(max(0.28, strokeBlackBottom)),
                                    .white.opacity(max(0.10, strokeWhiteTop * 0.35))
                                ]
                                : [
                                    .white.opacity(strokeWhiteTop),
                                    .black.opacity(strokeBlackBottom)
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

    // MARK: - Reset

    private func resetDefaults() {
        if colorScheme == .dark {
            applyWebDarkTarget()
        } else {
            applyWebLightTarget()
        }
    }

    private func applyWebLightTarget() {
        fillDarken = 0.10
        gradWhiteTL = 0.06
        gradBlackBR = 0.30
        strokeWhiteTop = 0.34
        strokeBlackBottom = 0.34
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
        fillDarken = 0.06
        gradWhiteTL = 0.04
        gradBlackBR = 0.30
        strokeWhiteTop = 0.15
        strokeBlackBottom = 0.40
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
        fill:        primaryBrand + black overlay \(f02(fillDarken))
        gradient:    white \(f02(gradWhiteTL)) → clear → black \(f02(gradBlackBR))
        stroke:      top white \(f02(strokeWhiteTop)) → bottom black \(f02(strokeBlackBottom)),
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
        background-color: color-mix(in srgb, var(--primary) \(Int((1 - fillDarken) * 100))%, black);
        background-image:
          linear-gradient(135deg,
            rgba(255,255,255,\(f02(gradWhiteTL))) 0%,
            transparent 50%,
            rgba(0,0,0,\(f02(gradBlackBR))) 100%),
          url('/assets/tactile-noise.png');
        background-size: auto, \(noiseSize)px \(noiseSize)px;
        background-blend-mode: normal, \(cssBlendName);
        box-shadow:
          inset 0 1px 0 rgba(255,255,255,\(f02(strokeWhiteTop))),
          inset 0 -1px 0 rgba(0,0,0,\(f02(strokeBlackBottom))),
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
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
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
