import SwiftUI

struct ChipsView: View {

    @State private var selected: String? = "ALL"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("FILTER CHIPS (跨 hue 三色避免擠壓 §15.5.1)") {
                    HStack(spacing: 8) {
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

                section("STATUS CHIPS (Earth Tone)") {
                    HStack(spacing: 8) {
                        statusChip("INFO", icon: "info.circle.fill", color: .primaryBrand)
                        statusChip("SUCCESS", icon: "checkmark.circle.fill", color: .earthGreen)
                        statusChip("WARNING", icon: "exclamationmark.triangle.fill", color: .earthOchre)
                        statusChip("ERROR", icon: "xmark.octagon.fill", color: .earthRed)
                    }
                }

                section("BADGE / TAG") {
                    HStack(spacing: 8) {
                        Text("BETA")
                            .font(.lmLabel)
                            .textCase(.uppercase)
                            .tracking(0.8)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .modifier(TactilePillModifier(color: .earthOchre, isFilled: true))

                        Text("NEW")
                            .font(.lmLabel)
                            .textCase(.uppercase)
                            .tracking(0.8)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .modifier(TactilePillModifier(color: .primaryBrand, isFilled: true))

                        Circle()
                            .fill(Color.earthRed)
                            .frame(width: 8, height: 8)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Chips")
        .brandPage()
    }

    @ViewBuilder
    private func chip(_ text: String, color: Color, selected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .font(.lmCaption)
                .textCase(.uppercase)
                .tracking(0.8)
                .padding(.vertical, 6)
                .padding(.horizontal, 14)
        }
        .buttonStyle(.plain)
        .modifier(TactilePillModifier(color: color, isFilled: selected))
    }

    @ViewBuilder
    private func statusChip(_ text: String, icon: String, color: Color) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 11, weight: .semibold))
            Text(text)
                .font(.lmLabel)
                .textCase(.uppercase)
                .tracking(0.6)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
        .modifier(TactilePillModifier(color: color, isFilled: true))
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

// TactilePillModifier 已搬到 Tokens/TactileMaterial.swift、跨 view 共用 (DataView 也用)

#Preview {
    NavigationStack {
        ChipsView()
    }
}
