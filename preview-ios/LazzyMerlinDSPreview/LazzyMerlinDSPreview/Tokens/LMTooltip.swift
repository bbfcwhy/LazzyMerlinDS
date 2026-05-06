import SwiftUI

// LazzyMerlin DS · Tooltip / Popover
// 取代 SwiftUI .popover() · 系統 popover material (iOS 26 Liquid Glass)
// 結構：trigger 旁邊插入 arrow + tactile bubble · 用 HStack/VStack 自然 anchor

// MARK: - Bubble shape (帶箭頭的 rounded rect)

struct LMTooltipBubble<Content: View>: View {

    var edge: Edge = .leading      // tooltip 從哪一邊長出來指向 trigger
    var cornerRadius: CGFloat = 10
    var arrowSize: CGFloat = 8
    @ViewBuilder var content: () -> Content

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        switch edge {
        case .leading:
            HStack(spacing: 0) {
                arrowShape(pointing: .leading)
                bubble
            }
        case .trailing:
            HStack(spacing: 0) {
                bubble
                arrowShape(pointing: .trailing)
            }
        case .top:
            VStack(spacing: 0) {
                arrowShape(pointing: .top)
                bubble
            }
        case .bottom:
            VStack(spacing: 0) {
                bubble
                arrowShape(pointing: .bottom)
            }
        }
    }

    private var bubble: some View {
        content()
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background {
                // 乾淨純色 bg · tooltip 是輕量提示、不套 tactile noise (避免太重)
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(Color.bgRaised)
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(Color.black.opacity(colorScheme == .dark ? 0.30 : 0.10), lineWidth: 1)
            }
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.40 : 0.20), radius: 4, x: 1, y: 3)
    }

    @ViewBuilder
    private func arrowShape(pointing direction: Edge) -> some View {
        let s = arrowSize
        switch direction {
        case .leading:
            Path { p in
                p.move(to: CGPoint(x: 0, y: s))
                p.addLine(to: CGPoint(x: s, y: 0))
                p.addLine(to: CGPoint(x: s, y: s * 2))
                p.closeSubpath()
            }
            .fill(Color.bgRaised)
            .frame(width: s, height: s * 2)
        case .trailing:
            Path { p in
                p.move(to: CGPoint(x: s, y: s))
                p.addLine(to: CGPoint(x: 0, y: 0))
                p.addLine(to: CGPoint(x: 0, y: s * 2))
                p.closeSubpath()
            }
            .fill(Color.bgRaised)
            .frame(width: s, height: s * 2)
        case .top:
            Path { p in
                p.move(to: CGPoint(x: s, y: 0))
                p.addLine(to: CGPoint(x: 0, y: s))
                p.addLine(to: CGPoint(x: s * 2, y: s))
                p.closeSubpath()
            }
            .fill(Color.bgRaised)
            .frame(width: s * 2, height: s)
        case .bottom:
            Path { p in
                p.move(to: CGPoint(x: s, y: s))
                p.addLine(to: CGPoint(x: 0, y: 0))
                p.addLine(to: CGPoint(x: s * 2, y: 0))
                p.closeSubpath()
            }
            .fill(Color.bgRaised)
            .frame(width: s * 2, height: s)
        }
    }
}
