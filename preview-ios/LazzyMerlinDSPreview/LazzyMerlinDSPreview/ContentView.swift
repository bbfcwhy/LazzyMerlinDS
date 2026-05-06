import SwiftUI

struct ContentView: View {

    @AppStorage("appearance") private var appearance: AppearancePreference = .system

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {

                    // MARK: Brand header (取代 system large title)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("LazzyMerlin")
                            .font(.system(size: 34, weight: .bold, design: .serif))
                            .foregroundStyle(Color.ink)
                        Text("Design System Preview")
                            .font(.lmCaption)
                            .foregroundStyle(Color.inkMuted)
                            .tracking(1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 4)

                    // MARK: Live Tuner
                    LMListSection(
                        header: "LIVE TUNER",
                        footer: "即時拖拉 slider 調整 §5.4.1 共通六件配方所有參數，肉眼校到「分不太出來」。校好後在 sheet 內看 spec 數值。"
                    ) {
                        LMListRowLink(
                            "Tuner",
                            leading: {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(Color.primaryBrand)
                                    .frame(width: 24)
                            },
                            trailing: {
                                Image("MoonStars")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundStyle(Color.inkMuted)
                            },
                            destination: { TunerView() }
                        )
                    }

                    // MARK: Component catalog
                    LMListSection(header: "COMPONENT CATALOG") {
                        catalogRow("Colors",            icon: "paintpalette",      destination: ColorsView())
                        LMListDivider()
                        catalogRow("Logos",             icon: "moon.stars",         destination: LogosView())
                        LMListDivider()
                        catalogRow("Buttons",           icon: "rectangle",          destination: ButtonsView())
                        LMListDivider()
                        catalogRow("Cards",             icon: "rectangle.stack",    destination: CardsView())
                        LMListDivider()
                        catalogRow("Chips",             icon: "tag",                destination: ChipsView())
                        LMListDivider()
                        catalogRow("Form (Input)",      icon: "square.and.pencil",  destination: FormView())
                        LMListDivider()
                        catalogRow("Overlays",          icon: "bubble.left",        destination: OverlaysView())
                        LMListDivider()
                        catalogRow("Feedback (Toast)",  icon: "checkmark.bubble",   destination: FeedbackView())
                        LMListDivider()
                        catalogRow("Modal",             icon: "rectangle.portrait", destination: ModalView())
                        LMListDivider()
                        catalogRow("Navigation",        icon: "arrow.right.square", destination: NavView())
                        LMListDivider()
                        catalogRow("Data",              icon: "tablecells",         destination: DataView())
                        LMListDivider()
                        catalogRow("States",            icon: "exclamationmark.bubble", destination: StatesView())
                    }

                    // MARK: Appearance
                    LMListSection(header: "APPEARANCE") {
                        VStack(spacing: 0) {
                            LMSegmentedPicker(
                                selection: $appearance,
                                options: [.light, .dark]
                            ) { pref in
                                Text(pref.label)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                        }
                    }
                }
                .padding(.vertical, 16)
            }
            .background(Color.bg.ignoresSafeArea())
            #if os(iOS)
            .toolbar(.hidden, for: .navigationBar)
            #endif
        }
        .tint(Color.primaryBrand)
    }

    @ViewBuilder
    private func catalogRow<Destination: View>(_ title: String,
                                               icon: String,
                                               destination: Destination) -> some View {
        LMListRowLink(
            title,
            leading: {
                Image(systemName: icon)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color.primaryBrand)
                    .frame(width: 24)
            },
            destination: { destination }
        )
    }
}

#Preview {
    ContentView()
}
