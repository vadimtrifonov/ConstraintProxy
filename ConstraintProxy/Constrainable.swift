import UIKit

public protocol Constrainable: AnyObject {}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {}
