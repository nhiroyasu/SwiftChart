import Foundation
import SwiftUI

public enum BarChartShapeType {
    /// 真四角
    case rect
    /// 指定したradiusだけ角を丸める
    case round(radius: Double)
    /// 完全な丸
    case pill
}
