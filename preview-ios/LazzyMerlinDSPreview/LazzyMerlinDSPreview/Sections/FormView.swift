import SwiftUI

struct FormView: View {

    @State private var email: String = ""
    @State private var note: String = "懶人魔法師慵懶地閃耀著。"
    @State private var notify: Bool = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                section("INPUT (Tactile Inset)") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("EMAIL").sectionLabel()
                        TextField("you@lazzymerlin.com", text: $email)
                            .textContentType(.emailAddress)
                            #if os(iOS)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            #endif
                            .autocorrectionDisabled()
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                            .foregroundStyle(Color.ink)
                            .tactileInset(radius: 10)
                    }
                }

                section("TEXTAREA (Tactile Inset · 高版)") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("NOTE").sectionLabel()
                        TextEditor(text: $note)
                            .scrollContentBackground(.hidden)
                            .frame(minHeight: 100)
                            .font(.lmBody)
                            .foregroundStyle(Color.ink)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .tactileInset(radius: 10)
                    }
                }

                section("TOGGLE / SWITCH (SwiftUI native + .tint)") {
                    Toggle("接收懶人魔法師的更新", isOn: $notify)
                        .tint(Color.primaryBrand)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .tactileBase(radius: 10)
                }

                section("VALIDATION (Earth Red)") {
                    VStack(alignment: .leading, spacing: 6) {
                        TextField("密碼", text: .constant("123"))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                            .foregroundStyle(Color.ink)
                            .tactileInset(radius: 10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(Color.earthRed, lineWidth: 1)
                            }
                        HStack(spacing: 6) {
                            Image(systemName: "exclamationmark.circle.fill")
                                .font(.system(size: 12))
                            Text("至少 8 個字。")
                                .font(.lmCaption)
                        }
                        .foregroundStyle(Color.earthRed)
                    }
                }

                Spacer(minLength: 32)
            }
            .padding(20)
        }
        .navigationTitle("Form")
        .brandPage()
    }

    @ViewBuilder
    private func section<Content: View>(_ title: String,
                                        @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).sectionLabel()
            content()
        }
    }
}

#Preview {
    NavigationStack {
        FormView()
    }
}
