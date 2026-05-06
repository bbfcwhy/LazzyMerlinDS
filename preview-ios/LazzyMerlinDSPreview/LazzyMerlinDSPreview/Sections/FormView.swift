import SwiftUI

struct FormView: View {

    @State private var email: String = ""
    @State private var invalidEmail: String = "not-an-email"
    @State private var username: String = "lazzymerlin"
    @State private var note: String = "懶人魔法師慵懶地閃耀著。"
    @State private var notify: Bool = true
    @State private var stepperVal: Double = 3
    @State private var sliderVal: Double = 0.42
    @State private var pickedDate: Date = Date()
    @State private var pickedColor: Color = .primaryBrand

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                LMSection("INPUT · DEFAULT / ERROR / SUCCESS") {
                    formField("Email", required: true, helper: "我們不會傳行銷信。懶人沒空寫。") {
                        input("name@example.com", text: $email)
                    }

                    formField("Email（錯誤示範）", error: "請含 @ 符號，例：name@example.com") {
                        input("", text: $invalidEmail, isInvalid: true)
                    }

                    formField("使用者名稱", success: "可以用") {
                        input("", text: $username)
                    }
                }

                LMSection("TEXTAREA · SELECT · DISABLED") {
                    formField("想說什麼") {
                        TextEditor(text: $note)
                            .scrollContentBackground(.hidden)
                            .frame(minHeight: 96)
                            .font(.lmBodySmall)
                            .foregroundStyle(Color.ink)
                            .padding(.vertical, 10)
                            .padding(.horizontal, LMSpacing.controlGap)
                            .tactileInset(radius: 16)
                    }

                    formField("你是哪種懶") {
                        HStack {
                            Text("選一個...")
                                .font(.lmBodySmall)
                                .foregroundStyle(Color.ink)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.lmCaption.weight(.semibold))
                                .foregroundStyle(Color.ink)
                        }
                        .padding(.vertical, LMSpacing.controlGap)
                        .padding(.horizontal, 18)
                        .tactileInset(radius: 16)
                    }

                    formField("已鎖欄位") {
                        input("只能看，動不了", text: .constant(""), isDisabled: true)
                    }
                }

                LMSection("TOGGLE / SWITCH") {
                    Toggle("接收懶人魔法師的更新", isOn: $notify)
                        .toggleStyle(.lmSwitch)
                        .font(.lmBodySmall)
                        .foregroundStyle(Color.ink)
                        .padding(.vertical, LMSpacing.md)
                        .padding(.horizontal, LMSpacing.lg)
                        .tactileBase(radius: 12)
                }

                LMSection("SLIDER") {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("音量")
                                .font(.lmBodySmall)
                                .foregroundStyle(Color.ink)
                            Spacer()
                            Text(String(format: "%.0f%%", sliderVal * 100))
                                .font(.system(.footnote, design: .monospaced))
                                .foregroundStyle(Color.primaryBrand)
                        }
                        LMSlider(value: $sliderVal, range: 0...1, step: 0.01)
                    }
                    .padding(.vertical, LMSpacing.md)
                    .padding(.horizontal, LMSpacing.controlGap)
                    .tactileBase(radius: 12)
                }

                LMSection("STEPPER") {
                    HStack {
                        Text("數量")
                            .font(.lmBodySmall)
                            .foregroundStyle(Color.ink)
                        Spacer()
                        LMStepper(value: $stepperVal, range: 0...20, step: 1)
                    }
                    .padding(.vertical, LMSpacing.sm)
                    .padding(.horizontal, LMSpacing.controlGap)
                    .tactileBase(radius: 12)
                }

                LMSection("COLOR PICKER") {
                    VStack(spacing: 0) {
                        LMColorPicker(title: "選個顏色", color: $pickedColor)
                            .padding(.vertical, LMSpacing.md)
                            .padding(.horizontal, LMSpacing.controlGap)
                    }
                    .tactileBase(radius: 12)
                }

                LMSection("DATE PICKER") {
                    LMDatePicker(selection: $pickedDate)
                }

                Spacer(minLength: 32)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Form")
        .brandPage()
    }

    @ViewBuilder
    private func formField<Content: View>(_ label: String,
                                          required: Bool = false,
                                          helper: String? = nil,
                                          error: String? = nil,
                                          success: String? = nil,
                                          @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: LMSpacing.xs) {
            HStack(spacing: 2) {
                Text(label)
                    .font(.lmBodySmall.weight(.medium))
                    .foregroundStyle(Color.ink)
                if required {
                    Text("*")
                        .font(.lmBodySmall.weight(.medium))
                        .foregroundStyle(Color.earthRed)
                }
            }

            content()

            if let helper {
                Text(helper)
                    .font(.lmCaption)
                    .foregroundStyle(Color.inkMuted)
            }
            if let error {
                HStack(spacing: LMSpacing.xs) {
                    Image(systemName: "exclamationmark.circle")
                    Text(error)
                }
                .font(.lmCaption)
                .foregroundStyle(Color.earthRed)
            }
            if let success {
                HStack(spacing: LMSpacing.xs) {
                    Image(systemName: "checkmark")
                    Text(success)
                }
                .font(.lmCaption)
                .foregroundStyle(Color.earthGreen)
            }
        }
    }

    @ViewBuilder
    private func input(_ placeholder: String,
                       text: Binding<String>,
                       isInvalid: Bool = false,
                       isDisabled: Bool = false) -> some View {
        TextField(placeholder, text: text)
            .textContentType(.emailAddress)
            #if os(iOS)
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
            #endif
            .autocorrectionDisabled()
            .font(.lmBodySmall)
            .foregroundStyle(isDisabled ? Color.inkMuted.opacity(0.60) : Color.ink)
            .padding(.vertical, LMSpacing.controlGap)
            .padding(.horizontal, 18)
            .tactileInset(radius: 16)
            .overlay {
                if isInvalid {
                    RoundedRectangle(cornerRadius: LMRadius.xl, style: .continuous)
                        .strokeBorder(Color.earthRed, lineWidth: 1.5)
                }
            }
            .opacity(isDisabled ? 0.60 : 1)
            .disabled(isDisabled)
    }

}

#Preview {
    NavigationStack {
        FormView()
    }
}
