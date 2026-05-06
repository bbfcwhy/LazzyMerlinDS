import SwiftUI

// LazzyMerlin DS · Color Picker
// 取代 SwiftUI ColorPicker · 系統 hue/saturation wheel + Liquid Glass
// 結構：trigger row (label + 圓 swatch + hex 字) · sheet 含 hex input + RGB sliders + brand palette

struct LMColorPicker: View {

    let title: String
    @Binding var color: Color
    var supportsOpacity: Bool = false
    var palette: [String] = LMColorPicker.defaultPalette

    @State private var showSheet: Bool = false
    @Environment(\.colorScheme) private var colorScheme

    static let defaultPalette: [String] = [
        // brand
        "F5EFE4", "DECCA7", "967459", "4E3029",
        "0F1C26", "334D5C", "46647C", "5E7A8D",
        // earth
        "9E5949", "596751", "CB9B52",
        // greyscale
        "FFFFFF", "AAAAAA", "555555", "000000"
    ]

    var body: some View {
        Button {
            showSheet = true
        } label: {
            HStack {
                Text(title)
                    .font(.lmBody)
                    .foregroundStyle(Color.ink)
                Spacer()
                Circle()
                    .fill(color)
                    .frame(width: 22, height: 22)
                    .overlay {
                        Circle()
                            .strokeBorder(Color.black.opacity(0.18), lineWidth: 0.8)
                    }
                Text("#" + color.toHexString())
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundStyle(Color.inkMuted)
                Image(systemName: "chevron.right")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(Color.inkMuted.opacity(0.55))
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showSheet) {
            LMColorPickerSheet(
                title: title,
                color: $color,
                palette: palette,
                dismiss: { showSheet = false }
            )
            .lmSheetChrome()
            .presentationDetents([.medium, .large])
        }
    }
}

private struct LMColorPickerSheet: View {

    let title: String
    @Binding var color: Color
    let palette: [String]
    let dismiss: () -> Void

    @State private var hexText: String = ""
    @State private var r: Double = 0
    @State private var g: Double = 0
    @State private var b: Double = 0
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(spacing: 0) {
            header
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    preview
                    hexSection
                    rgbSection
                    paletteSection
                }
                .padding(20)
            }
        }
        .onAppear { sync(from: color) }
    }

    private var header: some View {
        HStack {
            Text(title)
                .font(.lmH3)
                .foregroundStyle(Color.ink)
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.inkMuted)
                    .frame(width: 32, height: 32)
                    .background(Circle().fill(Color.bgMuted))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }

    private var preview: some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(color)
            .frame(height: 88)
            .overlay {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .strokeBorder(Color.black.opacity(0.10), lineWidth: 1)
            }
    }

    private var hexSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("HEX")
                .font(.lmCaption)
                .foregroundStyle(Color.inkMuted)
            HStack {
                Text("#")
                    .font(.system(.body, design: .monospaced))
                    .foregroundStyle(Color.inkMuted)
                TextField("000000", text: $hexText)
                    .font(.system(.body, design: .monospaced))
                    .foregroundStyle(Color.ink)
                    #if os(iOS)
                    .textInputAutocapitalization(.characters)
                    #endif
                    .autocorrectionDisabled()
                    .onSubmit { applyHex() }
                    .onChange(of: hexText) { _, new in
                        if new.count == 6 { applyHex() }
                    }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .tactileInset(radius: 12)
        }
    }

    private var rgbSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("RGB")
                .font(.lmCaption)
                .foregroundStyle(Color.inkMuted)
            rgbSlider("R", value: $r)
            rgbSlider("G", value: $g)
            rgbSlider("B", value: $b)
        }
    }

    @ViewBuilder
    private func rgbSlider(_ label: String, value: Binding<Double>) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(label)
                    .font(.system(.footnote, design: .monospaced).weight(.semibold))
                    .foregroundStyle(Color.ink)
                    .frame(width: 18, alignment: .leading)
                Spacer()
                Text(String(format: "%.0f", value.wrappedValue))
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundStyle(Color.primaryBrand)
            }
            LMSlider(value: value, range: 0...255, step: 1)
                .onChange(of: value.wrappedValue) { _, _ in
                    applyRGB()
                }
        }
    }

    private var paletteSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("BRAND PALETTE")
                .font(.lmCaption)
                .foregroundStyle(Color.inkMuted)
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 6),
                spacing: 8
            ) {
                ForEach(palette, id: \.self) { hex in
                    Button {
                        let c = Color(hexString: hex)
                        color = c
                        sync(from: c)
                    } label: {
                        Circle()
                            .fill(Color(hexString: hex))
                            .frame(height: 38)
                            .overlay {
                                Circle()
                                    .strokeBorder(
                                        currentHex == hex ? Color.primaryBrand : Color.black.opacity(0.12),
                                        lineWidth: currentHex == hex ? 2.5 : 0.8
                                    )
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    // MARK: - Sync helpers

    private var currentHex: String { color.toHexString() }

    private func sync(from c: Color) {
        let hex = c.toHexString()
        hexText = hex
        if let comp = rgbComponents(c) {
            r = comp.r * 255
            g = comp.g * 255
            b = comp.b * 255
        }
    }

    private func applyHex() {
        let cleaned = hexText.uppercased().filter { $0.isHexDigit }
        guard cleaned.count == 6 else { return }
        hexText = cleaned
        let c = Color(hexString: cleaned)
        color = c
        if let comp = rgbComponents(c) {
            r = comp.r * 255
            g = comp.g * 255
            b = comp.b * 255
        }
    }

    private func applyRGB() {
        let c = Color(red: r / 255, green: g / 255, blue: b / 255)
        color = c
        hexText = c.toHexString()
    }

    private func rgbComponents(_ c: Color) -> (r: Double, g: Double, b: Double)? {
        #if os(iOS) || os(visionOS) || os(tvOS) || os(watchOS)
        let ui = UIColor(c)
        var rr: CGFloat = 0, gg: CGFloat = 0, bb: CGFloat = 0, aa: CGFloat = 0
        ui.getRed(&rr, green: &gg, blue: &bb, alpha: &aa)
        return (Double(rr), Double(gg), Double(bb))
        #elseif os(macOS)
        guard let ns = NSColor(c).usingColorSpace(.sRGB) else { return nil }
        return (Double(ns.redComponent), Double(ns.greenComponent), Double(ns.blueComponent))
        #else
        return nil
        #endif
    }
}
