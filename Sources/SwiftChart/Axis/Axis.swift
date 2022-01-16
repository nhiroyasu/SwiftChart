import Foundation

struct XAxis: Axis {
    var start: CGPoint
    var end: CGPoint
    
    init(from startX: Double, to endX: Double, y: Double) {
        start = CGPoint(x: startX, y: y)
        end = CGPoint(x: endX, y: y)
    }
}

struct YAxis: Axis {
    var start: CGPoint
    var end: CGPoint
    
    init(from startY: Double, to endY: Double, x: Double) {
        start = CGPoint(x: x, y: startY)
        end = CGPoint(x: x, y: endY)
    }
}

protocol Axis {
    var start: CGPoint { get }
    var end: CGPoint { get }
}
