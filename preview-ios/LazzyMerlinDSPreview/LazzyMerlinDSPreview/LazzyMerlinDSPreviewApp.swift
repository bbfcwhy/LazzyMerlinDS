import SwiftUI

@main
struct LazzyMerlinDSPreviewApp: App {

    @AppStorage("appearance") private var appearance: AppearancePreference = .system

    init() {
        // 註冊 LXGW WenKai TC 字型 (見 Tokens/LMFontLoader.swift)
        // 必須在 App init 階段、SwiftUI render 前完成
        LMFontLoader.register()
    }

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
