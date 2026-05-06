import SwiftUI

// LazzyMerlin DS · Motion token preview
// LMMotion 7 個動畫·每個用 tappable demo 觸發 (scale + offset 視覺化 timing)

struct MotionView: View {

    @State private var pressTriggered = false
    @State private var quickPressTriggered = false
    @State private var quickDismissTriggered = false
    @State private var overlaySpringTriggered = false
    @State private var controlSpringTriggered = false
    @State private var selectionSpringTriggered = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("PRESS · ANIMATION 點按 demo") {
                    VStack(spacing: LMSpacing.md) {
                        motionDemo(
                            label: "press",
                            note: "easeOut · 0.12s · button 按下基本 feedback",
                            triggered: $pressTriggered,
                            animation: LMMotion.press
                        )
                        motionDemo(
                            label: "quickPress",
                            note: "easeOut · 0.08s · 比 press 更快 (preview tap)",
                            triggered: $quickPressTriggered,
                            animation: LMMotion.quickPress
                        )
                        motionDemo(
                            label: "quickDismiss",
                            note: "easeOut · 0.18s · alert / overlay 收起",
                            triggered: $quickDismissTriggered,
                            animation: LMMotion.quickDismiss
                        )
                    }
                }

                LMSection("SPRING · 彈簧過渡") {
                    VStack(spacing: LMSpacing.md) {
                        motionDemo(
                            label: "overlaySpring",
                            note: "spring · response 0.32 / damping 0.82 · alert 出現",
                            triggered: $overlaySpringTriggered,
                            animation: LMMotion.overlaySpring
                        )
                        motionDemo(
                            label: "controlSpring",
                            note: "spring · response 0.32 / damping 0.78 · tooltip / popover",
                            triggered: $controlSpringTriggered,
                            animation: LMMotion.controlSpring
                        )
                        motionDemo(
                            label: "selectionSpring",
                            note: "spring · response 0.42 / damping 0.82 · segmented pill 滑動",
                            triggered: $selectionSpringTriggered,
                            animation: LMMotion.selectionSpring
                        )
                    }
                }

                LMSection("SKELETON · 永動 loop") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        Text("skeletonPulse · easeInOut · 1.2s · repeatForever (autoreverse)")
                            .font(.lmCaption)
                            .foregroundStyle(Color.inkMutedSubdued)
                        // 直接 demo LMSkeleton 自帶的脈動
                        VStack(alignment: .leading, spacing: LMSpacing.sm) {
                            LMSkeleton(width: 180, height: 14, radius: 7)
                            LMSkeleton(width: 96, height: 10, radius: 5)
                            LMSkeleton(height: 10, radius: 5)
                        }
                        .padding(LMSpacing.lg)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .tactilePlain(radius: LMRadius.card)
                    }
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Motion")
        .brandPage()
    }

    /// 動畫 demo: 點按時 box 移到右邊、放開回左邊
    @ViewBuilder
    private func motionDemo(
        label: String,
        note: String,
        triggered: Binding<Bool>,
        animation: Animation
    ) -> some View {
        HStack(alignment: .center, spacing: LMSpacing.md) {
            // 動畫對象 (刻度條 + 動方塊)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.borderSubtle)
                    .frame(height: 6)
                Circle()
                    .fill(Color.primaryBrand)
                    .frame(width: 22, height: 22)
                    .offset(x: triggered.wrappedValue ? 110 : 0)
            }
            .frame(width: 132, height: 22)

            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.lmLabel)
                    .foregroundStyle(Color.ink)
                Text(note)
                    .font(.lmCaption)
                    .foregroundStyle(Color.inkMutedSubdued)
            }

            Spacer(minLength: 0)

            Button("Tap") {
                withAnimation(animation) {
                    triggered.wrappedValue.toggle()
                }
            }
            .buttonStyle(TactileSecondaryButtonStyle(
                radius: LMRadius.md,
                paddingV: LMControlSize.buttonSmallV,
                paddingH: LMControlSize.buttonSmallH
            ))
        }
        .padding(LMSpacing.md)
        .tactileBase(radius: LMRadius.card)
    }
}

#Preview {
    NavigationStack {
        MotionView()
    }
}
