import SwiftUI

struct ContentView: View {

    @AppStorage("appearance") private var appearance: AppearancePreference = .system

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        TunerView()
                    } label: {
                        Label("Tuner ✦", systemImage: "slider.horizontal.3")
                    }
                } header: {
                    Text("LIVE TUNER")
                        .sectionLabel()
                } footer: {
                    Text("即時拖拉 slider 調整 §5.4.1 共通六件配方所有參數，肉眼校到「分不太出來」。校好後在 sheet 內看 spec 數值。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Section {
                    NavigationLink("Buttons", destination: ButtonsView())
                    NavigationLink("Cards", destination: CardsView())
                    NavigationLink("Chips", destination: ChipsView())
                    NavigationLink("Form (Input)", destination: FormView())
                    NavigationLink("Feedback (Toast)", destination: FeedbackView())
                    NavigationLink("Modal", destination: ModalView())
                } header: {
                    Text("MVP COMPONENTS")
                        .sectionLabel()
                }

                Section {
                    Picker("外觀", selection: $appearance) {
                        ForEach(AppearancePreference.allCases) { pref in
                            Text(pref.label).tag(pref)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("APPEARANCE")
                        .sectionLabel()
                }
            }
            .navigationTitle("LazzyMerlin DS")
            #if os(iOS)
            .listStyle(.insetGrouped)
            #else
            .listStyle(.sidebar)
            #endif
        }
        .tint(Color.primaryBrand)
    }
}

#Preview {
    ContentView()
}
