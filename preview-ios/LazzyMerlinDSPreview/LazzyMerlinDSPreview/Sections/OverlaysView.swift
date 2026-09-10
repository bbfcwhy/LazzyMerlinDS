import SwiftUI

struct OverlaysView: View {

    @State private var showSheet = false
    @State private var showPopover = false
    @State private var showToast = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {
                LMSection("TOOLTIP / POPOVER") {
                    HStack(spacing: LMSpacing.sm) {
                        Button("短提示") {
                            withAnimation(LMMotion.controlSpring) {
                                showPopover.toggle()
                            }
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button))

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
                            withAnimation(LMMotion.controlSpring) {
                                showPopover.toggle()
                            }
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button, paddingV: LMControlSize.buttonMediumV, paddingH: LMControlSize.buttonMediumV))
                    }
                }

                LMSection("MODAL / TOAST") {
                    HStack(spacing: LMSpacing.md) {
                        Button("打開 Modal") {
                            showSheet = true
                        }
                        .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button))

                        Button("叫一個 Toast") {
                            withAnimation(LMMotion.quickDismiss) {
                                showToast = true
                            }
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button))
                    }
                }

                if showToast {
                    LMToast(text: "好了", icon: "checkmark.circle.fill", iconColor: .earthGreen)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(LMMotion.quickDismiss) {
                                showToast = false
                            }
                        }
                    }
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
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
                    HStack(spacing: LMSpacing.xs) {
                        Text("好了")
                        // ★ Color.clear 容器鎖死可見尺寸、避免 MoonStars template image 被 parent .font() 自動 scale
                        Color.clear
                            .frame(width: LMSpacing.lg, height: LMSpacing.lg)
                            .overlay {
                                Image("MoonStars")
                                    .resizable()
                                    .scaledToFit()
                            }
                    }
                }
                .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button))
            }
            .padding(LMSpacing.editorial)
            .background(Color.bg.ignoresSafeArea())
        }
    }
}

#Preview {
    NavigationStack {
        OverlaysView()
    }
}
