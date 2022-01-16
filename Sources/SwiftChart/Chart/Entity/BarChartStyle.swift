import Foundation
import SwiftUI

public struct BarChartStyle {
    var xLabelFont: Font = .custom("Helvetica", size: 12)
    var xLabelColor: Color = .defaultText
    var yLabelFont: Font = .custom("Helvetica", size: 12)
    var yLabelColor: Color = .defaultText
    var barColor: Color = .defaultBar
    var backgroundColor: Color = .defaultBackground
    var barShape: BarChartShapeType = .rect
    
    public init(
        xLabelFont: Font = .custom("Helvetica", size: 12),
        xLabelColor: Color = .defaultText,
        yLabelFont: Font = .custom("Helvetica", size: 12),
        yLabelColor: Color = .defaultText,
        barColor: Color = .defaultBar,
        backgroundColor: Color = .defaultBackground,
        barShape: BarChartShapeType = .rect
    ) {
        self.xLabelFont = xLabelFont
        self.xLabelColor = xLabelColor
        self.yLabelFont = yLabelFont
        self.yLabelColor = yLabelColor
        self.barColor = barColor
        self.backgroundColor = backgroundColor
        self.barShape = barShape
    }
}

struct BarChartStyleEnvKey: EnvironmentKey {
    static var defaultValue: BarChartStyle = .init()
}

extension EnvironmentValues {
    var barChartStyle: BarChartStyle {
        get { self[BarChartStyleEnvKey.self] }
        set { self[BarChartStyleEnvKey.self] = newValue}
    }
}

extension BarChart {
    public func style(_ style: BarChartStyle) -> some View {
        environment(\.barChartStyle, style)
    }
}
