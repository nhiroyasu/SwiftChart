import Foundation
import SwiftUI

struct AlignmentBarChart: View {
    
    static let DefaultMargin: Double = 0
    static let DefaultChartAlign = ChartAlign.around
    
    private var barSpaceAlign: ChartAlign
    private var barWidth: Double
    private var shapeType: BarChartShapeType
    private var marginTop: Double
    private var marginBottom: Double
    private var marginLeft: Double
    private var marginRight: Double
    private var barColor: Color = .defaultBar
    private var data: [Double]
    
    public init(
        data: [Double],
        barWidth: Double,
        shapeType: BarChartShapeType,
        barSpaceAlign: ChartAlign = DefaultChartAlign,
        margin: Double = DefaultMargin
    ) {
        self.data = data
        self.barWidth = barWidth
        self.shapeType = shapeType
        self.barSpaceAlign = barSpaceAlign
        self.marginTop = margin
        self.marginBottom = margin
        self.marginLeft = margin
        self.marginRight = margin
    }
    
    public init(
        data: [Double],
        barWidth: Double,
        shapeType: BarChartShapeType,
        barSpaceAlign: ChartAlign = .around,
        marginTop: Double = 0,
        marginBottom: Double = 0,
        marginLeft: Double = 0,
        marginRight: Double = 0
    ) {
        self.data = data
        self.barWidth = barWidth
        self.shapeType = shapeType
        self.barSpaceAlign = barSpaceAlign
        self.marginTop = marginTop
        self.marginBottom = marginBottom
        self.marginLeft = marginLeft
        self.marginRight = marginRight
    }
    
    /// 適切なBarSpace値を計算する
    /// - Parameter rect: ViewのRect
    /// - Returns: barSpace
    private func computeBarSpace(align: ChartAlign, on size: CGSize) -> Double {
        calculateBarSpace(
            barWidth: barWidth,
            marginTop: marginTop,
            marginBottom: marginBottom,
            marginLeft: marginLeft,
            marginRight: marginRight,
            dataCount: data.count,
            align: align,
            chartWidth: size.width
        )
    }
    
    private func computeMarginLeft(added value: Double) -> Double {
        switch barSpaceAlign {
        case .between:
            return marginLeft
        case .around:
            return marginLeft + value
        }
    }
    
    private func computeMarginRight(added value: Double) -> Double {
        switch barSpaceAlign {
        case .between:
            return marginRight
        case .around:
            return marginRight + value
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            let barSpace = computeBarSpace(align: barSpaceAlign, on: geometry.size)
            
            BarChartShape(
                barWidth: barWidth,
                barSpace: barSpace,
                marginTop: marginTop,
                marginBottom: marginBottom,
                marginLeft: computeMarginLeft(added: barSpace),
                marginRight: computeMarginRight(added: barSpace),
                shapeType: shapeType,
                data: data)
                .fill(barColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct AlignmentBarChart_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AlignmentBarChart(
                data: [10, 50, 60, 30, 20, 5, 15, 120],
                barWidth: 32,
                shapeType: .rect,
                marginTop: 16,
                marginBottom: 16)
                .frame(width: 400, height: 200)
            
            AlignmentBarChart(
                data: [10],
                barWidth: 32,
                shapeType: .rect)
        }
    }
}
