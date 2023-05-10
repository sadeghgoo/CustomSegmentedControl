import Foundation

public protocol CustomSegmentedControlDelegate: AnyObject {
    func segmentedItemDidTap(_ segmented: CustomSegmentedControl, itemIndex index: Int)
}
