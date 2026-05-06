import SwiftUI

struct CardsView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("EDITORIAL CARD (Tactile Base)") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Laziness sets your soul free.")
                            .font(.lmH3)
                            .foregroundStyle(Color.ink)
                        Text("慵懶不可恥，唯有如此，才能讓靈魂自由。\n冷面笑匠，外硬內軟，誠實直白不做作。")
                            .font(.lmBody)
                            .foregroundStyle(Color.inkMuted)
                            .lineSpacing(4)
                    }
                    .padding(28)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: 20)
                }

                section("HERO TILE (Tactile Raised)") {
                    HStack(spacing: 16) {
                        Image("MoonStars")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("LazzyMerlin")
                                .font(.lmH3)
                            Text("跨平台品牌核心")
                                .font(.lmBodySmall)
                                .opacity(0.85)
                        }
                        Spacer()
                    }
                    .padding(28)
                    .frame(maxWidth: .infinity)
                    .tactileRaised(radius: 16)
                }

                section("PLAIN CARD (Hybrid)") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("輕量卡片")
                            .font(.lmBodyLarge)
                            .foregroundStyle(Color.ink)
                        Text("Hairline outline + soft shadow。比 Editorial 輕量，適合 list 內。")
                            .font(.lmBodySmall)
                            .foregroundStyle(Color.inkMuted)
                    }
                    .padding(28)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactilePlain(radius: 20)
                }

                section("STAT CARDS") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 12)], spacing: 12) {
                        statCard("DAU", value: "1,284", trend: "↑ 12% vs 上週", color: .earthGreen)
                        statCard("RETENTION", value: "68%", trend: "↓ 3% vs 上週", color: .earthRed)
                        statCard("REVENUE", value: "$3,420", trend: "↑ 8%", color: .earthGreen)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Cards")
        .brandPage()
    }

    @ViewBuilder
    private func section<Content: View>(_ title: String,
                                        @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).sectionLabel()
            content()
        }
    }

    @ViewBuilder
    private func statCard(_ label: String, value: String, trend: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(label)
                .sectionLabel()
            Spacer(minLength: 16)
            Text(value)
                .font(.system(size: 40, weight: .bold, design: .default))
                .monospacedDigit()
                .foregroundStyle(Color.ink)
                .minimumScaleFactor(0.7)
            Text(trend)
                .font(.lmCaption)
                .foregroundStyle(color)
        }
        .padding(28)
        .frame(maxWidth: .infinity, minHeight: 180, alignment: .leading)
        .tactileBase(radius: 20)
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
}
