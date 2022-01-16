import Foundation
import SwiftUI

struct AxisLineShape: Shape {
    
    var axisList: [Axis]
    
    init(axis: Axis) {
        axisList = [axis]
    }
    
    init(axisList: [Axis]) {
        self.axisList = axisList
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            axisList.forEach { axis in
                path.move(to: axis.start)
                path.addLine(to: axis.end)
                path.closeSubpath()
            }
        }
    }
}

struct AxisLineShape_Preview: PreviewProvider {
    
    static let size: CGSize = CGSize(width: 400, height: 260)
    static var previews: some View {
        Group {
            ZStack {
                AxisLineShape(
                    axis: XAxis(from: 0, to: size.width, y: size.height - 10))
                    .stroke(Color.defaultBar)
                AxisLineShape(
                    axis: YAxis(from: 0, to: size.height, x: 10))
                    .stroke(Color.defaultBar)
            }
            .frame(width: size.width, height: size.height)
            .background(Color.defaultBackground)
        }
    }
}
