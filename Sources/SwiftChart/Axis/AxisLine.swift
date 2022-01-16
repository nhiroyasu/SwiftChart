import Foundation
import SwiftUI

struct AxisLine: View {
    
    var axis: Axis
    var color: Color
    
    var body: some View {
        AxisLineShape(axis: axis)
            .stroke(style: StrokeStyle(lineWidth: 1, lineJoin: .round))
            .foregroundColor(color)
    }
}

struct AxisLine_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                AxisLine(axis: XAxis(from: 20, to: 380, y: 240), color: .defaultBar)
                AxisLine(axis: YAxis(from: 20, to: 240, x: 20), color: .defaultBar)
            }
            .frame(width: 400, height: 260)
            .background(Color.defaultBackground)
        }
    }
}
