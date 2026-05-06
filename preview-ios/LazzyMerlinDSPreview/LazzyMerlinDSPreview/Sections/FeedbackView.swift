import SwiftUI

struct FeedbackView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("TOAST · SUCCESS") {
                    LMToast(text: "好了", icon: "checkmark.circle.fill", iconColor: .earthGreen)
                }

                LMSection("TOAST · ERROR") {
                    LMToast(text: "壞了。可能是我沒做對 — 再試試看 ↻", icon: "xmark.octagon.fill", iconColor: .earthRed)
                }

                LMSection("TOAST · WARNING") {
                    LMToast(text: "比預期久一點，再等一下", icon: "clock.fill", iconColor: .earthOchre)
                }

                LMSection("TOAST · INFO") {
                    LMToast(text: "已儲存草稿。", icon: "info.circle.fill", iconColor: .primaryBrand)
                }

                LMSection("EMPTY STATE") {
                    VStack(spacing: LMSpacing.lg) {
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
                    .padding(.vertical, LMSpacing.stateVertical)
                }

                LMSection("LOADING") {
                    HStack(spacing: LMSpacing.md) {
                        LMSpinner(size: 22, lineWidth: 3)
                        Text("處理中⋯⋯")
                            .font(.lmBody)
                            .foregroundStyle(Color.inkMuted)
                    }
                    .padding(LMSpacing.page)
                    .frame(maxWidth: .infinity)
                    .tactileBase(radius: 12)
                }

                Spacer(minLength: 32)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Feedback")
        .brandPage()
    }

}

#Preview {
    NavigationStack {
        FeedbackView()
    }
}
