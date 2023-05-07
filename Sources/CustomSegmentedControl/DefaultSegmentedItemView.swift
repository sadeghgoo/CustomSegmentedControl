import UIKit

class DefaultSegmentedItemView: UIView, DefaultSegmentedItem {
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(frame: CGRect = .zero, title: String?, image: UIImage?, indicatorColor: UIColor?) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 4
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        if let image {
            stackView.addArrangedSubview(imageView)
            imageView.image = image
        }
        
        if let title {
            stackView.addArrangedSubview(titleLabel)
            titleLabel.text = title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func make(title: String?, image: UIImage?, indicatorColor: UIColor?) -> DefaultSegmentedItemView {
        return DefaultSegmentedItemView(title: title, image: image, indicatorColor: indicatorColor)
    }
}
