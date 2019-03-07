import UIKit

extension ConstraintProxy {
    
    // MARK: - Edges
    
    @discardableResult
    public func edges(
        _ edges: [NSLayoutConstraint.Edge],
        to constrainable: Constrainable,
        insets: NSDirectionalEdgeInsets = .zero,
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
    public func edge(
        _ edge: NSLayoutConstraint.Edge,
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
    public func size(
        _ size: CGSize,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            dimension(.width, constant: size.width, relation: relation, priority: priority),
            dimension(.height, constant: size.height, relation: relation, priority: priority)
        ]
    }
    
    @discardableResult
    public func dimension(
        _ dimension: NSLayoutConstraint.Dimension,
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
    public func dimension(
        _ dimension: NSLayoutConstraint.Dimension,
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
    public func center(
        to constrainable: Constrainable,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            center(axis: .horizontal, to: constrainable, constant: constant, priority: priority),
            center(axis: .vertical, to: constrainable, constant: constant, priority: priority)
        ]
    }
    
    @discardableResult
    public func center(
        axis: NSLayoutConstraint.Axis,
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
    private func constrain<T: ConstraintAttributeConvertible>(
        attribute: T,
        to constrainable: Constrainable?,
        attribute other: T?,
        constant: CGFloat,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        (base as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: base,
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

private extension NSDirectionalEdgeInsets {
    
    func constant(for edge: NSLayoutConstraint.Edge) -> CGFloat {
        switch edge {
        case .top:
            return top
        case .bottom:
            return -bottom
        case .leading:
            return leading
        case .trailing:
            return -trailing
        case .firstBaseline:
            return -bottom
        case .lastBaseline:
            return -bottom
        }
    }
}
