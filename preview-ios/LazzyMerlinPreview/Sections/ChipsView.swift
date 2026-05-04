import SwiftUI

struct ChipsView: View {

    @State private var selected: String? = "ALL"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("FILTER CHIPS (跨 hue 三色避免擠壓 §15.5.1)") {
                    HStack(spacing: 8) {
                        chip("ALL", color: .primaryLM, selected: selected == "ALL") {
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
                        statusChip("INFO", icon: "info.circle.fill", color: .primaryLM)
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
                            .foregroundStyle(Color.bg)
                            .background(Color.earthOchre)
                            .clipShape(Capsule())

                        Text("NEW")
                            .font(.lmLabel)
                            .textCase(.uppercase)
                            .tracking(0.8)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .foregroundStyle(Color.bg)
                            .background(Color.primaryLM)
                            .clipShape(Capsule())

                        Circle()
                            .fill(Color.earthRed)
                            .frame(width: 8, height: 8)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .background(Color.bg.ignoresSafeArea())
        .navigationTitle("Chips")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
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
        .foregroundStyle(selected ? Color.bg : color)
        .background(selected ? color : color.opacity(0.10))
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .strokeBorder(
                    LinearGradient(
                        colors: [.white.opacity(selected ? 0.30 : 0), .black.opacity(selected ? 0.20 : 0)],
                        startPoint: .top, endPoint: .bottom
                    ),
                    lineWidth: 1
                )
        }
        .shadow(color: selected ? .black.opacity(0.12) : .clear, radius: 2, y: 1)
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
        .foregroundStyle(color)
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
        .background(color.opacity(0.12))
        .clipShape(Capsule())
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
        ChipsView()
    }
}
