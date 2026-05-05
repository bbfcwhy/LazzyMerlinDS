import SwiftUI

struct ModalView: View {

    @State private var showSheet = false
    @State private var showAlert = false
    @State private var showConfirmation = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("MODAL · Sheet (Tactile Raised dialog)") {
                    Button("打開魔法書") {
                        showSheet = true
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 22)
                    .tactileRaised(radius: 12)
                }

                section("MODAL · Alert") {
                    Button("確認危險操作") {
                        showAlert = true
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 22)
                    .foregroundStyle(Color.inkOnBrand)
                    .background(Color.earthRed)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                }

                section("MODAL · Confirmation Dialog") {
                    Button("更多選項") {
                        showConfirmation = true
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 22)
                    .foregroundStyle(Color.ink)
                    .tactileBase(radius: 12)
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Modal")
        .brandPage()
        .sheet(isPresented: $showSheet) {
            sheetContent
                #if os(macOS)
                .frame(minWidth: 400, minHeight: 500)
                #endif
        }
        .alert("壞了。", isPresented: $showAlert) {
            Button("再試試看", role: .none) {}
            Button("取消", role: .cancel) {}
        } message: {
            Text("可能是我沒做對。要不要再試一次？")
        }
        .confirmationDialog("選一個", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("第一個選項") {}
            Button("第二個選項") {}
            Button("第三個選項") {}
            Button("取消", role: .cancel) {}
        }
    }

    private var sheetContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("✦")
                    .font(.system(size: 28))
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

            Text("MMXXVI")
                .sectionLabel()

            Text("Shine, lazily and steadily.")
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
                .padding(.vertical, 12)
                .padding(.horizontal, 22)
                .foregroundStyle(Color.primaryBrand)

                Button("好了 ✦") {
                    showSheet = false
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 22)
                .tactileRaised(radius: 12)
            }
        }
        .padding(28)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.bgRaised.ignoresSafeArea())
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
        ModalView()
    }
}
