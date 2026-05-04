import SwiftUI

struct ContentView: View {

    @AppStorage("appearance") private var appearance: AppearancePreference = .system

    var body: some View {
        NavigationStack {
            List {
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
        .tint(Color.primaryLM)
    }
}

#Preview {
    ContentView()
}
