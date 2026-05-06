import SwiftUI

struct ChipsView: View {

    @State private var selected: String? = "ALL"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("FILTER CHIPS (跨 hue 三色避免擠壓 §15.5.1)") {
                    HStack(spacing: LMSpacing.sm) {
                        chip("ALL", color: .primaryBrand, selected: selected == "ALL") {
                            selected = "ALL"
                        }
                        chip("DRAFTS", color: .stone, selected: selected == "DRAFTS") {
                            selected = "DRAFTS"
                        }
                        chip("PUBLISHED", color: .earthGreen, selected: selected == "PUBLISHED") {
                            selected = "PUBLISHED"
                        }
                    }
                }

                LMSection("STATUS CHIPS (Earth Tone)") {
                    HStack(spacing: LMSpacing.sm) {
                        LMStatusChip(text: "INFO", icon: "info.circle.fill", color: .primaryBrand)
                        LMStatusChip(text: "SUCCESS", icon: "checkmark.circle.fill", color: .earthGreen)
                        LMStatusChip(text: "WARNING", icon: "exclamationmark.triangle.fill", color: .earthOchre)
                        LMStatusChip(text: "ERROR", icon: "xmark.octagon.fill", color: .earthRed)
                    }
                }

                LMSection("BADGE / TAG") {
                    HStack(spacing: LMSpacing.sm) {
                        Text("BETA")
                            .chipLabel()
                            .padding(.vertical, LMSpacing.xxs)
                            .padding(.horizontal, LMSpacing.sm)
                            .modifier(TactilePillModifier(color: .earthOchre, isFilled: true))

                        Text("NEW")
                            .chipLabel()
                            .padding(.vertical, LMSpacing.xxs)
                            .padding(.horizontal, LMSpacing.sm)
                            .modifier(TactilePillModifier(color: .primaryBrand, isFilled: true))

                        Circle()
                            .fill(Color.earthRed)
                            .frame(width: 8, height: 8)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Chips")
        .brandPage()
    }

    @ViewBuilder
    private func chip(_ text: String, color: Color, selected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .chipLabel()
                .padding(.vertical, LMSpacing.xs)
                .padding(.horizontal, LMSpacing.controlGap)
        }
        .buttonStyle(.plain)
        .modifier(TactilePillModifier(color: color, isFilled: selected))
    }

}

// TactilePillModifier 已搬到 Tokens/TactileMaterial.swift、跨 view 共用 (DataView 也用)

#Preview {
    NavigationStack {
        ChipsView()
    }
}
