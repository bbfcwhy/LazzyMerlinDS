import SwiftUI

struct ButtonsView: View {
    private let columns = [GridItem(.adaptive(minimum: 118), spacing: LMSpacing.controlGap)]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("VARIANTS") {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: LMSpacing.controlGap) {
                        Button("送出 Primary") {}
                            .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button))

                        Button("Cancel Secondary") {}
                            .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button))

                        Button("Skip Ghost") {}
                            .buttonStyle(TactileGhostButtonStyle())

                        Button("刪除 Destructive") {}
                            .buttonStyle(TactileDestructiveButtonStyle(radius: LMRadius.button))

                        Button("Brand Deep") {}
                            .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button, baseColor: .primaryDeep))
                    }
                }

                LMSection("SIZES") {
                    HStack(alignment: .center, spacing: LMSpacing.md) {
                        Button("S") {}
                            .buttonStyle(TactileRaisedButtonStyle(
                                radius: LMRadius.md, paddingV: LMControlSize.buttonSmallV, paddingH: LMControlSize.buttonSmallH
                            ))
                        Button("中") {}
                            .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button))
                        Button("Large") {}
                            .buttonStyle(TactileRaisedButtonStyle(
                                radius: LMRadius.button, paddingV: LMControlSize.buttonLargeV, paddingH: LMControlSize.buttonLargeH
                            ))
                    }
                }

                LMSection("ICON · LOADING · DISABLED") {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: LMSpacing.controlGap) {
                        Button {
                        } label: {
                            Label("新增", systemImage: "plus")
                        }
                        .buttonStyle(TactileRaisedButtonStyle(radius: LMRadius.button))

                        Button {
                        } label: {
                            Label("查看更多", systemImage: "arrow.right")
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button))

                        Button {
                        } label: {
                            Image(systemName: "gearshape")
                                .frame(width: 18, height: 18)
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button, paddingV: LMControlSize.buttonMediumV, paddingH: LMControlSize.buttonMediumV))

                        Label("處理中", systemImage: "progress.indicator")
                            .modifier(TactileButtonLabelModifier(size: .medium))
                            .padding(.vertical, LMControlSize.buttonMediumV)
                            .padding(.horizontal, LMControlSize.buttonMediumH)
                            .modifier(TactileRaisedModifier(radius: LMRadius.button, isPressed: false))

                        // Disabled · 保留 raised 立體 + 陰影 (跟其他 button 視覺一致) · 降飽和 + 降透明感「暫時不能按」
                        Text("已停用")
                            .modifier(TactileButtonLabelModifier(size: .medium))
                            .padding(.vertical, LMControlSize.buttonMediumV)
                            .padding(.horizontal, LMControlSize.buttonMediumH)
                            .modifier(TactileRaisedModifier(radius: LMRadius.button, isPressed: false))
                            .saturation(0.35)
                            .opacity(LMOpacity.disabled)
                    }
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Buttons")
        .brandPage()
    }

}

// TactileButtonLabelModifierProxy 已移除、改用 TactileButtonStyles.swift 內 internal 化的 TactileButtonLabelModifier

#Preview {
    NavigationStack {
        ButtonsView()
    }
}
