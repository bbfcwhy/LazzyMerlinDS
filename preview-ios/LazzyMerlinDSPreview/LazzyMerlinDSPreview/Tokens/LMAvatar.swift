import SwiftUI

// LazzyMerlin DS · Avatar (initial / asset image + tactile circle)
// 支援兩種 content：
//   - initial: 文字首字 (e.g. "威", "梅", "M")
//   - asset:   bundled image (e.g. MoonStars 當特殊 user)
// Size variants 對應典型用法：
//   small   · 24pt 適合 list inline / chip
//   medium  · 32pt 適合 list row leading
//   regular · 38pt 預設、原 DataView 用
//   large   · 48pt 適合 profile / hero
//   xLarge  · 64pt 適合 detail page header

struct LMAvatar: View {

    enum Content {
        case initial(String)
        case asset(String, fillScale: CGFloat = 0.5)
    }

    enum Size {
        case small, medium, regular, large, xLarge
        case custom(CGFloat)

        var frame: CGFloat {
            switch self {
            case .small:    return 24
            case .medium:   return 32
            case .regular:  return 38
            case .large:    return 48
            case .xLarge:   return 64
            case .custom(let v): return v
            }
        }

        var fontSize: CGFloat {
            // 字體大約 frame 的 0.42、保留呼吸空間
            switch self {
            case .small:    return 11
            case .medium:   return 13
            case .regular:  return 15
            case .large:    return 19
            case .xLarge:   return 26
            case .custom(let v): return max(10, v * 0.42)
            }
        }
    }

    let content: Content
    let color: Color
    var size: Size = .regular

    var body: some View {
        Group {
            switch content {
            case .initial(let text):
                Text(text)
                    .font(.system(size: size.fontSize, weight: .semibold))
            case .asset(let name, let fillScale):
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.frame * fillScale, height: size.frame * fillScale)
            }
        }
        .frame(width: size.frame, height: size.frame)
        .tactileCircle(color: color)
    }
}

// MARK: - Convenience inits

extension LMAvatar {
    /// 初始字 avatar (e.g. 威 / 梅 / M)
    init(initial: String, color: Color, size: Size = .regular) {
        self.init(content: .initial(initial), color: color, size: size)
    }

    /// Asset image avatar · MoonStars / brand mark · fillScale 控制 image 在圓內佔比 (0.5 = 50%)
    init(assetImage: String, color: Color, size: Size = .regular, fillScale: CGFloat = 0.5) {
        self.init(content: .asset(assetImage, fillScale: fillScale), color: color, size: size)
    }
}
