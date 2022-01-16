import Foundation
import SwiftUI


struct YAxisLabel: Identifiable {
    var id = UUID()
    let label: String
    let position: Double
}

public struct BarChart: View {
    
    var data: BarChartData
    var barWidth: Double
    @Environment(\.barChartStyle) var style
    
    public init(
        data: BarChartData,
        barWidth: Double = 32
    ) {
        self.data = data
        self.barWidth = barWidth
    }
    
    private let xAxisLabelHeight: Double = 32
    private let yAxisLabelWidth: Double = 64
    
    private func computeYAxis(on size: CGSize) -> YAxis {
        YAxis(from: 0, to: size.height, x: 0)
    }
    
    private func computeXAxis(on size: CGSize) -> XAxis {
        XAxis(from: 0, to: size.width, y: size.height)
    }
    
    private func computeXAxisLabelWidth(on size: CGSize) -> Double {
        size.width / Double(data.labels.count + 1)
    }
    
    private func computeBarSpace(chartWidth: Double) -> Double {
        calculateBarSpace(
            barWidth: barWidth,
            marginTop: AlignmentBarChart.DefaultMargin,
            marginBottom: AlignmentBarChart.DefaultMargin,
            marginLeft: AlignmentBarChart.DefaultMargin,
            marginRight: AlignmentBarChart.DefaultMargin,
            dataCount: data.values.count,
            align: AlignmentBarChart.DefaultChartAlign,
            chartWidth: chartWidth
        )
    }
    
    /// Y軸のラベルの位置と内容を計算する
    /// - Parameter yAxisHeight: 表示するY軸の高さ
    /// - Returns: List<YAxisLabel>
    func computeYAxisLabels(yAxisHeight: Double) -> [YAxisLabel] {
        let maxValue: Double = data.values.max() ?? 1
        let separation: Double = 3
        let separationValue = calculateSeparationValue(maxValue: maxValue, separation: separation)
        return (0...Int(separation)).map { index in
            YAxisLabel(
                label: String(separationValue * index),
                position: yAxisHeight - (Double(separationValue * index) / maxValue) * yAxisHeight
            )
        }
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 16)
            GeometryReader { geometry in
                HStack(alignment: .top, spacing: 0) {
                    ZStack {
                        let yAxisLabels = computeYAxisLabels(yAxisHeight: geometry.size.height - xAxisLabelHeight)
                        ForEach(yAxisLabels) { label in
                            let halfFontSize = 8.0
                            Text(label.label)
                                .font(style.yLabelFont)
                                .foregroundColor(style.yLabelColor)
                                .offset(x: 0, y: label.position - halfFontSize)
                        }
                    }
                    .frame(width: yAxisLabelWidth)
                    VStack(spacing: 0) {
                        let axisContentSize = CGSize(
                            width: geometry.size.width - yAxisLabelWidth,
                            height: geometry.size.height - xAxisLabelHeight
                        )
                        ZStack {
                            AxisLine(axis: computeYAxis(on: axisContentSize), color: .defaultAxis)
                            AxisLine(axis: computeXAxis(on: axisContentSize), color: .defaultAxis)
                            AlignmentBarChart(
                                data: data.values,
                                barWidth: barWidth,
                                shapeType: style.barShape,
                                barColor: style.barColor)
                                .frame(width: axisContentSize.width,
                                       height: axisContentSize.height)
                        }
                        HStack(spacing: 0) {
                            let barSpace = computeBarSpace(chartWidth: axisContentSize.width)
                            Spacer(minLength: barSpace / 2)
                            ForEach(0..<data.labels.count) { index in
                                Text(data.labels[index])
                                    .font(style.xLabelFont)
                                    .foregroundColor(style.xLabelColor)
                                    .frame(width: barWidth + barSpace)
                            }
                            Spacer(minLength: barSpace / 2)
                        }
                        .frame(height: xAxisLabelHeight)
                    }
                }
            }
        }
        .background(style.backgroundColor)
    }
}

struct BarChart_Preview: PreviewProvider {
    
    static let barChartData = BarChartData(
        items: [
            .init(value: 10, label: "12/1"),
            .init(value: 20, label: "12/2"),
            .init(value: 60, label: "12/3"),
            .init(value: 30, label: "12/4"),
            .init(value: 70, label: "12/5"),
            .init(value: 5, label: "12/6"),
        ]
    )
    static let barChartData2 = BarChartData(
        items: [
            .init(value: 1000, label: "12/1"),
            .init(value: 1469, label: "12/2"),
            .init(value: 203, label: "12/3"),
            .init(value: 140, label: "12/4"),
            .init(value: 602, label: "12/5"),
            .init(value: 740, label: "12/6"),
        ]
    )
    static let barChartData3 = BarChartData(
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
    
    static var previews: some View {
        Group {
            BarChart(data: barChartData)
                .frame(width: 400, height: 260)
            
            BarChart(data: barChartData2)
                .frame(width: 400, height: 260)
            
            BarChart(data: barChartData2, barWidth: 16)
                .style(BarChartStyle(xLabelColor: .blue, barShape: .pill))
                .frame(width: 400, height: 260)
            
            BarChart(data: barChartData3, barWidth: 16)
                .style(BarChartStyle(barShape: .round(radius: 4)))
                .frame(width: 400, height: 260)
        }
    }
}
