import UIKit

extension UILayoutPriority {
    public static let minNonZero = UILayoutPriority(rawValue: 1)
    public static let belowDefaultLow = UILayoutPriority(rawValue: UILayoutPriority.defaultLow.rawValue - 1)
    public static let aboveDefaultLow = UILayoutPriority(rawValue: UILayoutPriority.defaultLow.rawValue + 1)
    public static let belowDefaultHigh = UILayoutPriority(rawValue: UILayoutPriority.defaultHigh.rawValue - 1)
    public static let aboveDefaultHigh = UILayoutPriority(rawValue: UILayoutPriority.defaultHigh.rawValue + 1)
    public static let maxNonRequired = UILayoutPriority(rawValue: UILayoutPriority.required.rawValue - 1)
}
