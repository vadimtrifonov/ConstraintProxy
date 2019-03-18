import UIKit

extension ConstraintProxy {
    
    // MARK: - Edges
    
    @discardableResult
    public func edges(
        excluding edge: NSLayoutConstraint.Edge? = nil,
        to constrainable: Constrainable,
        insets: NSDirectionalEdgeInsets = .zero,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [.top, .bottom, .leading, .trailing].filter({ $0 != edge }).map { edge in
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
    public func edges(
        _ edges: NSLayoutConstraint.Edge...,
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
    
    // MARK: - Horizontal Axis
    
    @discardableResult
    public func leading(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.HorizontalAxis = .leading,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .leading,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func trailing(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.HorizontalAxis = .trailing,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .trailing,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func centerX(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.HorizontalAxis = .centerX,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .centerX,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    // MARK: - Vertical Axis
    
    @discardableResult
    public func top(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .top,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .top,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func bottom(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .bottom,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .bottom,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func firstBaseline(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .firstBaseline,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {
        return constrain(
            attribute: .firstBaseline,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    
    @discardableResult
    public func lastBaseline(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .lastBaseline,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .lastBaseline,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func centerY(
        to constrainable: Constrainable,
        _ attribute: NSLayoutConstraint.VerticalAxis = .centerY,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .centerY,
            to: constrainable,
            attribute: attribute,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    // MARK: - Center
    
    @discardableResult
    public func center(
        to constrainable: Constrainable,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            centerX(to: constrainable, constant: constant, priority: priority),
            centerY(to: constrainable, constant: constant, priority: priority)
        ]
    }
    
    // MARK: - Size
    
    @discardableResult
    public func size(
        _ size: CGSize,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            width(constant: size.width, relation: relation, priority: priority),
            height(constant: size.height, relation: relation, priority: priority)
        ]
    }
    
    @discardableResult
    public func size(
        to constrainable: Constrainable,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> [NSLayoutConstraint] {
        return [
            width(
                to: constrainable,
                multiplier: multiplier,
                relation: relation,
                priority: priority
            ),
            height(
                to: constrainable,
                multiplier: multiplier,
                relation: relation,
                priority: priority
            )
        ]
    }
    
    // MARK: - Dimensions
    
    @discardableResult
    public func width(
        constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: NSLayoutConstraint.Dimension.width,
            to: nil,
            attribute: nil,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func width(
        to constrainable: Constrainable,
        _ dimension: NSLayoutConstraint.Dimension = .width,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .width,
            to: constrainable,
            attribute: dimension,
            constant: 0,
            multiplier: multiplier,
            relation: relation,
            priority: priority
        )
    }
    
    @discardableResult
    public func height(
        constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: NSLayoutConstraint.Dimension.height,
            to: nil,
            attribute: nil,
            constant: constant,
            relation: relation,
            priority: priority
        )
    }

    @discardableResult
    public func height(
        to constrainable: Constrainable,
        _ dimension: NSLayoutConstraint.Dimension = .height,
        multiplier: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return constrain(
            attribute: .height,
            to: constrainable,
            attribute: dimension,
            constant: 0,
            multiplier: multiplier,
            relation: relation,
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
        }
    }
}
