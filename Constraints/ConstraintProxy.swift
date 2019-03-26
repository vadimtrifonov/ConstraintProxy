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
