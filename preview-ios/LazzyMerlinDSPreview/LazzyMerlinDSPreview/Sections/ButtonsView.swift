import SwiftUI

struct ButtonsView: View {
    private let columns = [GridItem(.adaptive(minimum: 118), spacing: 14)]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                LMSection("VARIANTS") {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 14) {
                        Button("送出 Primary") {}
                            .buttonStyle(TactileRaisedButtonStyle(radius: 12))

                        Button("Cancel Secondary") {}
                            .buttonStyle(TactileSecondaryButtonStyle(radius: 12))

                        Button("Skip Ghost") {}
                            .buttonStyle(TactileGhostButtonStyle())

                        Button("刪除 Destructive") {}
                            .buttonStyle(TactileDestructiveButtonStyle(radius: 12))

                        Button("Brand Deep") {}
                            .buttonStyle(TactileRaisedButtonStyle(radius: 12, baseColor: .primaryDeep))
                    }
                }

                LMSection("SIZES") {
                    HStack(alignment: .center, spacing: 12) {
                        Button("S") {}
                            .buttonStyle(TactileRaisedButtonStyle(
                                radius: 10, paddingV: 8, paddingH: 14
                            ))
                        Button("中") {}
                            .buttonStyle(TactileRaisedButtonStyle(radius: 12))
                        Button("Large") {}
                            .buttonStyle(TactileRaisedButtonStyle(
                                radius: 14, paddingV: 16, paddingH: 28
                            ))
                    }
                }

                LMSection("ICON · LOADING · DISABLED") {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 14) {
                        Button {
                        } label: {
                            Label("新增", systemImage: "plus")
                        }
                        .buttonStyle(TactileRaisedButtonStyle(radius: 12))

                        Button {
                        } label: {
                            Label("查看更多", systemImage: "arrow.right")
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: 12))

                        Button {
                        } label: {
                            Image(systemName: "gearshape")
                                .frame(width: 18, height: 18)
                        }
                        .buttonStyle(TactileSecondaryButtonStyle(radius: 12, paddingV: 12, paddingH: 12))

                        Label("處理中", systemImage: "progress.indicator")
                            .modifier(TactileButtonLabelModifier(size: .medium))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 22)
                            .modifier(TactileRaisedModifier(radius: 12, isPressed: false))

                        // Disabled · 保留 raised 立體 + 陰影 (跟其他 button 視覺一致) · 降飽和 + 降透明感「暫時不能按」
                        Text("已停用")
                            .modifier(TactileButtonLabelModifier(size: .medium))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 22)
                            .modifier(TactileRaisedModifier(radius: 12, isPressed: false))
                            .saturation(0.35)
                            .opacity(0.55)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
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
