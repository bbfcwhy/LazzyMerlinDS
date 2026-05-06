import SwiftUI

// LazzyMerlin DS · Brand Back Button
// 取代系統 nav bar 的 Liquid Glass back button
// 套用 TactileSecondaryButtonStyle、跟其他 secondary CTA 同氣質 (雙層 shadow + press 動畫)

struct LMBackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: LMSpacing.xxs) {
                Image(systemName: "chevron.left")
                    .font(.lmButtonSmall)
                Text("返回")
                    .font(.lmControlLabel)
            }
        }
        // radius 大一點接近 capsule、padding 比一般 CTA 略小 (back button 是 utility chrome)
        .buttonStyle(TactileSecondaryButtonStyle(
            radius: LMRadius.navCapsule,
            paddingV: LMControlSize.buttonSmallV,
            paddingH: LMControlSize.buttonSmallH
        ))
        .fixedSize()
    }
}
