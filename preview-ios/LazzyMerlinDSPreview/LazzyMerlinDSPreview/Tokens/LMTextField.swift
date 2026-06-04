import SwiftUI

// LazzyMerlin DS · Text input（LMTextField 單行 / LMTextEditor 多行）
// 包原生 TextField / TextEditor 成 DS inset 輸入框、取代每個專案各自手刻
// 對齊 DESIGN.md §15.3.2 Input / Textarea（web spec 已有，這裡補 iOS 實作）
//
// 食譜：.scrollContentBackground(.hidden)（去系統白底）+ tokenized padding
//       + .tactileInset(radius:)（§5.6 Soft Inset 凹陷輸入槽）
//       文字色 Color.ink、placeholder Color.inkMuted（自畫 overlay、不靠系統灰）
//
// ChronoPath landing（2026-06）回饋收編版：原本各專案用 `TextEditor + scrollContentBackground
// + padding + tactileInset` 重複手刻（見 PromptEditorView），收成 DS 正式 wrapper。
//
// state：isInvalid（earthRed 1.5pt 外框）/ isDisabled（變灰 + 鎖定），對齊 §15.3.8 / §15.3.9。
//
// API：
//   LMTextField("name@example.com", text: $email)
//   LMTextField("使用者名稱", text: $name, isInvalid: true)
//   LMTextField("只能看", text: .constant(""), isDisabled: true)
//   LMTextEditor(text: $note)                       // minHeight 預設 96（對齊 web textarea）
//   LMTextEditor("想說什麼…", text: $note, minHeight: 120)

// MARK: - Single line

struct LMTextField: View {
    let placeholder: String
    @Binding var text: String
    var isInvalid: Bool = false
    var isDisabled: Bool = false
    var radius: CGFloat = LMRadius.xl
    var accessibilityLabel: String? = nil

    init(_ placeholder: String = "",
         text: Binding<String>,
         isInvalid: Bool = false,
         isDisabled: Bool = false,
         radius: CGFloat = LMRadius.xl,
         accessibilityLabel: String? = nil) {
        self.placeholder = placeholder
        self._text = text
        self.isInvalid = isInvalid
        self.isDisabled = isDisabled
        self.radius = radius
        self.accessibilityLabel = accessibilityLabel
    }

    var body: some View {
        ZStack(alignment: .leading) {
            // placeholder 自畫 · 控 inkMuted 色（系統預設灰跟 DS 不合）
            if text.isEmpty {
                Text(placeholder)
                    .font(.lmBodySmall)
                    .foregroundStyle(Color.inkMuted)
                    .padding(.vertical, LMSpacing.controlGap)
                    .padding(.horizontal, 18)
                    .allowsHitTesting(false)
            }
            TextField("", text: $text)
                .font(.lmBodySmall)
                .foregroundStyle(isDisabled ? Color.inkMutedDisabled : Color.ink)
                .padding(.vertical, LMSpacing.controlGap)
                .padding(.horizontal, 18)
        }
        .tactileInset(radius: radius)
        .overlay {
            if isInvalid {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(Color.earthRed, lineWidth: 1.5)
            }
        }
        .opacity(isDisabled ? LMOpacity.disabled : 1)
        .disabled(isDisabled)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabel ?? placeholder)
    }
}

// MARK: - Multi line

struct LMTextEditor: View {
    let placeholder: String
    @Binding var text: String
    var minHeight: CGFloat = 96   // 對齊 web textarea min-height: 96px（§15.3.2）
    var isInvalid: Bool = false
    var isDisabled: Bool = false
    var radius: CGFloat = LMRadius.xl
    var accessibilityLabel: String? = nil

    init(_ placeholder: String = "",
         text: Binding<String>,
         minHeight: CGFloat = 96,
         isInvalid: Bool = false,
         isDisabled: Bool = false,
         radius: CGFloat = LMRadius.xl,
         accessibilityLabel: String? = nil) {
        self.placeholder = placeholder
        self._text = text
        self.minHeight = minHeight
        self.isInvalid = isInvalid
        self.isDisabled = isDisabled
        self.radius = radius
        self.accessibilityLabel = accessibilityLabel
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            // placeholder 對齊 TextEditor 內部 text container inset（top ~8 / leading ~5）
            if text.isEmpty {
                Text(placeholder)
                    .font(.lmBodySmall)
                    .foregroundStyle(Color.inkMuted)
                    .padding(.vertical, 10 + 8)
                    .padding(.horizontal, LMSpacing.controlGap + 5)
                    .allowsHitTesting(false)
            }
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)   // 去系統白底
                .font(.lmBodySmall)
                .foregroundStyle(isDisabled ? Color.inkMutedDisabled : Color.ink)
                .frame(minHeight: minHeight)
                .padding(.vertical, 10)
                .padding(.horizontal, LMSpacing.controlGap)
        }
        .tactileInset(radius: radius)
        .overlay {
            if isInvalid {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(Color.earthRed, lineWidth: 1.5)
            }
        }
        .opacity(isDisabled ? LMOpacity.disabled : 1)
        .disabled(isDisabled)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabel ?? placeholder)
    }
}

#Preview("LMTextField / LMTextEditor") {
    struct Demo: View {
        @State private var email = ""
        @State private var name = "lazzymerlin"
        @State private var note = ""
        var body: some View {
            VStack(alignment: .leading, spacing: LMSpacing.lg) {
                LMTextField("name@example.com", text: $email)
                LMTextField("使用者名稱", text: $name, isInvalid: true)
                LMTextField("只能看，動不了", text: .constant(""), isDisabled: true)
                LMTextEditor("想說什麼…（懶人沒空寫）", text: $note)
            }
            .padding(LMSpacing.page)
            .brandPage()
        }
    }
    return NavigationStack { Demo() }
}
