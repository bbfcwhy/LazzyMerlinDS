import SwiftUI

// LazzyMerlin DS · Menu Picker
// 取代 SwiftUI Picker(.menu) · 系統 menu material (Liquid Glass)
// 結構：trigger = clean inset capsule + chevron · 點開以 sheet 呈現自訂 option list

struct LMMenuPicker<Selection: Hashable, Label: View, OptionLabel: View>: View {

    @Binding var selection: Selection
    let options: [Selection]
    let title: String
    @ViewBuilder let label: (Selection) -> Label
    @ViewBuilder let optionLabel: (Selection) -> OptionLabel

    @State private var showSheet: Bool = false
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Button {
            showSheet = true
        } label: {
            HStack(spacing: 8) {
                label(selection)
                    .font(.system(size: 14, weight: .medium))
                Image(systemName: "chevron.up.chevron.down")
                    .font(.system(size: 11, weight: .semibold))
                    .opacity(0.55)
            }
        }
        // Tactile secondary chrome · 跟其他 secondary CTA 同氣質 (雙層 shadow + press 動畫)
        .buttonStyle(TactileSecondaryButtonStyle(radius: 10, paddingV: 8, paddingH: 14))
        .sheet(isPresented: $showSheet) {
            sheetContent
                .lmSheetChrome()
                .presentationDetents([.medium, .large])
        }
    }

    private var sheetContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.lmH3)
                    .foregroundStyle(Color.ink)
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.inkMuted)
                        .frame(width: 32, height: 32)
                        .background(Circle().fill(Color.bgMuted))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)

            Divider().overlay(Color.border)

            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Array(options.enumerated()), id: \.offset) { idx, opt in
                        Button {
                            selection = opt
                            showSheet = false
                        } label: {
                            HStack {
                                optionLabel(opt)
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.ink)
                                Spacer()
                                if selection == opt {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundStyle(Color.primaryBrand)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)

                        if idx < options.count - 1 {
                            Divider()
                                .overlay(Color.border)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
    }
}
