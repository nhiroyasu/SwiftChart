import Foundation

public struct BarChartData {
    public var items: [BarChartItem]
    
    var values: [Double] {
        items.map { $0.value }
    }
    /// valuesとlabelsの数は一致している必要があります
    var labels: [String] {
        items.map { $0.label }
    }
    
}

public struct BarChartItem {
    public let value: Double
    public let label: String
}
