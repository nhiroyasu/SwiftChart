import Foundation

/// BarChartにおけるBarの間隔を計算する純粋関数
/// - Parameters:
///   - barWidth: barWidth
///   - marginTop: marginTop
///   - marginBottom: marginBottom
///   - marginLeft: marginLeft
///   - marginRight: marginRight
///   - dataCount: data count
///   - align: chart align
///   - chartWidth: chart view width
/// - Returns: bar space
func calculateBarSpace(
    barWidth: Double,
    marginTop: Double,
    marginBottom: Double,
    marginLeft: Double,
    marginRight: Double,
    dataCount: Int,
    align: ChartAlign,
    chartWidth: Double
) -> Double {
    switch align {
    case .between:
        let barTotalWidth = barWidth * Double(dataCount)
        let contentWidth = chartWidth - (marginLeft - marginRight)
        let barSpaceCount = dataCount - 1
        if barSpaceCount == 0 {
            return 0
        } else {
            return (contentWidth - barTotalWidth) / Double(barSpaceCount)
        }
    case .around:
        let barTotalWidth = barWidth * Double(dataCount)
        let contentWidth = chartWidth - (marginLeft - marginRight)
        let barSpaceCount = dataCount + 1
        return (contentWidth - barTotalWidth) / Double(barSpaceCount)
    }
}


/// 指定したseparationの値に合わせて、いい感じ分けられる値を見つけ出すメソッド
/// - Parameters:
///   - maxValue: 最大値
///   - separation: 分ける数
/// - Returns: 結果
func calculateSeparationValue(maxValue: Double, separation: Double) -> Int {
    let candidate = maxValue / separation
    let rate: Double = 1 / pow(10, .maximum(Double(String(Int(candidate)).count - 1), 1))
    let value = floor(candidate * rate) / rate
    return Int(value)
}
