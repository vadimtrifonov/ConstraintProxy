import UIKit

extension NSLayoutConstraint {
    
    public enum Edge {
        case top, leading, bottom, trailing
    }
    
    public enum HorizontalAxis {
        case leading, trailing, centerX
    }
    
    public enum VerticalAxis {
        case top, bottom, firstBaseline, lastBaseline, centerY
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
        case .leading:
            return .leading
        case .bottom:
            return .bottom
        case .trailing:
            return .trailing
        }
    }
}

extension NSLayoutConstraint.HorizontalAxis: ConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .centerX:
            return .centerX
        }
    }
}

extension NSLayoutConstraint.VerticalAxis: ConstraintAttributeConvertible {
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .firstBaseline:
            return .firstBaseline
        case .lastBaseline:
            return .lastBaseline
        case .centerY:
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
