import UIKit

extension NSDirectionalEdgeInsets {
    
    public static func top(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: inset, leading: 0, bottom: 0, trailing: 0)
    }
    
    public static func leading(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: 0, leading: inset, bottom: 0, trailing: 0)
    }
    
    public static func bottom(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: inset, trailing: 0)
    }
    
    public static func trailing(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: inset)
    }
    
    public static func vertical(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return top(inset) + bottom(inset)
    }
    
    public static func horizontal(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return leading(inset) + trailing(inset)
    }
    
    public static func uniform(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        return horizontal(inset) + vertical(inset)
    }
    
    public static func + (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(
            top: lhs.top + rhs.top,
            leading: lhs.leading + rhs.leading,
            bottom: lhs.bottom + rhs.bottom,
            trailing: lhs.trailing + rhs.trailing
        )
    }
}
