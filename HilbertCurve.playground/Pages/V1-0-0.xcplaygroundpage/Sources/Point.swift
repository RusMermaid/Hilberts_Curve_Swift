
public struct Point {

    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public func flipped(in quadrant: Quadrant, at level: Int) -> Point {
        var result = self
        if quadrant.isBottom {
            if !quadrant.isLeft {
                result = Point(
                    x: level - 1 - result.x,
                    y: level - 1 - result.y
                )
            }
            result = Point(x: result.y, y: result.x)
        }
        return result
    }

    mutating public func flipping(in quadrant: Quadrant, at level: Int) {
        self = flipped(in: quadrant, at: level)
    }

    public func stretched(in quadrant: Quadrant, at level: Int) -> Point {
        return Point(
            x: self.x + (quadrant.isLeft ? 0 : level),
            y: self.y + (quadrant.isBottom ? 0 : level)
        )
    }

    mutating public func stretching(in quadrant: Quadrant, at level: Int) {
        self = stretched(in: quadrant, at: level)
    }
    
}

extension Point: CustomStringConvertible {
    public var description: String {
        return "(\(x), \(y))"
    }
}
