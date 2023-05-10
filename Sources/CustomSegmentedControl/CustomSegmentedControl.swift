import UIKit

public class CustomSegmentedControl: UIView {
    public weak var delegate: CustomSegmentedControlDelegate?
    public weak var datasSource: CustomSegmentedControlDataSource?
           
    private let indicatorViewTag: Int = 10001
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public init(padding: UIEdgeInsets) {
        super.init(frame: .zero)
        addStackView(padding: padding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView(padding: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    public func reloadData() {
        stackView.arrangedSubviews.forEach { child in
            child.removeFromSuperview()
        }
        if let datasSource {
            (0..<datasSource.segmentedNumberOfItems(self)).forEach { index in
                let itemMadeByFactory = SegmentedItemFactory.make(datasSource.segmentedItemView(self, at: index))
                addIndicatorView(parentView: itemMadeByFactory)
                itemMadeByFactory.tag = index
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(itemDidTap(_:)))
                itemMadeByFactory.addGestureRecognizer(tapGesture)
                stackView.addArrangedSubview(itemMadeByFactory)
            }
        }
        
        itemDidSelect(itemTag: 0)
        stackView.spacing = datasSource?.segmentedItemSpacing(self) ?? 8

    }
    
    // MARK: - Private methods
    
    private func addIndicatorView(parentView: UIView) {
        if let indicatorProperties = datasSource?.segmentedIndicatorView(self) {
            let indicatorView = makeIndicatorView(properties: indicatorProperties)
            parentView.addSubview(indicatorView)
            NSLayoutConstraint.activate([
                indicatorView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -indicatorProperties.padding.bottom),
                indicatorView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -indicatorProperties.padding.right),
                indicatorView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: indicatorProperties.padding.left),
                indicatorView.heightAnchor.constraint(equalToConstant: indicatorProperties.height)
            ])
        }
    }
    
    private func makeIndicatorView(properties: IndicatorProperties) -> UIView {
        let indicatorView = UIView()
        indicatorView.tag = indicatorViewTag
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.backgroundColor = properties.color
        indicatorView.layer.borderColor = properties.borderColor.cgColor
        indicatorView.layer.borderWidth = properties.borderWidth
        return indicatorView
    }
  
    private func addStackView(padding: UIEdgeInsets) {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        ])
    }
    
    private func itemDidSelect(itemTag: Int) {
        if let _ = datasSource?.segmentedIndicatorView(self) {
            if let index = stackView.arrangedSubviews.firstIndex(where: {$0.tag == itemTag}), let indicatorIndex = stackView.arrangedSubviews[index].subviews.firstIndex(where: {$0.tag == indicatorViewTag }) {
                stackView.arrangedSubviews.forEach { arrangedSubview in
                    arrangedSubview.subviews[indicatorIndex].isHidden = true
                }
                stackView.arrangedSubviews[index].subviews[indicatorIndex].isHidden = false
            }
        }
    }
    
    @objc private func itemDidTap(_ gesture: UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {
            itemDidSelect(itemTag: tag)
            delegate?.segmentedItemDidTap(self, itemIndex: tag)
        }
    }
}

public extension CustomSegmentedControl {
    public enum SegmentedItemMode {
        case justTitle(String)
        case titleAndImage(String, UIImage)
        case custom(UIView)
    }
}

public extension CustomSegmentedControl {
    public struct IndicatorProperties {
        var color: UIColor = .systemGreen
        var borderWidth: CGFloat = 0
        var borderColor: UIColor = .clear
        var height: CGFloat = 4
        var padding: UIEdgeInsets = .zero
    }
}
