import Foundation

public protocol CustomSegmentedControlDelegate: AnyObject {
    func segmetendItemDidTap(_ segmented: CustomSegmentedControl, itemIndex index: Int)
}
