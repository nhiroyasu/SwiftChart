# SwiftChart

A charting library for SwiftUI.

# BarChart
## Usage
```swift
struct SampleView: View {
    var chartData = BarChartData(
        items: [
            .init(value: 10, label: "12/1"),
            .init(value: 20, label: "12/2"),
            .init(value: 60, label: "12/3"),
            .init(value: 30, label: "12/4"),
            .init(value: 70, label: "12/5"),
            .init(value: 5, label: "12/6"),
        ]
    )

    var body: some View {
        BarChart(data: barChartData3, barWidth: 16)
            .frame(width: 400, height: 260)
    }
}
```

![image](https://user-images.githubusercontent.com/40600280/149664475-e8960a81-a136-486a-a8c4-236640468034.png)


## Style
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

## Visibility
```swift
struct SampleView: View {
    var chartData = BarChartData(
        items: [
            .init(value: 10, label: "12/1"),
            .init(value: 20, label: "12/2"),
            .init(value: 60, label: "12/3"),
            .init(value: 30, label: "12/4"),
            .init(value: 70, label: "12/5"),
            .init(value: 5, label: "12/6"),
        ]
    )

    var body: some View {
        BarChart(data: barChartData)
            .visible(BarChartVisibility(xAxisLabel: true, yAxisLabel: false, xAxisLine: false, yAxisLine: false))
            .frame(width: 400, height: 260)
    }
}
```

![image](https://user-images.githubusercontent.com/40600280/149664500-2fa1512d-9678-4cb8-8bd4-600200c5f336.png)

