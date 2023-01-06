
import Darwin

/// A representation of a Hilbert Curve.
public struct HilbertCurve {

    fileprivate let edge: Int
    fileprivate var points: Array<Point> = []

    /// Create a hilbert curve with number of cells 2 to the power of `edge`.
    public init(power: Int) {
        self.edge = Int(pow(2, Double(power)))
        self.points = (0 ..< edge*edge).map(point)
    }

    fileprivate func point(with distance: Int) -> Point {

        var result = Point(x: 0, y: 0)
        var temp = distance

        let levels = sequence(first: 1) { level in
            let next = level * 2
            guard next < self.edge else { return nil }
            return next
        }

        for level in levels {
            let quadrant = Quadrant(distance: temp)
            result.flipping(in: quadrant, at: level)
            result.stretching(in: quadrant, at: level)
            temp /= 4
        }

        return result
    }

    fileprivate func distance(to point: Point) -> Int {

        var point = point
        var result = 0

        let levels = sequence(first: edge/2) { level in
            let next = level / 2
            guard next > 0 else { return nil }
            return next
        }

        for level in levels {
            let quadrant = Quadrant(point: point, level: level)
            result += quadrant.increment(with: level)
            point.flipping(in: quadrant, at: level)
        }
        
        return result
    }
    
}

extension HilbertCurve: Collection, BidirectionalCollection, RandomAccessCollection {

    public var startIndex: Int {
        return points.startIndex
    }

    public var endIndex: Int {
        return points.endIndex
    }

    public subscript(distance: Int) -> Point {
        get {
            return points[distance]
        }
    }

    public func index(after i: Int) -> Int {
        return points.index(after: i)
    }

    public var last: Point? {
        return points.last
    }

    public func index(before i: Int) -> Int {
        return points.index(before: i)
    }

    public var indices: CountableRange<Int> {
        return points.indices
    }
}
