import Foundation
import SwiftUI

struct AuxiliaryLine: View {
    
    var auxiliaryLines: [Axis]
    var color: Color
    
    var body: some View {
        AxisLineShape(axisList: auxiliaryLines)
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [6, 3]))
            .foregroundColor(color)
    }
}

struct AuxiliaryLine_Preview: PreviewProvider {
    
    static let size: CGSize = CGSize(width: 200, height: 100)
    static var previews: some View {
        AuxiliaryLine(
            auxiliaryLines: [
                XAxis(from: 0, to: size.width, y: 20),
                XAxis(from: 0, to: size.width, y: 40),
                XAxis(from: 0, to: size.width, y: 60)
            ],
            color: Color.defaultBar)
            .background(Color.defaultBackground)
            .frame(width: size.width, height: size.height)
    }
}
