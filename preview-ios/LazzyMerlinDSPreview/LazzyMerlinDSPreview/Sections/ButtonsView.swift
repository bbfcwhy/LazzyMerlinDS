import SwiftUI

struct ButtonsView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("PRIMARY (Tactile Raised)") {
                    Button("確認") {}
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .tactileRaised(radius: 12)
                }

                section("BASE (Tactile Base · 容器)") {
                    Button("一般操作") {}
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .foregroundStyle(Color.ink)
                        .tactileBase(radius: 12)
                }

                section("PRESSED (Active state)") {
                    Button("已選取") {}
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .tactilePressed(radius: 12)
                }

                section("DESTRUCTIVE") {
                    Button("刪除") {}
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .foregroundStyle(Color.inkOnBrand)
                        .background(Color.earthRed)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .strokeBorder(
                                    LinearGradient(
                                        colors: [.white.opacity(0.30), .black.opacity(0.20)],
                                        startPoint: .top, endPoint: .bottom
                                    ),
                                    lineWidth: 1
                                )
                        }
                        .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                }

                section("GHOST (text-only, 無 Tactile)") {
                    Button("取消") {}
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .foregroundStyle(Color.primaryBrand)
                }

                section("SIZES") {
                    HStack(spacing: 12) {
                        Button("S") {}
                            .padding(.vertical, 8).padding(.horizontal, 14)
                            .tactileRaised(radius: 10)
                        Button("中") {}
                            .padding(.vertical, 12).padding(.horizontal, 22)
                            .tactileRaised(radius: 12)
                        Button("Large") {}
                            .padding(.vertical, 16).padding(.horizontal, 28)
                            .tactileRaised(radius: 14)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .background(Color.bg.ignoresSafeArea())
        .navigationTitle("Buttons")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
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
        ButtonsView()
    }
}
