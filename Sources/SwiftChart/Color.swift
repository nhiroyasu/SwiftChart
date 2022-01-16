import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xff0000) >> 16) / CGFloat(0xff)
        let g = CGFloat((hex & 0x00ff00) >> 8) / CGFloat(0xff)
        let b = CGFloat(hex & 0x0000ff) / CGFloat(0xff)
        self.init(.sRGB, red: r, green: g, blue: b, opacity: min(max(alpha, 0.0), 1.0))
    }
    
    static let defaultBar: Color = Color(hex: 0xF22E62)
    static let defaultBackground: Color = Color(hex: 0xF2F2F2)
    static let defaultAxis: Color = Color(hex: 0xD9D9D9)
}
