import SwiftUI

struct DataView: View {

    private let rows: [ProjectRow] = [
        .init(project: "專案 A", platform: "Web", status: "LIVE", statusColor: .primaryBrand, dau: "1,284", revenue: "$3,420"),
        .init(project: "專案 B", platform: "Web · iOS", status: "BETA", statusColor: .earthGreen, dau: "512", revenue: "$890"),
        .init(project: "專案 C", platform: "macOS", status: "DRAFT", statusColor: .stone, dau: "—", revenue: "—")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                section("TABLE") {
                    VStack(spacing: 0) {
                        tableHeader
                        ForEach(rows) { row in
                            tableRow(row)
                        }
                    }
                    .padding(.vertical, 8)
                    .tactilePlain(radius: 14)
                }

                section("LIST") {
                    VStack(spacing: 0) {
                        listRow(initial: "威", title: "把網站重構成 LazzyMerlin DS v5", meta: "2026-05-05 · 預估 4 小時", color: .primaryBrand)
                        Divider().overlay(Color.border)
                        listRow(initial: "梅", title: "整理 preview component coverage", meta: "進行中", color: .stone)
                        Divider().overlay(Color.border)
                        listRow(initial: "✦", title: "寫今日手札", meta: "還沒開始", color: .earthGreen)
                    }
                    .tactilePlain(radius: 14)
                }

                Spacer(minLength: 32)
            }
            .padding(20)
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
        .padding(.horizontal, 14)
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
                .padding(.vertical, 4)
                .padding(.horizontal, 7)
                .tactilePill(color: row.statusColor)
                .frame(width: 68, alignment: .leading)
            Text(row.dau)
                .font(.lmCaption.monospacedDigit())
                .foregroundStyle(Color.ink)
                .frame(width: 68, alignment: .trailing)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
    }

    @ViewBuilder
    private func listRow(initial: String, title: String, meta: String, color: Color) -> some View {
        HStack(spacing: 12) {
            Text(initial)
                .font(.lmBodySmall.weight(.semibold))
                .frame(width: 38, height: 38)
                .tactileCircle(color: color)
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
        .padding(14)
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
