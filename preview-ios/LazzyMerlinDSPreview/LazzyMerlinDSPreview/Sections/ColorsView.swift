import SwiftUI

struct ColorsView: View {

    private let lightRoles: [ColorSwatch] = [
        .init(name: "BG / BG-RAISED", hex: "#F5EFE4", color: .bg),
        .init(name: "BG-MUTED", hex: "#DECCA7", color: .bgMuted),
        .init(name: "INK", hex: "#0F1C26", color: .ink),
        .init(name: "INK-MUTED", hex: "#4E3029", color: .inkMuted),
        .init(name: "PRIMARY", hex: "#46647C", color: .primaryBrand),
        .init(name: "PRIMARY-SOFT", hex: "#5E7A8D", color: .primarySoft),
        .init(name: "PRIMARY-DEEP", hex: "#334D5C", color: .primaryDeep),
        .init(name: "STONE", hex: "#967459", color: .stone)
    ]

    private let statusRoles: [ColorSwatch] = [
        .init(name: "ERROR", hex: "#9E5949", color: .earthRed),
        .init(name: "SUCCESS", hex: "#596751", color: .earthGreen),
        .init(name: "WARNING", hex: "#CB9B52", color: .earthOchre)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {
                LMSection("ROLE TOKENS") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: LMSpacing.md)], spacing: LMSpacing.md) {
                        ForEach(lightRoles) { swatch in
                            swatchCard(swatch)
                        }
                    }
                }

                LMSection("EARTH TONE STATUS") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: LMSpacing.md)], spacing: LMSpacing.md) {
                        ForEach(statusRoles) { swatch in
                            swatchCard(swatch)
                        }
                    }
                }

                LMSection("ALPHA TOKENS") {
                    HStack(spacing: LMSpacing.md) {
                        alphaCard("HAIRLINE", base: Color.bg, fill: Color.hairline)
                        alphaCard("BORDER", base: Color.bg, fill: Color.border)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Colors")
        .brandPage()
    }

    @ViewBuilder
    private func swatchCard(_ swatch: ColorSwatch) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(swatch.color)
                .frame(height: 84)
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .strokeBorder(Color.hairline, lineWidth: 1)
                }
            Text(swatch.name)
                .font(.lmLabel)
                .foregroundStyle(Color.ink)
            Text(swatch.hex)
                .font(.lmCaption.monospaced())
                .foregroundStyle(Color.inkMuted)
        }
        .padding(LMSpacing.md)
        .tactilePlain(radius: 12)
    }

    @ViewBuilder
    private func alphaCard(_ name: String, base: Color, fill: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(base)
                .overlay {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(fill)
                        .padding(LMSpacing.md)
                }
                .frame(height: 84)
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .strokeBorder(Color.hairline, lineWidth: 1)
                }
            Text(name)
                .font(.lmLabel)
                .foregroundStyle(Color.ink)
        }
        .padding(LMSpacing.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .tactilePlain(radius: 12)
    }

}

private struct ColorSwatch: Identifiable {
    let id = UUID()
    let name: String
    let hex: String
    let color: Color
}

#Preview {
    NavigationStack {
        ColorsView()
    }
}
