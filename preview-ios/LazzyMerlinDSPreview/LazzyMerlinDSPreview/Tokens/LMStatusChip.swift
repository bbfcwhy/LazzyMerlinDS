import SwiftUI

// LazzyMerlin DS · Status Chip (icon + uppercase label · 帶 tactile pill 質地)
// 取代 ChipsView 的 statusChip() inline helper
// 結構：HStack [icon + uppercase tracked text] + TactilePillModifier(isFilled: true)

struct LMStatusChip: View {

    let text: String
    let icon: String        // SF Symbol name
    var color: Color = .primaryBrand

    var body: some View {
        HStack(spacing: LMSpacing.xs) {
            Image(systemName: icon)
                .font(.lmCaption.weight(.semibold))
            Text(text)
                .statusChipLabel()
        }
        .padding(.vertical, LMSpacing.xs)
        .padding(.horizontal, LMRadius.md)
        .modifier(TactilePillModifier(color: color, isFilled: true))
    }
}
