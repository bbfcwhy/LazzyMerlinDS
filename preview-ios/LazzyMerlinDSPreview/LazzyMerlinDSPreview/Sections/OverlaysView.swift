import SwiftUI

struct OverlaysView: View {

    @State private var showSheet = false
    @State private var showPopover = false
    @State private var showToast = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                LMSection("TOOLTIP / POPOVER") {
                    HStack(spacing: 8) {
                        Button("短提示") {
                            withAnimation(.spring(response: 0.32, dampingFraction: 0.78)) {
                                showPopover.toggle()
                            }
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: 12))

                        if showPopover {
                            LMTooltipBubble(edge: .leading) {
                                Text("這是 tooltip 短 hint")
                                    .font(.lmCaption)
                                    .foregroundStyle(Color.ink)
                            }
                            .transition(.scale(scale: 0.85, anchor: .leading).combined(with: .opacity))
                        }

                        Spacer()

                        Button {
                            withAnimation(.spring(response: 0.32, dampingFraction: 0.78)) {
                                showPopover.toggle()
                            }
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: 12, paddingV: 12, paddingH: 12))
                    }
                }

                LMSection("MODAL / TOAST") {
                    HStack(spacing: 12) {
                        Button("打開 Modal") {
                            showSheet = true
                        }
                        .buttonStyle(TactileRaisedButtonStyle(radius: 12))

                        Button("叫一個 Toast") {
                            withAnimation(.easeOut(duration: 0.2)) {
                                showToast = true
                            }
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: 12))
                    }
                }

                if showToast {
                    toast("好了 ✦", icon: "checkmark.circle.fill", color: .earthGreen)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    showToast = false
                                }
                            }
                        }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Overlays")
        .brandPage()
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 18) {
                Image("MoonStars")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.primaryBrand)
                Text("Modal")
                    .font(.lmH2)
                    .foregroundStyle(Color.ink)
                Text("完整 overlay 仍走 sheet / alert 等 SwiftUI 原生容器，內部 material 對齊品牌。")
                    .font(.lmBody)
                    .foregroundStyle(Color.inkMuted)
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Text("好了 \(Image("MoonStars"))")
                }
                .buttonStyle(TactileRaisedButtonStyle(radius: 12))
            }
            .padding(28)
            .background(Color.bgRaised.ignoresSafeArea())
        }
    }

    @ViewBuilder
    private func toast(_ text: String, icon: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
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
        OverlaysView()
    }
}
