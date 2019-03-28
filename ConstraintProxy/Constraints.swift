import UIKit

extension ConstraintProxy {
    
    // MARK: - Edges
    
    @discardableResult
    public func edges(
        excluding edge: NSLayoutConstraint.Edge? = nil,
        to constrainable: Constrainable,
        insets: NSDirectionalEdgeInsets = .zero,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> [NSLayoutConstraint] {
        return [.top, .leading, .bottom, .trailing].filter({ $0 != edge }).map { edge in
            constraint(
                attribute: edge,
                to: constrainable,
                attribute: edge,
                constant: insets.constant(for: edge),
                priority: priority,
                active: active
            )
        }
    }
    
    @discardableResult
    public func edges(
        _ edges: NSLayoutConstraint.Edge...,
        to constrainable: Constrainable,
        insets: NSDirectionalEdgeInsets = .zero,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> [NSLayoutConstraint] {
        return edges.map { edge in
            constraint(
                attribute: edge,
                to: constrainable,
                attribute: edge,
                constant: insets.constant(for: edge),
                priority: priority,
                active: active
            )
        }
    }
    
    // MARK: - Horizontal Axis
    
    @discardableResult
    public func leading(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.HorizontalAxis = .leading,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .leading,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func trailing(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.HorizontalAxis = .trailing,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .trailing,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func centerX(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.HorizontalAxis = .centerX,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .centerX,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    // MARK: - Vertical Axis
    
    @discardableResult
    public func top(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .top,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .top,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func bottom(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .bottom,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .bottom,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func firstBaseline(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .firstBaseline,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .firstBaseline,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    
    @discardableResult
    public func lastBaseline(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .lastBaseline,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .lastBaseline,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func centerY(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .centerY,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .centerY,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    // MARK: - Center
    
    @discardableResult
    public func center(
        to constrainable: Constrainable,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> [NSLayoutConstraint] {
        return [
            centerX(to: constrainable, priority: priority, active: active),
            centerY(to: constrainable, priority: priority, active: active)
        ]
    }
    
    // MARK: - Size
    
    @discardableResult
    public func size(
        _ size: CGSize,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> [NSLayoutConstraint] {
        return [
            width(constant: size.width, relation: relation, priority: priority, active: active),
            height(constant: size.height, relation: relation, priority: priority, active: active)
        ]
    }
    
    @discardableResult
    public func size(
        to constrainable: Constrainable,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> [NSLayoutConstraint] {
        return [
            width(
                to: constrainable,
                multiplier: multiplier,
                relation: relation,
                priority: priority,
                active: active
            ),
            height(
                to: constrainable,
                multiplier: multiplier,
                relation: relation,
                priority: priority,
                active: active
            )
        ]
    }
    
    // MARK: - Dimensions
    
    @discardableResult
    public func width(
        constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: NSLayoutConstraint.Dimension.width,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func width(
        to constrainable: Constrainable,
        _ dimension: NSLayoutConstraint.Dimension = .width,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .width,
            to: constrainable,
            attribute: dimension,
            multiplier: multiplier,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func height(
        constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: NSLayoutConstraint.Dimension.height,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    @discardableResult
    public func height(
        to constrainable: Constrainable,
        _ dimension: NSLayoutConstraint.Dimension = .height,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
    ) -> NSLayoutConstraint {
        return constraint(
            attribute: .height,
            to: constrainable,
            attribute: dimension,
            multiplier: multiplier,
            constant: constant,
            relation: relation,
            priority: priority,
            active: active
        )
    }
    
    // MARK: - Private
    
    @discardableResult
    private func constraint<T: ConstraintAttributeConvertible>(
        attribute: T,
        to constrainable: Constrainable? = nil,
        attribute other: T? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        active: Bool = true
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
        constraint.isActive = active
        return constraint
    }
}

private extension NSDirectionalEdgeInsets {
    
    func constant(for edge: NSLayoutConstraint.Edge) -> CGFloat {
        switch edge {
        case .top:
            return top
        case .leading:
            return leading
        case .bottom:
            return -bottom
        case .trailing:
            return -trailing
        }
    }
}
