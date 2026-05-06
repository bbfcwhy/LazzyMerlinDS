import SwiftUI

struct CardsView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("EDITORIAL CARD (Tactile Base)") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        Text("Laziness sets your soul free.")
                            .font(.lmH3)
                            .foregroundStyle(Color.ink)
                        Text("慵懶不可恥，唯有如此，才能讓靈魂自由。\n冷面笑匠，外硬內軟，誠實直白不做作。")
                            .font(.lmBody)
                            .foregroundStyle(Color.inkMuted)
                            .lineSpacing(LMLineSpacing.normal)
                    }
                    .padding(LMSpacing.editorial)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("HERO TILE (Tactile Raised)") {
                    HStack(spacing: LMSpacing.lg) {
                        Image("MoonStars")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        VStack(alignment: .leading, spacing: LMSpacing.xxs) {
                            Text("LazzyMerlin")
                                .font(.lmH3)
                            Text("跨平台品牌核心")
                                .font(.lmBodySmall)
                                .foregroundStyle(Color.inkOnBrand.opacity(0.85))
                        }
                        Spacer()
                    }
                    .padding(LMSpacing.editorial)
                    .frame(maxWidth: .infinity)
                    .tactileRaised(radius: LMRadius.xl)
                }

                LMSection("PLAIN CARD (Hybrid)") {
                    VStack(alignment: .leading, spacing: LMSpacing.sm) {
                        Text("輕量卡片")
                            .font(.lmBodyLarge)
                            .foregroundStyle(Color.ink)
                        Text("Hairline outline + soft shadow。比 Editorial 輕量，適合 list 內。")
                            .font(.lmBodySmall)
                            .foregroundStyle(Color.inkMuted)
                    }
                    .padding(LMSpacing.editorial)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactilePlain(radius: LMRadius.card)
                }

                LMSection("STAT CARDS") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: LMSpacing.md)], spacing: LMSpacing.md) {
                        statCard("DAU", value: "1,284", trend: "↑ 12% vs 上週", color: .earthGreen)
                        statCard("RETENTION", value: "68%", trend: "↓ 3% vs 上週", color: .earthRed)
                        statCard("REVENUE", value: "$3,420", trend: "↑ 8%", color: .earthGreen)
                    }
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Cards")
        .brandPage()
    }


    @ViewBuilder
    private func statCard(_ label: String, value: String, trend: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: LMSpacing.lg) {
            Text(label)
                .sectionLabel()
            Spacer(minLength: LMSpacing.lg)
            Text(value)
                .font(.lmStatNumber)
                .monospacedDigit()
                .foregroundStyle(Color.ink)
                .minimumScaleFactor(0.7)
            Text(trend)
                .font(.lmCaption)
                .foregroundStyle(color)
        }
        .padding(LMSpacing.editorial)
        .frame(maxWidth: .infinity, minHeight: 180, alignment: .leading)
        .tactileBase(radius: LMRadius.card)
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
}
