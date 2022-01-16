import Foundation

struct BarChartData {
    var items: [BarChartItem]
    
    var values: [Double] {
        items.map { $0.value }
    }
    /// valuesとlabelsの数は一致している必要があります
    var labels: [String] {
        items.map { $0.label }
    }
    
}

struct BarChartItem {
    let value: Double
    let label: String
}
