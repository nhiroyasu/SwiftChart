import Foundation
import SwiftUI

enum BarChartShapeType {
    /// 真四角
    case rect
    /// 指定したradiusだけ角を丸める
    case round(radius: Double)
    /// 完全な丸
    case pill
}


struct BarChartShapeTypeEnvKey: EnvironmentKey {
    static var defaultValue: BarChartShapeType = .rect
}

extension EnvironmentValues {
    typealias Value = BarChartShapeType
    
    var barChartShapeType: BarChartShapeType {
        get { self[BarChartShapeTypeEnvKey.self] }
        set { self[BarChartShapeTypeEnvKey.self] = newValue}
    }
}

extension BarChart {
    public func shape(_ style: BarChartShapeType) -> some View {
        environment(\.barChartShapeType, style)
    }
}
