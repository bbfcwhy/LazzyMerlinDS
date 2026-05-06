import SwiftUI

struct NavView: View {

    @State private var selectedTab = "概覽"
    @State private var bottomTab: String = "home"
    private let tabs = ["概覽", "手札", "專案", "關於"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                section("TABS") {
                    HStack(spacing: 20) {
                        ForEach(tabs, id: \.self) { tab in
                            Button {
                                selectedTab = tab
                            } label: {
                                VStack(spacing: 8) {
                                    Text(tab)
                                        .font(.lmBodySmall)
                                    Rectangle()
                                        .fill(selectedTab == tab ? Color.primaryBrand : Color.clear)
                                        .frame(height: 2)
                                }
                                .foregroundStyle(selectedTab == tab ? Color.ink : Color.inkMuted)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                section("BREADCRUMB") {
                    HStack(spacing: 8) {
                        Text("首頁")
                        Text("·")
                            .foregroundStyle(Color.inkMuted)
                        Text("專案")
                        Text("·")
                            .foregroundStyle(Color.inkMuted)
                        Text("設計系統")
                            .foregroundStyle(Color.inkMuted)
                    }
                    .font(.lmBodySmall)
                    .foregroundStyle(Color.primaryBrand)
                }

                section("PAGINATION") {
                    HStack(spacing: 8) {
                        pageIcon("chevron.left")
                        pageButton("1", selected: false)
                        pageButton("2", selected: false)
                        pageButton("3", selected: true)
                        pageButton("4", selected: false)
                        Text("…")
                            .foregroundStyle(Color.inkMuted)
                            .padding(.horizontal, 4)
                        pageButton("12", selected: false)
                        pageIcon("chevron.right")
                    }
                }

                section("BOTTOM TAB BAR") {
                    LMTabBar(
                        selection: $bottomTab,
                        items: [
                            LMTabItem(tag: "home",     label: "首頁",  icon: "house",          selectedIcon: "house.fill"),
                            LMTabItem(tag: "browse",   label: "瀏覽",  icon: "square.grid.2x2", selectedIcon: "square.grid.2x2.fill"),
                            LMTabItem(tag: "favorite", label: "收藏",  icon: "heart",          selectedIcon: "heart.fill"),
                            LMTabItem(tag: "profile",  label: "我",    icon: "person",         selectedIcon: "person.fill")
                        ]
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .strokeBorder(Color.hairline, lineWidth: 1)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Navigation")
        .brandPage()
    }

    @ViewBuilder
    private func pageButton(_ text: String, selected: Bool) -> some View {
        if selected {
            Button(text) {}
                .buttonStyle(TactilePressedButtonStyle(radius: 10, paddingV: 8, paddingH: 12))
        } else {
            Button(text) {}
                .buttonStyle(TactileGhostButtonStyle(paddingV: 8, paddingH: 12))
        }
    }

    @ViewBuilder
    private func pageIcon(_ name: String) -> some View {
        Button {
        } label: {
            Image(systemName: name)
                .font(.system(size: 13, weight: .semibold))
        }
        .buttonStyle(TactileGhostButtonStyle(paddingV: 8, paddingH: 12))
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
        NavView()
    }
}
