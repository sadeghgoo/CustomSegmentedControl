import Foundation

public protocol CustomSegementedControlDelegate: AnyObject {
    func segmetendItemDidTap(_ segmented: CustomSegemtendControl, itemIndex index: Int)
}
