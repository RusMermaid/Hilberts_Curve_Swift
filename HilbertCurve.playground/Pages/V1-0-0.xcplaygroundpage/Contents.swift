
import AppKit

//extension HilbertCurve {
//
//    func bezierPath(in frame: NSRect) -> NSBezierPath {
//        let result = NSBezierPath()
//
//        func transform(point: Point) -> CGPoint {
//
//
//
//
//
//            return CGPoint(x: 0, y: 0)
//        }
//
//        guard let first = first else {
//            return result
//        }
//
//        result.move(to: transform(point: first))
//
//        guard let self.count > 1 else {
//            return result
//        }
//
//        for point in self.dropFirst() {
//            result.line(to: transform(point: point))
//        }
//
//        return result
//    }
//
//
//}


let h = HilbertCurve(power: 6)

for p in h {
    print(p)
}
