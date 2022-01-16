# SwiftChart

A charting library for SwiftUI.

# BarChart
```swift
struct SampleView: View {
    var chartData = BarChartData(
        items: [
            .init(value: 10, label: "12/11"),
            .init(value: 60, label: "12/12"),
            .init(value: 10, label: "12/13"),
            .init(value: 60, label: "12/14"),
            .init(value: 80, label: "12/15"),
            .init(value: 120, label: "12/16"),
            .init(value: 5, label: "12/17")
        ]
    )

    var body: some View {
        BarChart(data: chartData, barWidth: 16)
            .style(BarChartStyle(
                barColor: Color(NSColor(named: "primary")!),
                backgroundColor: Color(NSColor(named: "backgroundColor")!),
                barShape: .round(radius: 2)))
    }
}
```
