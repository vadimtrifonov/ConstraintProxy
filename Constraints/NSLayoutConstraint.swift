import UIKit

extension NSLayoutConstraint {
    
    public enum Edge {
        case top, bottom, leading, trailing, firstBaseline, lastBaseline
    }
    
    public enum Dimension {
        case width, height
    }
}

protocol ConstraintAttributeConvertible {
    var attribute: NSLayoutConstraint.Attribute { get }
}

extension NSLayoutConstraint.Edge: ConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .firstBaseline:
            return .firstBaseline
        case .lastBaseline:
            return .lastBaseline
        }
    }
}

extension NSLayoutConstraint.Axis: ConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .horizontal:
            return .centerX
        case .vertical:
            return .centerY
        }
    }
}

extension NSLayoutConstraint.Dimension: ConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .width:
            return .width
        case .height:
            return .height
        }
    }
}
