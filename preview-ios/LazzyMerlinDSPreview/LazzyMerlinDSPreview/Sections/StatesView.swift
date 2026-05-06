import SwiftUI

struct StatesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                section("EMPTY / SEARCH") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 220), spacing: 12)], spacing: 12) {
                        stateCard(assetImage: "MoonStars", title: "這裡還沒寫東西。", body: "懶人通常這樣。", action: "開始寫")
                        stateCard(systemImage: "magnifyingglass", title: "找不到。", body: "換個字試試？")
                    }
                }

                section("404 / ERROR") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 220), spacing: 12)], spacing: 12) {
                        stateCard(visual: "404", title: "頁面沒了。", body: "可能我當初就沒做出來。", action: "回首頁")
                        stateCard(systemImage: "exclamationmark.triangle", title: "壞了。", body: "不是你的問題。大概。", action: "再試一次")
                    }
                }

                section("SKELETON") {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 12) {
                            skeleton(width: 44, height: 44, radius: 22)
                            VStack(alignment: .leading, spacing: 8) {
                                skeleton(width: 180, height: 14, radius: 7)
                                skeleton(width: 96, height: 10, radius: 5)
                            }
                        }
                        skeleton(width: nil, height: 12, radius: 6)
                        skeleton(width: 260, height: 12, radius: 6)
                    }
                    .padding(20)
                    .tactileBase(radius: 16)
                }

                Spacer(minLength: 32)
            }
            .padding(20)
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
        VStack(alignment: .leading, spacing: 12) {
            if let visual {
                Text(visual)
                    .font(.system(size: visual == "404" ? 48 : 52, weight: .semibold, design: .serif))
                    .foregroundStyle(Color.inkMuted.opacity(0.65))
            }
            if let systemImage {
                Image(systemName: systemImage)
                    .font(.system(size: 42, weight: .regular))
                    .foregroundStyle(Color.inkMuted.opacity(0.65))
            }
            if let assetImage {
                Image(assetImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color.inkMuted.opacity(0.65))
            }
            Text(title)
                .font(.lmH3)
                .foregroundStyle(Color.ink)
            Text(body)
                .font(.lmBodySmall)
                .foregroundStyle(Color.inkMuted)
            if let action {
                Button(action) {}
                    .buttonStyle(TactileRaisedButtonStyle(radius: 12, paddingV: 10, paddingH: 16))
                    .padding(.top, 8)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, minHeight: 240, alignment: .topLeading)
        .tactilePlain(radius: 16)
    }

    @ViewBuilder
    private func skeleton(width: CGFloat?, height: CGFloat, radius: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: radius, style: .continuous)
            .fill(Color.inkMuted.opacity(0.16))
            .frame(width: width, height: height)
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
        StatesView()
    }
}
