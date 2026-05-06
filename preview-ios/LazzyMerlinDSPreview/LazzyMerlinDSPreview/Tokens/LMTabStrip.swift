import SwiftUI

// LazzyMerlin DS · Top horizontal Tab Strip
// 跟 LMTabBar (bottom nav) 配對的水平 tab 切換、用 underline indicator
// 結構：HStack of buttons + underline indicator with matchedGeometryEffect
// 用法：
//   LMTabStrip(selection: $tab, options: ["概覽", "手札", "專案"]) { Text($0) }

struct LMTabStrip<Selection: Hashable, Label: View>: View {

    @Binding var selection: Selection
    let options: [Selection]
    @ViewBuilder let label: (Selection) -> Label

    @Namespace private var ns

    var body: some View {
        HStack(spacing: 20) {
            ForEach(Array(options.enumerated()), id: \.offset) { _, opt in
                tabButton(opt)
            }
        }
    }

    @ViewBuilder
    private func tabButton(_ opt: Selection) -> some View {
        let isSelected = (selection == opt)
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.82)) {
                selection = opt
            }
        } label: {
            VStack(spacing: 8) {
                label(opt)
                    .font(.lmBodySmall.weight(isSelected ? .semibold : .regular))
                indicator(isSelected: isSelected)
            }
            .foregroundStyle(isSelected ? Color.ink : Color.inkMuted)
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private func indicator(isSelected: Bool) -> some View {
        ZStack {
            Color.clear.frame(height: 2)
            if isSelected {
                Capsule()
                    .fill(Color.primaryBrand)
                    .frame(height: 2)
                    .matchedGeometryEffect(id: "lmTabStripIndicator", in: ns)
            }
        }
    }
}
