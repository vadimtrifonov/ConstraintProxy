import UIKit

extension UILayoutPriority {
    public static let maxNonRequired = UILayoutPriority(rawValue: UILayoutPriority.required.rawValue - 1)
}
