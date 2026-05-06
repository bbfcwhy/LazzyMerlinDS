import SwiftUI

// LazzyMerlin DS · Alert + ActionSheet (overlay 版、不用系統 .alert / .confirmationDialog)
// 系統 alert / confirmationDialog 是 black box、tint 以外完全鎖死、必須整個替代

// MARK: - Alert button spec

struct LMAlertButton: Identifiable {
    enum Role { case `default`, destructive, cancel }
    let id = UUID()
    let title: String
    let role: Role
    let action: () -> Void

    static func `default`(_ title: String, action: @escaping () -> Void = {}) -> LMAlertButton {
        .init(title: title, role: .default, action: action)
    }
    static func destructive(_ title: String, action: @escaping () -> Void = {}) -> LMAlertButton {
        .init(title: title, role: .destructive, action: action)
    }
    static func cancel(_ title: String = "取消", action: @escaping () -> Void = {}) -> LMAlertButton {
        .init(title: title, role: .cancel, action: action)
    }
}

// MARK: - Alert overlay modifier

struct LMAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    let message: String?
    let buttons: [LMAlertButton]

    func body(content: Content) -> some View {
        content.overlay {
            ZStack {
                if isPresented {
                    // Backdrop
                    LMOverlayChrome.backdrop
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            if let cancel = buttons.first(where: { $0.role == .cancel }) {
                                cancel.action()
                            }
                            withAnimation(LMMotion.quickDismiss) { isPresented = false }
                        }

                    LMAlertCard(
                        title: title,
                        message: message,
                        buttons: buttons,
                        dismiss: {
                            withAnimation(LMMotion.quickDismiss) { isPresented = false }
                        }
                    )
                    .padding(.horizontal, LMSpacing.section)
                    .transition(.scale(scale: 0.92).combined(with: .opacity))
                }
            }
            .animation(LMMotion.overlaySpring, value: isPresented)
        }
    }
}

private struct LMAlertCard: View {
    let title: String
    let message: String?
    let buttons: [LMAlertButton]
    let dismiss: () -> Void

    var body: some View {
        cardContent
            .padding(LMSpacing.card)
            .frame(maxWidth: LMOverlayChrome.cardMaxWidth)
            .lmOverlayCardChrome()
    }

    private var cardContent: some View {
        VStack(alignment: .leading, spacing: LMSpacing.controlGap) {
            Text(title)
                .font(.lmH3)
                .foregroundStyle(Color.ink)
            if let message {
                Text(message)
                    .font(.lmBodySmall)
                    .foregroundStyle(Color.inkMuted)
                    .lineSpacing(LMLineSpacing.normal)
            }
            buttonRow
        }
    }

    @ViewBuilder
    private var buttonRow: some View {
        // 兩顆以下橫排、三顆以上直排
        if buttons.count <= 2 {
            HStack(spacing: LMRadius.md) {
                ForEach(buttons) { btn in
                    button(btn)
                }
            }
            .padding(.top, LMSpacing.xxs)
        } else {
            VStack(spacing: LMSpacing.sm) {
                ForEach(buttons) { btn in
                    button(btn)
                }
            }
            .padding(.top, LMSpacing.xxs)
        }
    }

    @ViewBuilder
    private func button(_ btn: LMAlertButton) -> some View {
        Button {
            btn.action()
            dismiss()
        } label: {
            Text(btn.title)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(buttonStyleFor(btn.role))
    }

    private func buttonStyleFor(_ role: LMAlertButton.Role) -> AnyButtonStyle {
        switch role {
        case .destructive: return AnyButtonStyle(TactileDestructiveButtonStyle(radius: LMRadius.button, paddingV: LMControlSize.alertButtonV, paddingH: LMControlSize.alertButtonH))
        case .cancel:      return AnyButtonStyle(TactileSecondaryButtonStyle(radius: LMRadius.button, paddingV: LMControlSize.alertButtonV, paddingH: LMControlSize.alertButtonH))
        case .default:     return AnyButtonStyle(TactileRaisedButtonStyle(radius: LMRadius.button, paddingV: LMControlSize.alertButtonV, paddingH: LMControlSize.alertButtonH))
        }
    }
}

// MARK: - Action sheet (bottom)

struct LMActionSheetModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String?
    let buttons: [LMAlertButton]

    func body(content: Content) -> some View {
        content.overlay {
            ZStack(alignment: .bottom) {
                if isPresented {
                    LMOverlayChrome.backdrop
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation(LMMotion.quickDismiss) { isPresented = false }
                        }

                    LMActionSheetCard(
                        title: title,
                        buttons: buttons,
                        dismiss: {
                            withAnimation(LMMotion.quickDismiss) { isPresented = false }
                        }
                    )
                    .padding(.horizontal, LMSpacing.md)
                    .padding(.bottom, LMSpacing.md)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(LMMotion.overlaySpring, value: isPresented)
        }
    }
}

private struct LMActionSheetCard: View {
    let title: String?
    let buttons: [LMAlertButton]
    let dismiss: () -> Void
    @Environment(\.colorScheme) private var colorScheme

    private var actionButtons: [LMAlertButton] { buttons.filter { $0.role != .cancel } }
    private var cancelButton: LMAlertButton? { buttons.first { $0.role == .cancel } }

    var body: some View {
        VStack(spacing: LMSpacing.sm) {
            // Action group
            VStack(spacing: 0) {
                if let title {
                    Text(title)
                        .font(.lmCaption)
                        .foregroundStyle(Color.inkMuted)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, LMSpacing.controlGap)
                    Divider().overlay(Color.border.opacity(0.5))
                }
                ForEach(Array(actionButtons.enumerated()), id: \.offset) { idx, btn in
                    Button {
                        btn.action()
                        dismiss()
                    } label: {
                        Text(btn.title)
                            .font(.lmBody.weight(btn.role == .destructive ? .semibold : .regular))
                            .foregroundStyle(btn.role == .destructive ? Color.earthRed : Color.ink)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, LMSpacing.lg)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    if idx < actionButtons.count - 1 {
                        Divider().overlay(Color.border.opacity(0.5))
                    }
                }
            }
            .background(sheetBackground(corner: 18))

            // Cancel separated
            if let cancelButton {
                Button {
                    cancelButton.action()
                    dismiss()
                } label: {
                    Text(cancelButton.title)
                        .font(.lmBody.weight(.semibold))
                        .foregroundStyle(Color.ink)
                        .frame(maxWidth: .infinity)
                            .padding(.vertical, LMSpacing.lg)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .background(sheetBackground(corner: 18))
            }
        }
    }

    private func sheetBackground(corner: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: corner, style: .continuous)
            .fill(Color.bgRaised)
            .overlay {
                RoundedRectangle(cornerRadius: corner, style: .continuous)
                    .strokeBorder(LMOverlayChrome.actionSheetBorder(colorScheme), lineWidth: 1)
            }
            .shadow(color: LMOverlayChrome.cardShadow, radius: 14, x: 0, y: 8)
    }
}

// MARK: - Type-erasing ButtonStyle wrapper

struct AnyButtonStyle: ButtonStyle {
    private let _makeBody: (Configuration) -> AnyView

    init<S: ButtonStyle>(_ style: S) {
        self._makeBody = { config in
            AnyView(style.makeBody(configuration: config))
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}

// MARK: - View extensions

extension View {
    /// LazzyMerlin alert · 取代 SwiftUI .alert()
    func lmAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String? = nil,
        buttons: [LMAlertButton]
    ) -> some View {
        modifier(LMAlertModifier(
            isPresented: isPresented,
            title: title,
            message: message,
            buttons: buttons
        ))
    }

    /// LazzyMerlin action sheet · 取代 SwiftUI .confirmationDialog()
    func lmActionSheet(
        isPresented: Binding<Bool>,
        title: String? = nil,
        buttons: [LMAlertButton]
    ) -> some View {
        modifier(LMActionSheetModifier(
            isPresented: isPresented,
            title: title,
            buttons: buttons
        ))
    }
}
