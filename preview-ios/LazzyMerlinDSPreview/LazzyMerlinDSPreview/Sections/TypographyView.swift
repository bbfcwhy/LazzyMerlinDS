import SwiftUI

// LazzyMerlin DS · Typography token preview
// 列出所有 font / tracking / lineSpacing token 的視覺樣本

struct TypographyView: View {

    private let displayLine = "Aa 永 LazzyMerlin"
    private let bodyLine = "懶人魔法師慵懶地閃耀著。Lazy magic is real magic."

    @AppStorage("lm_dev_useAllLXGW") private var useAllLXGW: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: LMSpacing.section) {

                // Dev toggle · 全 LXGW 體驗開關 (預設關、開啟後 UI tier 切到 LXGW)
                LMSection("DEV TOGGLE · UI tier 字體") {
                    Toggle(isOn: $useAllLXGW) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(useAllLXGW ? "全 LXGW WenKai · 體驗中" : "3-tier 標準 (預設)")
                                .font(.lmBodySmall.weight(.semibold))
                                .foregroundStyle(Color.ink)
                            Text("ON = body / caption / button / control 也用 LXGW · OFF = 系統字 (SF Pro / PingFang TC)")
                                .font(.lmCaption)
                                .foregroundStyle(Color.inkMutedSubdued)
                        }
                    }
                    .toggleStyle(.lmSwitch)
                    .padding(LMSpacing.lg)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("DISPLAY & HEADING") {
                    VStack(alignment: .leading, spacing: LMSpacing.lg) {
                        sample(name: "lmDisplayXL · 56pt",    text: displayLine, font: .lmDisplayXL)
                        sample(name: "lmDisplayLarge · 48pt", text: displayLine, font: .lmDisplayLarge)
                        sample(name: "lmDisplay · 40pt",      text: displayLine, font: .lmDisplay)
                        sample(name: "lmH1 · 28pt",           text: displayLine, font: .lmH1)
                        sample(name: "lmH2 · 22pt",           text: displayLine, font: .lmH2)
                        sample(name: "lmH3 · 20pt",           text: displayLine, font: .lmH3)
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("BODY") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        sample(name: "lmBodyLarge · 17pt", text: bodyLine, font: .lmBodyLarge)
                        sample(name: "lmBody · 17pt",      text: bodyLine, font: .lmBody)
                        sample(name: "lmBodySmall · 15pt", text: bodyLine, font: .lmBodySmall)
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("CAPTION · LABEL · COMPONENT") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        sample(name: "lmCaption · 12pt",        text: bodyLine, font: .lmCaption)
                        sample(name: "lmLabel · 12pt mono",     text: "ABC123 lmLabel mono", font: .lmLabel)
                        sample(name: "lmStatNumber · 40pt",     text: "1,284", font: .lmStatNumber)
                        sample(name: "lmButtonLarge · 16pt sb", text: "Button Large", font: .lmButtonLarge)
                        sample(name: "lmButtonMedium · 14pt sb", text: "Button Medium", font: .lmButtonMedium)
                        sample(name: "lmButtonSmall · 13pt sb", text: "Button Small", font: .lmButtonSmall)
                        sample(name: "lmControlLabel · 14pt md", text: "Control Label", font: .lmControlLabel)
                        sample(name: "lmEmptyVisual · 52pt",    text: "✦", font: .lmEmptyVisual)
                        sample(name: "lmEmptyCode · 48pt",      text: "404", font: .lmEmptyCode)
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("TRACKING (字距 · uppercase)") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        trackingRow(name: "chip · 0.6",    value: LMTracking.chip)
                        trackingRow(name: "badge · 0.8",   value: LMTracking.badge)
                        trackingRow(name: "loose · 1.0",   value: LMTracking.loose)
                        trackingRow(name: "eyebrow · 1.2", value: LMTracking.eyebrow)
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                LMSection("LINE SPACING (段落行距)") {
                    VStack(alignment: .leading, spacing: LMSpacing.md) {
                        lineSpacingRow(name: "tight · 2",  value: LMLineSpacing.tight)
                        lineSpacingRow(name: "normal · 4", value: LMLineSpacing.normal)
                        lineSpacingRow(name: "loose · 6",  value: LMLineSpacing.loose)
                    }
                    .padding(LMSpacing.card)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tactileBase(radius: LMRadius.card)
                }

                Spacer(minLength: LMSpacing.section)
            }
            .padding(LMSpacing.page)
        }
        .navigationTitle("Typography")
        .brandPage()
    }

    @ViewBuilder
    private func sample(name: String, text: String, font: Font) -> some View {
        VStack(alignment: .leading, spacing: LMSpacing.xxs) {
            Text(name)
                .font(.lmCaption)
                .foregroundStyle(Color.inkMutedSubdued)
            Text(text)
                .font(font)
                .foregroundStyle(Color.ink)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }
    }

    @ViewBuilder
    private func trackingRow(name: String, value: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: LMSpacing.xxs) {
            Text(name)
                .font(.lmCaption)
                .foregroundStyle(Color.inkMutedSubdued)
            Text("LAZZYMERLIN")
                .font(.lmLabel)
                .textCase(.uppercase)
                .tracking(value)
                .foregroundStyle(Color.ink)
        }
    }

    @ViewBuilder
    private func lineSpacingRow(name: String, value: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: LMSpacing.xxs) {
            Text(name)
                .font(.lmCaption)
                .foregroundStyle(Color.inkMutedSubdued)
            Text("這是一段示範文字。\n第二行同樣風格。\n第三行展示行距堆疊效果。")
                .font(.lmBodySmall)
                .foregroundStyle(Color.ink)
                .lineSpacing(value)
        }
    }
}

#Preview {
    NavigationStack {
        TypographyView()
    }
}
