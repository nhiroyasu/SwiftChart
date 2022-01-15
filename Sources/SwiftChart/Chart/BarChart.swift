import Foundation
import SwiftUI

struct BarChart: View {
    
    private var barSpaceAlign: ChartAlign
    private var barWidth: Double
    private var marginTop: Double
    private var marginBottom: Double
    private var marginLeft: Double
    private var marginRight: Double
    @Binding private var data: [Double]
    
    public init(
        data: Binding<[Double]>,
        barWidth: Double,
        barSpaceAlign: ChartAlign = .around,
        margin: Double = 0
    ) {
        self._data = data
        self.barWidth = barWidth
        self.barSpaceAlign = barSpaceAlign
        self.marginTop = margin
        self.marginBottom = margin
        self.marginLeft = margin
        self.marginRight = margin
    }
    
    public init(
        data: Binding<[Double]>,
        barWidth: Double,
        barSpaceAlign: ChartAlign = .around,
        marginTop: Double = 0,
        marginBottom: Double = 0,
        marginLeft: Double = 0,
        marginRight: Double = 0
    ) {
        self._data = data
        self.barWidth = barWidth
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
        switch align {
        case .between:
            let barTotalWidth = barWidth * Double(data.count)
            let contentWidth = size.width - (marginLeft - marginRight)
            let barSpaceCount = data.count - 1
            if barSpaceCount == 0 {
                return 0
            } else {
                return (contentWidth - barTotalWidth) / Double(barSpaceCount)
            }
        case .around:
            let barTotalWidth = barWidth * Double(data.count)
            let contentWidth = size.width - (marginLeft - marginRight)
            let barSpaceCount = data.count + 1
            return (contentWidth - barTotalWidth) / Double(barSpaceCount)
        }
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
                data: _data)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct BarChart_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            BarChart(data: .constant([10, 50, 60, 30, 20, 5, 15, 120]), barWidth: 32, marginTop: 16, marginBottom: 16)
                .frame(width: 400, height: 200)
            
            BarChart(data: .constant([10]), barWidth: 32)
        }
    }
}
