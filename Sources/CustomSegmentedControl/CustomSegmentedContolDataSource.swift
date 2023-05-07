import Foundation

public protocol CustomSegementedControlDataSource: AnyObject {
    func segmentedNumberOfItems(_ segmented: CustomSegemtendControl) -> Int
    func segmentedItemView(_ segemetned: CustomSegemtendControl, at index: Int) -> CustomSegemtendControl.SegmentedItemMode
    func segmentedItemSpacing(_ segemented: CustomSegemtendControl) -> CGFloat
    func segmentedIndicatorView(_ segemented: CustomSegemtendControl) -> CustomSegemtendControl.IndicatorProperties?
}
