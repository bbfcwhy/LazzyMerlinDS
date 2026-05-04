import SwiftUI

@main
struct LazzyMerlinDSPreviewApp: App {

    @AppStorage("appearance") private var appearance: AppearancePreference = .system

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(appearance.colorScheme)
        }
        #if os(macOS)
        .defaultSize(width: 480, height: 800)
        #endif
    }
}

// §7.2.8 dark mode 三態 override
enum AppearancePreference: String, CaseIterable, Identifiable {
    case system, light, dark
    var id: Self { self }

    var label: String {
        switch self {
        case .system: return "系統"
        case .light:  return "淺色"
        case .dark:   return "深色"
        }
    }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }
}
