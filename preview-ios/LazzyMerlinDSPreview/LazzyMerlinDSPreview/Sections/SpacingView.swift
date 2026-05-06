import SwiftUI

// LazzyMerlin DS · Spacing token preview
// 把 LMSpacing 11 個值視覺化、bar 寬度 = 實際 pt 值

struct SpacingView: View {

    private struct SpacingItem: Identifiable {
        let id: String
        let label: String
        let value: CGFloat
    }

    private let spacings: [SpacingItem] = [
        .init(id: "xxs",           label: "xxs",           value: LMSpacing.xxs),
        .init(id: "xs",            label: "xs",            value: LMSpacing.xs),
        .init(id: "sm",            label: "sm",            value: LMSpacing.sm),
        .init(id: "md",            label: "md",            value: LMSpacing.md),
        .init(id: "controlGap",    label: "controlGap",    value: LMSpacing.controlGap),
        .init(id: "lg",            label: "lg",            value: LMSpacing.lg),
        .init(id: "page",          label: "page",          value: LMSpacing.page),
        .init(id: "card",          label: "card",          value: LMSpacing.card),
        .init(id: "editorial",     label: "editorial",     value: LMSpacing.editorial),
        .init(id: "section",       label: "section",       value: LMSpacing.section),
        .init(id: "stateVertical", label: "stateVertical", value: LMSpacing.stateVertical),
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("SCALE") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        ForEach(spacings) { item in
                            row(item)
                        }
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("USAGE NOTE") {
                    VStack(alignment: .leading, spacing: LMSpacing.sm) {
                        usageRow("xxs (4)",   "icon-text spacing · form helper-text 上方")
                        usageRow("xs (6)",    "tight chip padding")
                        usageRow("sm (8)",    "small spacing · LMSpinner gap")
                        usageRow("md (12)",   "標準 spacing · row 內元素")
                        usageRow("controlGap (14)", "control 之間 · button row spacing")
                        usageRow("lg (16)",   "card 內 section 間")
                        usageRow("page (20)", "page 邊距")
                        usageRow("card (24)", "card 內 padding")
                        usageRow("editorial (28)", "editorial card 寬鬆 padding")
                        usageRow("section (32)", "page section 之間")
                        usageRow("stateVertical (64)", "empty state 上下 padding")
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactilePlain(radius: LMRadius.card)
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Spacing")
        .brandPage()
    }

    @ViewBuilder
    private func row(_ item: SpacingItem) -> some View {
        HStack(alignment: .center, spacing: LMSpacing.md) {
            // Visual bar 寬度 = 實際 pt 值
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                .fill(Color.primaryBrand)
                .frame(width: item.value, height: 16)
                .frame(width: 80, alignment: .leading) // fixed slot for alignment
            Text(item.label)
                .font(.lmLabel)
                .foregroundStyle(Color.ink)
                .frame(width: 110, alignment: .leading)
            Text("\(Int(item.value)) pt")
                .font(.lmCaption.monospacedDigit())
                .foregroundStyle(Color.inkMutedSubdued)
            Spacer()
        }
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
        SpacingView()
    }
}
