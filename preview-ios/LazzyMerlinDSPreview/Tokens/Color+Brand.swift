import SwiftUI

extension Color {

    // MARK: - Wood Palette (8 色 brand DNA · §1)

    static let bg          = Color("Bg")
    static let bgRaised    = Color("BgRaised")
    static let bgMuted     = Color("BgMuted")
    static let ink         = Color("Ink")
    static let inkMuted    = Color("InkMuted")
    static let primaryDeep = Color("PrimaryDeep")
    static let primaryLM   = Color("Primary")     // 'primary' is reserved by SwiftUI
    static let primarySoft = Color("PrimarySoft")
    static let stone       = Color("Stone")

    // MARK: - Earth Tone Status Extension (§2.2.2)

    static let earthRed   = Color("EarthRed")     // destructive / error
    static let earthGreen = Color("EarthGreen")   // success
    static let earthOchre = Color("EarthOchre")   // warning

    // MARK: - Hairline / Border (§2.2.1)

    static let hairline = Color("Hairline")
    static let borderLM = Color("Border")
}
