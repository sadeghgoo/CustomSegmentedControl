import Foundation

public protocol CustomSegmentedControlDataSource: AnyObject {
    func segmentedNumberOfItems(_ segmented: CustomSegmentedControl) -> Int
    func segmentedItemView(_ segmented: CustomSegmentedControl, at index: Int) -> CustomSegmentedControl.SegmentedItemMode
    func segmentedItemSpacing(_ segmented: CustomSegmentedControl) -> CGFloat
    func segmentedIndicatorView(_ segmented: CustomSegmentedControl) -> CustomSegmentedControl.IndicatorProperties?
}
