import SwiftUI

struct CardsView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("EDITORIAL CARD (Tactile Base)") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("MMXXVI · CHAPTER I")
                            .sectionLabel()
                        Text("Shine, lazily and steadily.")
                            .font(.lmH3)
                            .foregroundStyle(Color.ink)
                        Text("懶人魔法師慵懶地閃耀著。冷面笑匠的氣質，外硬內軟，誠實，不 hype。")
                            .font(.lmBody)
                            .foregroundStyle(Color.inkMuted)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: 16)
                }

                section("HERO TILE (Tactile Raised)") {
                    HStack(spacing: 16) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 28, weight: .semibold))
                        VStack(alignment: .leading, spacing: 4) {
                            Text("✦ LazzyMerlin")
                                .font(.lmH3)
                            Text("跨平台品牌核心")
                                .font(.lmBodySmall)
                                .opacity(0.85)
                        }
                        Spacer()
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .tactileRaised(radius: 16)
                }

                section("PLAIN CARD (Hairline only)") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("輕量卡片")
                            .font(.lmBodyLarge)
                            .foregroundStyle(Color.ink)
                        Text("Hairline 線框 + 無 shadow。適合 list view item。")
                            .font(.lmBodySmall)
                            .foregroundStyle(Color.inkMuted)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.bg)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .strokeBorder(Color.hairline, lineWidth: 1)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .background(Color.bg.ignoresSafeArea())
        .navigationTitle("Cards")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }

    @ViewBuilder
    private func section<Content: View>(_ title: String,
                                        @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).sectionLabel()
            content()
        }
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
}
