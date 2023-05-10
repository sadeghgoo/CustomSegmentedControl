import Foundation

public protocol CustomSegmentedControlDataSource: AnyObject {
    func segmentedNumberOfItems(_ segmented: CustomSegmentedControl) -> Int
    func segmentedItemView(_ segemetned: CustomSegmentedControl, at index: Int) -> CustomSegmentedControl.SegmentedItemMode
    func segmentedItemSpacing(_ segemented: CustomSegmentedControl) -> CGFloat
    func segmentedIndicatorView(_ segemented: CustomSegmentedControl) -> CustomSegmentedControl.IndicatorProperties?
}
