import SwiftUI

// LazzyMerlin DS · Radius token preview
// LMRadius 7 個值平鋪正方形展示

struct RadiusView: View {

    private struct RadiusItem: Identifiable {
        let id: String
        let label: String
        let value: CGFloat
    }

    private let radii: [RadiusItem] = [
        .init(id: "sm",         label: "sm",         value: LMRadius.sm),
        .init(id: "md",         label: "md",         value: LMRadius.md),
        .init(id: "button",     label: "button",     value: LMRadius.button),
        .init(id: "xl",         label: "xl",         value: LMRadius.xl),
        .init(id: "navCapsule", label: "navCapsule", value: LMRadius.navCapsule),
        .init(id: "card",       label: "card",       value: LMRadius.card),
        .init(id: "sheet",      label: "sheet",      value: LMRadius.sheet),
    ]

    private let columns = [
        GridItem(.adaptive(minimum: 140), spacing: LMSpacing.md)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("SCALE") {
                    LazyVGrid(columns: columns, spacing: LMSpacing.md) {
                        ForEach(radii) { item in
                            tile(item)
                        }
                    }
                }

                LMSection("USAGE NOTE") {
                    VStack(alignment: .leading, spacing: LMSpacing.sm) {
                        usageRow("sm (6)",          "skeleton bar / 細小元素")
                        usageRow("md (10)",         "menu picker trigger / 小 chip")
                        usageRow("button (12)",     "標準 button / form input")
                        usageRow("xl (16)",         "form input 大欄 / hero tile")
                        usageRow("navCapsule (18)", "back button / nav capsule")
                        usageRow("card (20)",       "editorial card / list 容器")
                        usageRow("sheet (28)",      "sheet 上緣 / modal 容器")
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactilePlain(radius: LMRadius.card)
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Radius")
        .brandPage()
    }

    @ViewBuilder
    private func tile(_ item: RadiusItem) -> some View {
        VStack(spacing: LMSpacing.sm) {
            RoundedRectangle(cornerRadius: item.value, style: .continuous)
                .fill(Color.surface1)
                .overlay {
                    RoundedRectangle(cornerRadius: item.value, style: .continuous)
                        .strokeBorder(Color.primaryBrand.opacity(0.45), lineWidth: 1.5)
                }
                .frame(height: 88)
            VStack(spacing: 2) {
                Text(item.label)
                    .font(.lmLabel)
                    .foregroundStyle(Color.ink)
                Text("\(Int(item.value)) pt")
                    .font(.lmCaption.monospacedDigit())
                    .foregroundStyle(Color.inkMutedSubdued)
            }
        }
        .padding(LMSpacing.md)
        .frame(maxWidth: .infinity)
        .tactileBase(radius: LMRadius.card)
    }

    @ViewBuilder
    private func usageRow(_ token: String, _ usage: String) -> some View {
        HStack(alignment: .top, spacing: LMSpacing.md) {
            Text(token)
                .font(.lmLabel)
                .foregroundStyle(Color.primaryBrand)
                .frame(width: 130, alignment: .leading)
            Text(usage)
                .font(.lmBodySmall)
                .foregroundStyle(Color.ink)
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    NavigationStack {
        RadiusView()
    }
}
