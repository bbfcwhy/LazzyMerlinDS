import SwiftUI

// LazzyMerlin DS · Stepper
// 取代 SwiftUI Stepper · 系統 +/- 雙按鈕
// 結構：[−] 數字 [+] · -/+ 用 ghost icon (無 bg/shadow)、數字用 inset 凹槽
// Ghost icon 在 stepper 容器內讀作「方向 hint」、不是「獨立按鈕」、視覺輕量

struct LMStepper: View {

    @Binding var value: Double
    let range: ClosedRange<Double>
    var step: Double = 1
    var format: String = "%.0f"

    var body: some View {
        HStack(spacing: 4) {
            ghostStepButton(systemImage: "minus", action: decrement)
                .disabled(value <= range.lowerBound)
                .opacity(value <= range.lowerBound ? 0.30 : 1)

            Text(String(format: format, value))
                .font(.system(.body, design: .monospaced))
                .foregroundStyle(Color.ink)
                .frame(minWidth: 56)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .tactileInset(radius: 10)

            ghostStepButton(systemImage: "plus", action: increment)
                .disabled(value >= range.upperBound)
                .opacity(value >= range.upperBound ? 0.30 : 1)
        }
    }

    private func decrement() {
        let next = value - step
        value = max(range.lowerBound, next)
    }

    private func increment() {
        let next = value + step
        value = min(range.upperBound, next)
    }

    @ViewBuilder
    private func ghostStepButton(systemImage: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 36, height: 36)
                .contentShape(Rectangle())
        }
        .buttonStyle(LMGhostIconButtonStyle())
    }
}
