import UIKit

public extension UILayoutPriority {
    static let maxNonRequired = UILayoutPriority(rawValue: UILayoutPriority.required.rawValue - 1)
}
