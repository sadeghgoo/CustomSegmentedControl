import UIKit

protocol DefaultSegmentedItem {
    static func make(title: String?, image: UIImage?, indicatorColor: UIColor?) -> DefaultSegmentedItemView
}
