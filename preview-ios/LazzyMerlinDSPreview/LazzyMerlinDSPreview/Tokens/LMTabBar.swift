import SwiftUI

// LazzyMerlin DS · Bottom Tab Bar
// 取代 SwiftUI TabView · 系統 tab bar (iOS 26 Liquid Glass)
// 結構：底部 tactile 容器 + N 個 icon+label tab · 選中項 brand 色 + 底線指示

struct LMTabItem<Tag: Hashable>: Identifiable {
    let id = UUID()
    let tag: Tag
    let label: String
    let icon: String
    let selectedIcon: String?

    init(tag: Tag, label: String, icon: String, selectedIcon: String? = nil) {
        self.tag = tag
        self.label = label
        self.icon = icon
        self.selectedIcon = selectedIcon
    }
}

struct LMTabBar<Tag: Hashable>: View {

    @Binding var selection: Tag
    let items: [LMTabItem<Tag>]

    @Namespace private var ns
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack(spacing: 0) {
            ForEach(items) { item in
                tabButton(item)
            }
        }
        .padding(.horizontal, 6)
        .padding(.top, 4)
        .padding(.bottom, 4)
        .background(barBackground)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color.border.opacity(0.5))
                .frame(height: 0.5)
        }
    }

    @ViewBuilder
    private func tabButton(_ item: LMTabItem<Tag>) -> some View {
        let isSelected = (selection == item.tag)
        let iconName = isSelected ? (item.selectedIcon ?? item.icon) : item.icon

        Button {
            withAnimation(.spring(response: 0.32, dampingFraction: 0.78)) {
                selection = item.tag
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: iconName)
                    .font(.system(size: 19, weight: .medium))
                Text(item.label)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundStyle(isSelected ? Color.primaryBrand : Color.inkMuted)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .contentShape(Rectangle())
            .overlay(alignment: .top) { tabIndicator(isSelected: isSelected) }
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private func tabIndicator(isSelected: Bool) -> some View {
        if isSelected {
            Capsule()
                .fill(Color.primaryBrand)
                .frame(width: 24, height: 2.5)
                .matchedGeometryEffect(id: "lmTabIndicator", in: ns)
        }
    }

    private var barBackground: some View {
        ZStack {
            Color.bgRaised
            Image("TactileNoise")
                .resizable(resizingMode: .tile)
                .opacity(colorScheme == .dark ? 0.18 : 0.28)
                .blendMode(colorScheme == .dark ? .softLight : .overlay)
                .allowsHitTesting(false)
        }
    }
}
