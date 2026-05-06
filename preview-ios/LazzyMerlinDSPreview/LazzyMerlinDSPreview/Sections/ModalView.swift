import SwiftUI

struct ModalView: View {

    @State private var showSheet = false
    @State private var showAlert = false
    @State private var showConfirmation = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                LMSection("MODAL · Sheet (Tactile Raised dialog)") {
                    Button("打開魔法書") {
                        showSheet = true
                    }
                    .buttonStyle(TactileRaisedButtonStyle(radius: 12))
                }

                LMSection("MODAL · Alert") {
                    Button("確認危險操作") {
                        showAlert = true
                    }
                    .buttonStyle(TactileDestructiveButtonStyle(radius: 12))
                }

                LMSection("MODAL · Confirmation Dialog") {
                    Button("更多選項") {
                        showConfirmation = true
                    }
                    .buttonStyle(TactileSecondaryButtonStyle(radius: 12))
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Modal")
        .brandPage()
        .sheet(isPresented: $showSheet) {
            sheetContent
                .lmSheetChrome()
                #if os(macOS)
                .frame(minWidth: 400, minHeight: 500)
                #endif
        }
        .lmAlert(
            isPresented: $showAlert,
            title: "壞了。",
            message: "可能是我沒做對。要不要再試一次？",
            buttons: [
                LMAlertButton.default("再試試看"),
                LMAlertButton.cancel()
            ]
        )
        .lmActionSheet(
            isPresented: $showConfirmation,
            title: "選一個",
            buttons: [
                LMAlertButton.default("第一個選項"),
                LMAlertButton.default("第二個選項"),
                LMAlertButton.default("第三個選項"),
                LMAlertButton.cancel()
            ]
        )
    }

    private var sheetContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image("MoonStars")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.primaryBrand)
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundStyle(Color.inkMuted.opacity(0.6))
                }
            }

            Text("Laziness sets your soul free.")
                .font(.lmH2)
                .foregroundStyle(Color.ink)

            Text("這是一個 modal 範例。Tactile Raised dialog 浮在 backdrop 上，用 §5.4 共通六件配方做出視覺氣質一致的層次感。")
                .font(.lmBody)
                .foregroundStyle(Color.inkMuted)
                .lineSpacing(6)

            Spacer()

            HStack(spacing: 12) {
                Button("取消") {
                    showSheet = false
                }
                .buttonStyle(TactileGhostButtonStyle())

                Button {
                    showSheet = false
                } label: {
                    HStack(spacing: 6) {
                        Text("好了")
                        // ★ Color.clear 容器鎖死可見尺寸、避免 MoonStars template image 被 parent .font() 自動 scale
                        Color.clear
                            .frame(width: 16, height: 16)
                            .overlay {
                                Image("MoonStars")
                                    .resizable()
                                    .scaledToFit()
                            }
                    }
                }
                .buttonStyle(TactileRaisedButtonStyle(radius: 12))
            }
        }
        .padding(28)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.bgRaised.ignoresSafeArea())
    }

}

#Preview {
    NavigationStack {
        ModalView()
    }
}
