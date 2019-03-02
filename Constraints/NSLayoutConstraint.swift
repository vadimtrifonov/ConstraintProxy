import UIKit

public extension NSLayoutConstraint {
    
    enum Edge {
        case top, left, bottom, right, firstBaseline, lastBaseline
    }
    
    enum Dimension {
        case width, height
    }
}

public extension Array where Element == NSLayoutConstraint.Edge {
    
    static var all: [NSLayoutConstraint.Edge] {
        return [.top, .left, .bottom, .right]
    }
    
    static func all(except edge: NSLayoutConstraint.Edge) -> [NSLayoutConstraint.Edge] {
        return all.filter({ $0 != edge })
    }
}

internal protocol LayoutConstraintAttributeConvertible {
    var attribute: NSLayoutConstraint.Attribute { get }
}

extension NSLayoutConstraint.Edge: LayoutConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .left:
            return .left
        case .bottom:
            return .bottom
        case .right:
            return .right
        case .firstBaseline:
            return .firstBaseline
        case .lastBaseline:
            return .lastBaseline
        }
    }
}

extension NSLayoutConstraint.Axis: LayoutConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .horizontal:
            return .centerX
        case .vertical:
            return .centerY
        }
    }
}

extension NSLayoutConstraint.Dimension: LayoutConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .width:
            return .width
        case .height:
            return .height
        }
    }
}
