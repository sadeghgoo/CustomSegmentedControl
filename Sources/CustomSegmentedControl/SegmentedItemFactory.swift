import UIKit

protocol SegmentedItemFactoryInterface {
    static func make(_ mode: CustomSegmentedControl.SegmentedItemMode) -> UIView
}
 
struct SegmentedItemFactory: SegmentedItemFactoryInterface {
    static func make(_ mode: CustomSegmentedControl.SegmentedItemMode) -> UIView {
        switch mode {
        case .justTitle(let title):
            return DefaultSegmentedItemView.make(title: title, image: nil, indicatorColor: nil)
        case let .titleAndImage(title, image):
            return DefaultSegmentedItemView.make(title: title, image: image, indicatorColor: nil)
        case let .custom(customView):
            return customView
        }
    }
}

