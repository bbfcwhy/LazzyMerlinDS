import SwiftUI

// LazzyMerlin DS · Breadcrumb (層級導航)
// 結構：[首頁] · [專案] · [當前頁]
//   - 前面項目用 primaryBrand 字 (可點)
//   - 最後一項 (current page) 用 inkMuted 字 (不可點)
//   - 中間用 · 分隔符 inkMuted

private struct LMBreadcrumbCrumb: Identifiable {
    let id: Int
    let text: String
    let isLast: Bool
}

struct LMBreadcrumb: View {

    let items: [String]
    var separator: String = "·"
    var onTap: ((Int) -> Void)? = nil

    private var crumbs: [LMBreadcrumbCrumb] {
        items.enumerated().map { offset, text in
            LMBreadcrumbCrumb(id: offset, text: text, isLast: offset == items.count - 1)
        }
    }

    var body: some View {
        HStack(spacing: 8) {
            ForEach(crumbs) { crumb in
                if crumb.id > 0 {
                    Text(separator)
                        .foregroundStyle(Color.inkMuted)
                }
                breadcrumbItem(crumb)
            }
        }
        .font(.lmBodySmall)
    }

    @ViewBuilder
    private func breadcrumbItem(_ crumb: LMBreadcrumbCrumb) -> some View {
        if crumb.isLast {
            Text(crumb.text)
                .foregroundStyle(Color.inkMuted)
        } else {
            Button {
                onTap?(crumb.id)
            } label: {
                Text(crumb.text)
                    .foregroundStyle(Color.primaryBrand)
            }
            .buttonStyle(.plain)
        }
    }
}
