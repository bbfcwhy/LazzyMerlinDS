import SwiftUI

struct FeedbackView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("TOAST · SUCCESS") {
                    toast(text: "好了 ✦", icon: "checkmark.circle.fill", color: .earthGreen)
                }

                section("TOAST · ERROR") {
                    toast(text: "壞了。可能是我沒做對 — 再試試看 ↻", icon: "xmark.octagon.fill", color: .earthRed)
                }

                section("TOAST · WARNING") {
                    toast(text: "比預期久一點，再等一下 ✦", icon: "clock.fill", color: .earthOchre)
                }

                section("TOAST · INFO") {
                    toast(text: "已儲存草稿。", icon: "info.circle.fill", color: .primaryBrand)
                }

                section("EMPTY STATE") {
                    VStack(spacing: 16) {
                        Text("✦")
                            .font(.system(size: 56))
                            .foregroundStyle(Color.inkMuted.opacity(0.5))
                        Text("這裡還沒寫東西。")
                            .font(.lmH3)
                            .foregroundStyle(Color.ink)
                        Text("懶人通常這樣。")
                            .font(.lmBody)
                            .foregroundStyle(Color.inkMuted)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 64)
                }

                section("LOADING") {
                    HStack(spacing: 12) {
                        ProgressView()
                            .tint(Color.primaryBrand)
                        Text("處理中⋯⋯")
                            .font(.lmBody)
                            .foregroundStyle(Color.inkMuted)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .tactileBase(radius: 12)
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Feedback")
        .brandPage()
    }

    @ViewBuilder
    private func toast(text: String, icon: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(color)
            Text(text)
                .font(.lmBody)
                .foregroundStyle(Color.ink)
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .tactileBase(radius: 12)
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
        FeedbackView()
    }
}
