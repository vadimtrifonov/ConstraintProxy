import UIKit

public protocol Constrainable: AnyObject {}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {}

public extension Constrainable {
    
    // MARK: - Edges
    
    @discardableResult
    func constrain(
        edges: [NSLayoutConstraint.Edge],
        to constrainable: Constrainable,
        insets: UIEdgeInsets = .zero,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return edges.map { edge in
            constrain(
                attribute: edge,
                to: constrainable,
                attribute: edge,
                constant: insets.constant(for: edge),
                priority: priority
            )
        }
    }
    
    @discardableResult
    func constrain(
        edge: NSLayoutConstraint.Edge,
        to constrainable: Constrainable,
        edge other: NSLayoutConstraint.Edge? = nil,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: edge,
            to: constrainable,
            attribute: other ?? edge,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    // MARK: - Dimensions
    
    @discardableResult
    func constrain(
        size: CGSize,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            constrain(dimension: .width, constant: size.width, relation: relation, priority: priority),
            constrain(dimension: .height, constant: size.height, relation: relation, priority: priority)
        ]
    }
    
    @discardableResult
    func constrain(
        dimension: NSLayoutConstraint.Dimension,
        constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: dimension,
            to: nil,
            attribute: nil,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    func constrain(
        dimension: NSLayoutConstraint.Dimension,
        to constrainable: Constrainable,
        dimension other: NSLayoutConstraint.Dimension? = nil,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: dimension,
            to: constrainable,
            attribute: other ?? dimension,
            constant: constant,
            multiplier: multiplier,
            relation: relation,
            priority: priority
        )
    }
    
    // MARK: - Axes
    
    @discardableResult
    func constrain(
        centerTo constrainable: Constrainable,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            constrain(center: .horizontal, to: constrainable, constant: constant, priority: priority),
            constrain(center: .vertical, to: constrainable, constant: constant, priority: priority)
        ]
    }
    
    @discardableResult
    func constrain(
        center axis: NSLayoutConstraint.Axis,
        to constrainable: Constrainable,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: axis,
            to: constrainable,
            attribute: axis,
            constant: constant,
            priority: priority
        )
    }
    
    // MARK: - Private
    
    @discardableResult
    private func constrain<T: LayoutConstraintAttributeConvertible>(
        attribute: T,
        to constrainable: Constrainable?,
        attribute other: T?,
        constant: CGFloat,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        (self as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attribute.attribute,
            relatedBy: relation,
            toItem: constrainable,
            attribute: other?.attribute ?? .notAnAttribute,
            multiplier: multiplier,
            constant: constant
        )
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}

private extension UIEdgeInsets {
    
    func constant(for edge: NSLayoutConstraint.Edge) -> CGFloat {
        switch edge {
        case .top:
            return top
        case .left:
            return left
        case .right:
            return -right
        case .bottom:
            return -bottom
        case .firstBaseline:
            return -bottom
        case .lastBaseline:
            return -bottom
        }
    }
}
