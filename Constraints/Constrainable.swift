import UIKit

public struct ConstraintProxy {
    let base: Constrainable
    
    init(_ base: Constrainable) {
        self.base = base
    }
}

public protocol Constrainable: AnyObject {
    var constrain: ConstraintProxy { get }
}

extension Constrainable {
    
    public var constrain: ConstraintProxy {
        return ConstraintProxy(self)
    }
}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {}
