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
            HStack(spacing: LMSpacing.sm) {
                label(selection)
                    .font(.lmBodySmall.weight(.medium))
                Image(systemName: "chevron.up.chevron.down")
                    .font(.lmCaption.weight(.semibold))
                    .opacity(LMOpacity.iconMuted)
            }
        }
        // Tactile secondary chrome · 跟其他 secondary CTA 同氣質 (雙層 shadow + press 動畫)
        .buttonStyle(TactileSecondaryButtonStyle(radius: LMRadius.md, paddingV: LMControlSize.buttonSmallV, paddingH: LMControlSize.buttonSmallH))
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
                        .font(.lmBodySmall.weight(.semibold))
                        .foregroundStyle(Color.inkMuted)
                        .frame(width: LMSpacing.section, height: LMSpacing.section)
                        .background(Circle().fill(Color.bgMuted))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, LMSpacing.page)
            .padding(.vertical, LMSpacing.lg)

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
                                    .font(.lmBodySmall)
                                    .foregroundStyle(Color.ink)
                                Spacer()
                                if selection == opt {
                                    Image(systemName: "checkmark")
                                        .font(.lmBodySmall.weight(.semibold))
                                        .foregroundStyle(Color.primaryBrand)
                                }
                            }
                            .padding(.horizontal, LMSpacing.page)
                            .padding(.vertical, LMSpacing.controlGap)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)

                        if idx < options.count - 1 {
                            Divider()
                                .overlay(Color.border)
                                .padding(.leading, LMSpacing.page)
                        }
                    }
                }
            }
        }
    }
}
