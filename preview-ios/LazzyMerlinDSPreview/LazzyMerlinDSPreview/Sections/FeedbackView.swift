import SwiftUI

struct FeedbackView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                LMSection("TOAST · SUCCESS") {
                    toast(text: "好了 ✦", icon: "checkmark.circle.fill", color: .earthGreen)
                }

                LMSection("TOAST · ERROR") {
                    toast(text: "壞了。可能是我沒做對 — 再試試看 ↻", icon: "xmark.octagon.fill", color: .earthRed)
                }

                LMSection("TOAST · WARNING") {
                    toast(text: "比預期久一點，再等一下 ✦", icon: "clock.fill", color: .earthOchre)
                }

                LMSection("TOAST · INFO") {
                    toast(text: "已儲存草稿。", icon: "info.circle.fill", color: .primaryBrand)
                }

                LMSection("EMPTY STATE") {
                    VStack(spacing: 16) {
                        Image("MoonStars")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56)
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

                LMSection("LOADING") {
                    HStack(spacing: 12) {
                        LMSpinner(size: 22, lineWidth: 3)
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

}

#Preview {
    NavigationStack {
        FeedbackView()
    }
}
