import SwiftUI

struct LogosView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {
                LMSection("BRAND MARK") {
                    logoCard(
                        imageName: "LazzyMerlinLogo3D",
                        label: "Primary",
                        caption: "慵懶梅林實驗室",
                        meta: "main"
                    )
                }

                LMSection("ICON / GLYPH") {
                    iconCard(
                        imageName: "MoonStars",
                        label: "Moon & Stars",
                        caption: "輔助 mark · accent / button glyph / empty state",
                        meta: "asset · template render"
                    )
                }

                LMSection("SIGNATURE") {
                    Text("Laziness sets your soul free.")
                        .font(.lmH3)
                        .foregroundStyle(Color.ink)
                        .padding(LMSpacing.card)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .tactilePlain(radius: 14)
                }

                Spacer(minLength: 32)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Logos")
        .brandPage()
    }

    @ViewBuilder
    private func logoCard(imageName: String, label: String, caption: String, meta: String) -> some View {
        VStack(spacing: LMSpacing.page) {
            Text(label)
                .sectionLabel()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 210)
                .padding(.horizontal, LMSpacing.xxs)

            Text(caption)
                .font(.lmH3)
                .foregroundStyle(Color.ink)
                .multilineTextAlignment(.center)

            HStack(spacing: LMSpacing.xs) {
                Text(meta)
                    .font(.lmLabel)
                Text("·")
                    .font(.lmLabel)
                    .opacity(0.5)
                Image("MoonStars")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
            }
            .foregroundStyle(Color.inkMuted)
        }
        .padding(LMSpacing.card)
        .frame(maxWidth: .infinity)
        .tactileBase(radius: 20)
    }

    @ViewBuilder
    private func iconCard(imageName: String, label: String, caption: String, meta: String) -> some View {
        VStack(spacing: LMSpacing.page) {
            Text(label)
                .sectionLabel()

            // 三組 size 並排展示 ・ 對齊 brand 圖示典型 use case (大 / 中 / 小)
            HStack(spacing: LMSpacing.editorial) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .foregroundStyle(Color.primaryBrand)
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .foregroundStyle(Color.stone)
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.inkMuted)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, LMSpacing.sm)

            Text(caption)
                .font(.lmBodySmall)
                .foregroundStyle(Color.ink)
                .multilineTextAlignment(.center)

            Text(meta)
                .font(.lmLabel)
                .foregroundStyle(Color.inkMuted)
        }
        .padding(LMSpacing.card)
        .frame(maxWidth: .infinity)
        .tactileBase(radius: 20)
    }

}

#Preview {
    NavigationStack {
        LogosView()
    }
}
