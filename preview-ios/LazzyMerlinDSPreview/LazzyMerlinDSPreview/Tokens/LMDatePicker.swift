import SwiftUI

// LazzyMerlin DS · Date Picker (graphical 月曆)
// 取代 SwiftUI DatePicker · 系統 black-box 日期選擇器
// 結構：月份 header (prev / month / next) + 7×6 grid · 選中日 brand 圓 pill
//
// components 模式（ChronoPath landing 2026-06 回饋擴充，DS 原本只有 date-only）：
//   .date（預設）        只顯月曆
//   .dateAndTime         月曆 + Divider + 時間雙欄
//   .time                只顯時間雙欄（純時間選擇 · 不顯月曆）
// 時間 UI DS 自建（不嵌原生 wheel）：雙欄垂直滾輪感（chevron 上 / inset 數字 / chevron 下），
// 重用月曆 header 同款 ghost chevron + tactile inset 語彙、視覺呼應月曆。

struct LMDatePicker: View {

    enum Components { case date, dateAndTime, time }

    @Binding var selection: Date
    var components: Components = .date
    var calendar: Calendar = .current
    var locale: Locale = .current
    @State private var displayedMonth: Date

    init(selection: Binding<Date>,
         components: Components = .date,
         calendar: Calendar = .current,
         locale: Locale = .current) {
        self._selection = selection
        self.components = components
        self.calendar = calendar
        self.locale = locale
        self._displayedMonth = State(initialValue: selection.wrappedValue)
    }

    var body: some View {
        VStack(spacing: 16) {
            if components == .time {
                // 純時間模式 · 只 render 時間雙欄、不顯月曆（header / weekday / grid）
                timeSection
            } else {
                header
                weekdayRow
                daysGrid
                if components == .dateAndTime {
                    Divider().overlay(Color.border)
                    timeSection
                }
            }
        }
        .padding(16)
        .tactilePlain(radius: LMRadius.xl)
        .accessibilityElement(children: .contain)
        .accessibilityValue(accessibilityValueText)
    }

    private var accessibilityValueText: String {
        let f = DateFormatter()
        f.locale = locale
        switch components {
        case .time: f.dateFormat = "HH:mm"
        case .dateAndTime: f.dateFormat = "yyyy/MM/dd HH:mm"
        case .date: f.dateFormat = "yyyy/MM/dd"
        }
        return f.string(from: selection)
    }

    private var header: some View {
        HStack {
            navButton(systemImage: "chevron.left") { shiftMonth(by: -1) }
            Spacer()
            Text(monthTitle)
                .font(.lmH3)
                .foregroundStyle(Color.ink)
            Spacer()
            navButton(systemImage: "chevron.right") { shiftMonth(by: 1) }
        }
    }

    private var weekdayRow: some View {
        HStack(spacing: 0) {
            // 用 offset 當 ID · 因為 weekday 縮寫會重複 (S/M/T/W/T/F/S 的 S 跟 T 各兩次)
            ForEach(Array(orderedWeekdaySymbols.enumerated()), id: \.offset) { _, sym in
                Text(sym)
                    .font(.lmCaption)
                    .foregroundStyle(Color.inkMuted)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    private var daysGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 7), spacing: 4) {
            ForEach(Array(monthDays.enumerated()), id: \.offset) { _, day in
                dayCell(day)
            }
        }
    }

    @ViewBuilder
    private func dayCell(_ day: Day) -> some View {
        Button {
            if let date = day.date {
                // 含時間時保留既有 time-of-day（否則選日會把時間歸零）
                if components == .dateAndTime {
                    selection = combine(day: date, hour: selHour, minute: selMinute) ?? date
                } else {
                    selection = date
                }
            }
        } label: {
            Text(day.label)
                .font(.system(size: 15, weight: day.isSelected ? .semibold : .regular))
                .foregroundStyle(day.foregroundColor)
                .frame(width: LMControlSize.iconButton, height: LMControlSize.iconButton)
                .background {
                    if day.isSelected {
                        Circle()
                            .fill(Color.primaryBrand)
                    } else if day.isToday {
                        Circle()
                            .strokeBorder(Color.primaryBrand.opacity(0.45), lineWidth: 1.5)
                    }
                }
        }
        .buttonStyle(.plain)
        .disabled(!day.isInMonth)
    }

    @ViewBuilder
    private func navButton(systemImage: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: LMControlSize.iconButton, height: LMControlSize.iconButton)
                .contentShape(Rectangle())
        }
        .buttonStyle(LMGhostIconButtonStyle())
    }

    // MARK: - 時間區（hour:minute · DS 自建）

    // 時間 UI（雙欄垂直滾輪感：chevron 上 / inset 數字 / chevron 下，
    // 重用月曆 header 同款 ghost chevron + tactile inset 語彙）
    private var timeSection: some View {
        HStack(spacing: 12) {
            Spacer()
            timeColumn(value: selHour, label: "時") { setHour($0, wrap: 24) }
            Text(":").font(.lmH3).foregroundStyle(Color.inkMuted)
            timeColumn(value: selMinute, label: "分") { setMinute($0, wrap: 60) }
            Spacer()
        }
    }

    private func timeColumn(value: Int, label: String, set: @escaping (Int) -> Void) -> some View {
        VStack(spacing: 6) {
            navButton(systemImage: "chevron.up") { set(value + 1) }
            Text(String(format: "%02d", value))
                .font(.system(.title3, design: .monospaced))
                .foregroundStyle(Color.ink)
                .frame(minWidth: 52)
                .padding(.vertical, 8)
                .tactileInset(radius: LMRadius.md)
            navButton(systemImage: "chevron.down") { set(value - 1) }
            Text(label).font(.lmCaption).foregroundStyle(Color.inkMuted)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label)
        .accessibilityValue("\(value)")
    }

    // MARK: - Date / time helpers

    private var selHour: Int { calendar.component(.hour, from: selection) }
    private var selMinute: Int { calendar.component(.minute, from: selection) }

    private func combine(day: Date, hour: Int, minute: Int) -> Date? {
        var comps = calendar.dateComponents([.year, .month, .day], from: day)
        comps.hour = hour
        comps.minute = minute
        return calendar.date(from: comps)
    }

    private func setHour(_ raw: Int, wrap: Int) {
        let h = ((raw % wrap) + wrap) % wrap
        if let d = combine(day: selection, hour: h, minute: selMinute) { selection = d }
    }

    private func setMinute(_ raw: Int, wrap: Int) {
        let m = ((raw % wrap) + wrap) % wrap
        if let d = combine(day: selection, hour: selHour, minute: m) { selection = d }
    }

    private var monthTitle: String {
        let f = DateFormatter()
        f.locale = locale
        f.dateFormat = "yyyy.MM"
        return f.string(from: displayedMonth)
    }

    private var orderedWeekdaySymbols: [String] {
        let f = DateFormatter()
        f.locale = locale
        let symbols = f.veryShortStandaloneWeekdaySymbols ?? f.veryShortWeekdaySymbols ?? []
        let firstIdx = calendar.firstWeekday - 1
        guard !symbols.isEmpty else { return [] }
        return Array(symbols[firstIdx...]) + Array(symbols[..<firstIdx])
    }

    private struct Day {
        let label: String
        let date: Date?
        let isInMonth: Bool
        let isSelected: Bool
        let isToday: Bool

        var foregroundColor: Color {
            if isSelected { return Color.inkOnBrand }
            if !isInMonth { return Color.inkMuted.opacity(0.35) }
            return Color.ink
        }
    }

    private var monthDays: [Day] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: displayedMonth) else { return [] }
        let firstDay = monthInterval.start
        let firstWeekday = calendar.component(.weekday, from: firstDay)
        let leadingEmpty = (firstWeekday - calendar.firstWeekday + 7) % 7

        let daysInMonth = calendar.range(of: .day, in: .month, for: firstDay)?.count ?? 0
        let total = leadingEmpty + daysInMonth
        let trailingEmpty = (7 - total % 7) % 7

        var days: [Day] = []
        let today = Date()

        // Leading empties (previous month overflow) · ⚠️ range 必須先 guard、否則 1...0 會 crash
        if leadingEmpty > 0 {
            for offset in (1...leadingEmpty).reversed() {
                let date = calendar.date(byAdding: .day, value: -offset, to: firstDay)
                let label = date.map { String(calendar.component(.day, from: $0)) } ?? ""
                days.append(Day(
                    label: label,
                    date: nil,
                    isInMonth: false,
                    isSelected: false,
                    isToday: false
                ))
            }
        }

        for d in 1...daysInMonth {
            guard let date = calendar.date(byAdding: .day, value: d - 1, to: firstDay) else { continue }
            let isSelected = calendar.isDate(date, inSameDayAs: selection)
            let isToday = calendar.isDate(date, inSameDayAs: today)
            days.append(Day(
                label: "\(d)",
                date: date,
                isInMonth: true,
                isSelected: isSelected,
                isToday: isToday
            ))
        }

        // Trailing empties (next month overflow) · 同樣 guard 防 1...0 crash
        if trailingEmpty > 0 {
            for offset in 1...trailingEmpty {
                let date = calendar.date(byAdding: .day, value: daysInMonth + offset - 1, to: firstDay)
                let label = date.map { String(calendar.component(.day, from: $0)) } ?? ""
                days.append(Day(
                    label: label,
                    date: nil,
                    isInMonth: false,
                    isSelected: false,
                    isToday: false
                ))
            }
        }

        return days
    }

    private func shiftMonth(by months: Int) {
        if let next = calendar.date(byAdding: .month, value: months, to: displayedMonth) {
            withAnimation(.easeOut(duration: 0.18)) {
                displayedMonth = next
            }
        }
    }
}
