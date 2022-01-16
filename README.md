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
        BarChart(data: barChartData3, barWidth: 16)
            .style(BarChartStyle(barShape: .round(radius: 4)))
            .frame(width: 400, height: 260)
    }
}
```

![image](https://user-images.githubusercontent.com/40600280/149652731-e6d050ed-348a-44c4-80f4-a96fc607db98.png)
