import SwiftUI

struct StatesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {
                LMSection("EMPTY / SEARCH") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 220), spacing: LMSpacing.md)], spacing: LMSpacing.md) {
                        stateCard(assetImage: "MoonStars", title: "這裡還沒寫東西。", body: "懶人通常這樣。", action: "開始寫")
                        stateCard(systemImage: "magnifyingglass", title: "找不到。", body: "換個字試試？")
                    }
                }

                LMSection("404 / ERROR") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 220), spacing: LMSpacing.md)], spacing: LMSpacing.md) {
                        stateCard(visual: "404", title: "頁面沒了。", body: "可能我當初就沒做出來。", action: "回首頁")
                        stateCard(systemImage: "exclamationmark.triangle", title: "壞了。", body: "不是你的問題。大概。", action: "再試一次")
                    }
                }

                LMSection("SKELETON") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        HStack(spacing: LMSpacing.md) {
                            LMSkeleton(width: 44, height: 44, radius: 22)
                            VStack(alignment: .leading, spacing: LMSpacing.sm) {
                                LMSkeleton(width: 180, height: 14, radius: 7)
                                LMSkeleton(width: 96, height: 10, radius: 5)
                            }
                        }
                        LMSkeleton(height: 12, radius: 6)
                        LMSkeleton(width: 260, height: 12, radius: 6)
                    }
                    .padding(LMSpacing.page)
                    .tactileBase(radius: LMRadius.xl)
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("States")
        .brandPage()
    }

    @ViewBuilder
    private func stateCard(visual: String? = nil,
                           systemImage: String? = nil,
                           assetImage: String? = nil,
                           title: String,
                           body: String,
                           action: String? = nil) -> some View {
        VStack(alignment: .leading, spacing: LMSpacing.md) {
            if let visual {
                Text(visual)
                    .font(visual == "404" ? .lmEmptyCode : .lmEmptyVisual)
                    .foregroundStyle(Color.inkMutedSubdued)
            }
            if let systemImage {
                Image(systemName: systemImage)
                    .font(.lmDisplay)
                    .foregroundStyle(Color.inkMutedSubdued)
            }
            if let assetImage {
                Image(assetImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color.inkMutedSubdued)
            }
            Text(title)
                .font(.lmH3)
                .foregroundStyle(Color.ink)
            Text(body)
                .font(.lmBodySmall)
                .foregroundStyle(Color.inkMuted)
            if let action {
                Button(action) {}
                    .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button, paddingV: LMRadius.md, paddingH: LMSpacing.lg))
                    .padding(.top, LMSpacing.sm)
            }
        }
        .padding(LMSpacing.card)
        .frame(maxWidth: .infinity, minHeight: 240, alignment: .topLeading)
        .tactilePlain(radius: LMRadius.xl)
    }

}

#Preview {
    NavigationStack {
        StatesView()
    }
}
