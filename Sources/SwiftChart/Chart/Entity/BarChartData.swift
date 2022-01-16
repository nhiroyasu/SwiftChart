import Foundation
import AppKit

public struct BarChartData {
    public var items: [BarChartItem]
    
    var values: [Double] {
        get {
            items.map { $0.value }
        }
    }
    /// valuesとlabelsの数は一致している必要があります
    var labels: [String] {
        get {
            items.map { $0.label }
        }
    }
    
    public init(items: [BarChartItem]) {
        self.items = items
    }
}

public struct BarChartItem {
    public let value: Double
    public let label: String
    
    public init(value: Double, label: String) {
        self.value = value
        self.label = label
    }
}
