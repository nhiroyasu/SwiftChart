import Foundation
import SwiftUI

struct BarChartShape: Shape {
    
    var barWidth: Double
    var barSpace: Double
    var marginTop: Double
    var marginBottom: Double
    var marginLeft: Double
    var marginRight: Double
    @Binding var data: [Double]
    
    /// データの最大値
    private var maxValue: Double {
        // 0で割ることがないように１を返してます
        data.max() ?? 1
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            data.enumerated().forEach { (index, value) in
                let barRect = computeBarRect(index: index, value: value, on: rect)
                path.addRect(barRect)
            }
            path.closeSubpath()
        }
    }
    
    /// 次に描画するBarのRectを計算するメソッド
    /// - Parameters:
    ///   - index: 次のBarのindex(indexは0からです)
    ///   - value: Barの値
    ///   - rect: 描画するViewのRect
    ///   - path: 対象のPath
    /// - Returns: 結果のRect
    private func computeBarRect(index: Int, value: Double, on rect: CGRect) -> CGRect {
        // xPoint
        let barOffset = barWidth * Double(index)
        let barSpaceOffset = barSpace * Double(index)
        let xPoint = marginLeft + barOffset + barSpaceOffset
        // yPoint
        let barHeight = barDisplayHeight(value: value, on: rect)
        let yPoint = marginTop + chartContentSize(on: rect).height - barHeight
        // xPoint + yPoint = point
        let point = CGPoint(x: xPoint, y: yPoint)
        // size
        let barSize = CGSize(width: barWidth, height: barHeight)
        // point + size = rect
        return CGRect(origin: point, size: barSize)
    }
    
    /// BarChartで実際のViewに表示されるBarの高さ
    /// - Parameters:
    ///   - value: グラフ上の値
    ///   - rect: 表示するViewのRect
    /// - Returns: 実際の高さ
    private func barDisplayHeight(value: Double, on rect: CGRect) -> Double {
        let contentHeight = chartContentSize(on: rect).height
        return (value / maxValue) * contentHeight
    }
    
    /// Chartを描画するサイズ（マージンを除いたサイズ）
    /// - Parameter rect: Viewのサイズ
    /// - Returns: サイズ
    private func chartContentSize(on rect: CGRect) -> CGSize {
        let contentHeight = rect.height - (marginTop + marginBottom)
        let contentWidth = rect.width - (marginLeft + marginRight)
        return CGSize(width: contentWidth, height: contentHeight)
    }
}

struct BarChartShape_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartShape(
                barWidth: 32,
                barSpace: 12,
                marginTop: 16,
                marginBottom: 16,
                marginLeft: 16,
                marginRight: 16,
                data: .constant([10, 50, 60, 30, 20, 5, 15, 120]))
                .stroke(Color.white, lineWidth: 3)
                .frame(width: 400, height: 300)
            
            BarChartShape(
                barWidth: 32,
                barSpace: 12,
                marginTop: 16,
                marginBottom: 16,
                marginLeft: 16,
                marginRight: 16,
                data: .constant([10, 50, 60, 30, 20, 5, 15, 120]))
                .fill(Color.white)
                .frame(width: 400, height: 300)
        }
    }
}
