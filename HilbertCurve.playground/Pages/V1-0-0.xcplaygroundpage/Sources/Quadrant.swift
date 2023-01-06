import Foundation

public enum Quadrant {

    /*
     3 | 4
     -----
     1 | 2
     */

    case first
    case second
    case third
    case fourth

    public init(distance: Int) {
        let file = File(distance: distance)
        let rank = Rank(distance: distance)
        self.init(file: file, rank: rank)
    }

    public init(point: Point, level: Int) {
        let file = File(x: point.x, level: level)
        let rank = Rank(y: point.y, level: level)
        self = Quadrant(file: file, rank: rank)
    }

    public var isLeft: Bool {
        return (self == .first) || (self == .third)
    }

    public var isBottom: Bool {
        return (self == .first) || (self  == .second)
    }

}

extension Quadrant {

    public enum File {
        case left
        case right
        init(distance: Int) {
            if 1 & (distance / 2) == 0 {
                self = .left
            } else {
                self = .right
            }
        }
        init(x: Int, level: Int) {
            self = (x & level) == 0 ? .left : .right
        }
    }

    public enum Rank {
        case top
        case bottom
        init(distance: Int) {
            if 1 & (distance ^ (1 & (distance / 2))) == 0 {
                self = .bottom
            } else {
                self = .top
            }
        }
        init(y: Int, level: Int) {
            self = (y & level) == 0 ? .bottom : .top
        }
    }

    fileprivate init(file: File, rank: Rank) {
        switch (file, rank) {
        case (.left, .bottom): self = .first
        case (.right, .bottom): self = .second
        case (.left, .top): self = .third
        case (.right, .top): self = .fourth
        }
    }

}

extension Quadrant {
    public func increment(with level: Int) -> Int {
        let x = self.isLeft ? 0 : 3
        let y = self.isBottom ? 0 : 1
        let value = x ^ y
        return level * level * value
    }
    
}
