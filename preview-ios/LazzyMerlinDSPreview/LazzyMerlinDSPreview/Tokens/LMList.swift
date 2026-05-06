import SwiftUI

// LazzyMerlin DS · List primitives
// 取代 SwiftUI List + NavigationLink · iOS 26 系統 inset grouped + Liquid Glass row
// 結構：LMListSection (tactilePlain 容器) + LMListRow / LMListRowLink + LMListDivider

// MARK: - Section container

struct LMListSection<Content: View>: View {
    var header: String? = nil
    var footer: String? = nil
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let header {
                Text(header)
                    .sectionLabel()
                    .padding(.horizontal, 20)
            }

            VStack(spacing: 0) {
                content()
            }
            .tactilePlain(radius: 14)
            .padding(.horizontal, 16)

            if let footer {
                Text(footer)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 20)
                    .padding(.top, 2)
            }
        }
    }
}

// MARK: - Row content (用在 LMListRow / LMListRowLink 內)

struct LMListRowContent<Leading: View, Trailing: View>: View {
    let title: String
    var subtitle: String? = nil
    @ViewBuilder var leading: () -> Leading
    @ViewBuilder var trailing: () -> Trailing

    var body: some View {
        HStack(spacing: 12) {
            leading()
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.lmBody)
                    .foregroundStyle(Color.ink)
                if let subtitle {
                    Text(subtitle)
                        .font(.lmCaption)
                        .foregroundStyle(Color.inkMuted)
                }
            }
            Spacer(minLength: 8)
            trailing()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .contentShape(Rectangle())
    }
}

// MARK: - Static row (no nav)

struct LMListRow<Leading: View, Trailing: View>: View {
    let title: String
    var subtitle: String? = nil
    @ViewBuilder var leading: () -> Leading
    @ViewBuilder var trailing: () -> Trailing

    var body: some View {
        LMListRowContent(title: title, subtitle: subtitle, leading: leading, trailing: trailing)
    }
}

extension LMListRow where Leading == EmptyView, Trailing == EmptyView {
    init(_ title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.leading = { EmptyView() }
        self.trailing = { EmptyView() }
    }
}

extension LMListRow where Trailing == EmptyView {
    init(_ title: String, subtitle: String? = nil, @ViewBuilder leading: @escaping () -> Leading) {
        self.title = title
        self.subtitle = subtitle
        self.leading = leading
        self.trailing = { EmptyView() }
    }
}

// MARK: - Nav link row

struct LMListRowLink<Destination: View, Leading: View, Trailing: View>: View {
    let title: String
    var subtitle: String? = nil
    @ViewBuilder var leading: () -> Leading
    @ViewBuilder var trailing: () -> Trailing
    let destination: () -> Destination

    @State private var isPressed: Bool = false

    var body: some View {
        NavigationLink {
            destination()
        } label: {
            LMListRowContent(
                title: title,
                subtitle: subtitle,
                leading: leading,
                trailing: {
                    HStack(spacing: 6) {
                        trailing()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(Color.inkMuted.opacity(0.55))
                    }
                }
            )
            .background(isPressed ? Color.bgMuted.opacity(0.5) : Color.clear)
        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressed {
                        withAnimation(.easeOut(duration: 0.08)) { isPressed = true }
                    }
                }
                .onEnded { _ in
                    withAnimation(.easeOut(duration: 0.18)) { isPressed = false }
                }
        )
    }
}

extension LMListRowLink where Leading == EmptyView, Trailing == EmptyView {
    init(_ title: String,
         subtitle: String? = nil,
         @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.subtitle = subtitle
        self.leading = { EmptyView() }
        self.trailing = { EmptyView() }
        self.destination = destination
    }
}

extension LMListRowLink where Trailing == EmptyView {
    init(_ title: String,
         subtitle: String? = nil,
         @ViewBuilder leading: @escaping () -> Leading,
         @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.subtitle = subtitle
        self.leading = leading
        self.trailing = { EmptyView() }
        self.destination = destination
    }
}

extension LMListRowLink {
    /// Full custom: leading + trailing 都自訂
    init(_ title: String,
         subtitle: String? = nil,
         @ViewBuilder leading: @escaping () -> Leading,
         @ViewBuilder trailing: @escaping () -> Trailing,
         @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.subtitle = subtitle
        self.leading = leading
        self.trailing = trailing
        self.destination = destination
    }
}

// MARK: - List divider
// LMListDivider 是 LMDivider(inset: 16) 的 alias、保留向後相容
// 實際 struct 定義在 Tokens/LMDivider.swift
