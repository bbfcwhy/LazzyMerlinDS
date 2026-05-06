import SwiftUI
import CoreText

// LazzyMerlin DS · Font Loader
// 用 CoreText runtime API 註冊 LXGW WenKai TC + Mono TC 字型
// 不依賴 Info.plist 的 UIAppFonts、避開 Xcode plist 設定步驟
//
// ⚠️ Xcode 仍需把 Resources/Fonts/ 加進 target 的 Copy Bundle Resources build phase
//    (檔案放對位置但沒加進 target、Bundle.main.url 會找不到)
//
// 用法：在 LazzyMerlinDSPreviewApp.init() 內呼叫 LMFontLoader.register()

enum LMFontLoader {

    /// 全部 6 個字型檔名 (不含副檔名)
    static let fontNames: [String] = [
        // 文楷 TC (一般 · 給 display / heading / body 用)
        "LXGWWenKaiTC-Light",
        "LXGWWenKaiTC-Regular",
        "LXGWWenKaiTC-Medium",
        // 文楷 Mono TC (等寬 · 給 code / monospace 用)
        "LXGWWenKaiMonoTC-Light",
        "LXGWWenKaiMonoTC-Regular",
        "LXGWWenKaiMonoTC-Medium"
    ]

    /// PostScript 名稱 (Font.custom 用) · 通常跟檔名一致
    /// 如果 Font.custom 找不到、可能是 .ttf 內 PostScript name 不同、執行 register() 後 print 出來看
    static func register() {
        for name in fontNames {
            guard let url = Bundle.main.url(forResource: name, withExtension: "ttf") else {
                print("⚠️ LMFontLoader: 找不到 \(name).ttf · 確認 Resources/Fonts 已加進 Xcode target")
                continue
            }
            var error: Unmanaged<CFError>?
            let ok = CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
            if !ok, let err = error?.takeRetainedValue() {
                let nsErr = err as Error as NSError
                // code 105 = font already registered · 不算錯誤
                if nsErr.code != 105 {
                    print("⚠️ LMFontLoader: \(name) 註冊失敗 · \(err)")
                }
            }
        }
    }

    /// Debug: 列出所有可用 PostScript 字型名稱 (含 LXGW)
    static func debugListAvailable() {
        #if canImport(UIKit)
        for family in UIFont.familyNames where family.contains("LXGW") || family.contains("WenKai") {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("  \(name)")
            }
        }
        #endif
    }
}
