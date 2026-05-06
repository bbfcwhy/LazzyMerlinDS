import SwiftUI

struct DataView: View {

    private let rows: [ProjectRow] = [
        .init(project: "專案 A", platform: "Web", status: "LIVE", statusColor: .primaryBrand, dau: "1,284", revenue: "$3,420"),
        .init(project: "專案 B", platform: "Web · iOS", status: "BETA", statusColor: .earthGreen, dau: "512", revenue: "$890"),
        .init(project: "專案 C", platform: "macOS", status: "DRAFT", statusColor: .stone, dau: "—", revenue: "—")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {
                LMSection("TABLE") {
                    VStack(spacing: 0) {
                        tableHeader
                        ForEach(rows) { row in
                            tableRow(row)
                        }
                    }
                    .padding(.vertical, LMSpacing.sm)
                    .tactilePlain(radius: 14)
                }

                LMSection("LIST") {
                    VStack(spacing: 0) {
                        listRow(initial: "威", title: "把網站重構成 LazzyMerlin DS v5", meta: "2026-05-05 · 預估 4 小時", color: .primaryBrand)
                        Divider().overlay(Color.border)
                        listRow(initial: "梅", title: "整理 preview component coverage", meta: "進行中", color: .stone)
                        Divider().overlay(Color.border)
                        listRow(initial: nil, title: "寫今日手札", meta: "還沒開始", color: .earthGreen, usesMoonStar: true)
                    }
                    .tactilePlain(radius: 14)
                }

                Spacer(minLength: 32)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Data")
        .brandPage()
    }

    private var tableHeader: some View {
        HStack {
            Text("專案").frame(maxWidth: .infinity, alignment: .leading)
            Text("平台").frame(width: 84, alignment: .leading)
            Text("狀態").frame(width: 68, alignment: .leading)
            Text("DAU").frame(width: 68, alignment: .trailing)
        }
        .font(.lmLabel)
        .foregroundStyle(Color.inkMuted)
        .padding(.horizontal, LMSpacing.controlGap)
        .padding(.vertical, 10)
    }

    @ViewBuilder
    private func tableRow(_ row: ProjectRow) -> some View {
        HStack(spacing: 10) {
            Text(row.project)
                .font(.lmBodySmall.weight(.semibold))
                .foregroundStyle(Color.ink)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(row.platform)
                .font(.lmCaption)
                .foregroundStyle(Color.inkMuted)
                .frame(width: 84, alignment: .leading)
            Text(row.status)
                .font(.lmLabel)
                .padding(.vertical, LMSpacing.xxs)
                .padding(.horizontal, 7)
                .tactilePill(color: row.statusColor)
                .frame(width: 68, alignment: .leading)
            Text(row.dau)
                .font(.lmCaption.monospacedDigit())
                .foregroundStyle(Color.ink)
                .frame(width: 68, alignment: .trailing)
        }
        .padding(.horizontal, LMSpacing.controlGap)
        .padding(.vertical, LMSpacing.md)
    }

    @ViewBuilder
    private func listRow(initial: String?,
                         title: String,
                         meta: String,
                         color: Color,
                         usesMoonStar: Bool = false) -> some View {
        HStack(spacing: LMSpacing.md) {
            if usesMoonStar {
                LMAvatar(assetImage: "MoonStars", color: color)
            } else {
                LMAvatar(initial: initial ?? "", color: color)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.lmBodySmall.weight(.semibold))
                    .foregroundStyle(Color.ink)
                Text(meta)
                    .font(.lmCaption)
                    .foregroundStyle(Color.inkMuted)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.inkMuted)
        }
        .padding(LMSpacing.controlGap)
    }

}

private struct ProjectRow: Identifiable {
    let id = UUID()
    let project: String
    let platform: String
    let status: String
    let statusColor: Color
    let dau: String
    let revenue: String
}

#Preview {
    NavigationStack {
        DataView()
    }
}
