import UIKit

public protocol Constrainable: AnyObject {}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {}

public struct ConstraintProxy {
    let base: Constrainable
    
    init(_ base: Constrainable) {
        self.base = base
    }
}

extension Constrainable {
    
    public var constraint: ConstraintProxy {
        return ConstraintProxy(self)
    }
}
