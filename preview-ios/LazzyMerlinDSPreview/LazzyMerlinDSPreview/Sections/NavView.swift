import SwiftUI

struct NavView: View {

    @State private var selectedTab = "概覽"
    @State private var bottomTab: String = "home"
    @State private var currentPage: Int = 3
    private let tabs = ["概覽", "手札", "專案", "關於"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                LMSection("TABS") {
                    LMTabStrip(selection: $selectedTab, options: tabs) { tab in
                        Text(tab)
                    }
                }

                LMSection("BREADCRUMB") {
                    LMBreadcrumb(items: ["首頁", "專案", "設計系統"])
                }

                LMSection("PAGINATION") {
                    LMPagination(current: $currentPage, total: 12)
                }

                LMSection("BOTTOM TAB BAR") {
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
}

#Preview {
    NavigationStack {
        NavView()
    }
}
