import Foundation
import SwiftUI

public struct BarChartVisibility {
    var xAxisLabel: Bool
    var yAxisLabel: Bool
    var xAxisLine: Bool
    var yAxisLine: Bool
    
    public init(xAxis: Bool = true, yAxis: Bool = true) {
        self.xAxisLabel = xAxis
        self.xAxisLine = xAxis
        self.yAxisLabel = yAxis
        self.yAxisLine = yAxis
    }
    
    public init(xAxisLabel: Bool = true, yAxisLabel: Bool = true, xAxisLine: Bool = true, yAxisLine: Bool = true) {
        self.xAxisLabel = xAxisLabel
        self.yAxisLabel = yAxisLabel
        self.xAxisLine = xAxisLine
        self.yAxisLine = yAxisLine
    }
}

struct BarChartVisibilityEnvKey: EnvironmentKey {
    static var defaultValue: BarChartVisibility = .init()
}

extension EnvironmentValues {
    var barChartVisibility: BarChartVisibility {
        get { self[BarChartVisibilityEnvKey.self] }
        set { self[BarChartVisibilityEnvKey.self] = newValue}
    }
}

extension View {
    public func visible(_ visibility: BarChartVisibility) -> some View {
        environment(\.barChartVisibility, visibility)
    }
}
