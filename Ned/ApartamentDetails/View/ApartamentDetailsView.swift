import UIKit


class ApartametsDetailsView: UIView {
    
    var likeAction: (() -> ())?
    
    
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "depositphotos_45276821-stock-photo-bright-interior-of-living-room")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 25)
        nameLabel.textColor = .black
        nameLabel.text = "Однокомнатная квартира"
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var coastLabel: UILabel = {
        let coastLabel = UILabel()
        coastLabel.font = .systemFont(ofSize: 25)
        coastLabel.textColor = .black
        coastLabel.text = "6 000 000"
        coastLabel.translatesAutoresizingMaskIntoConstraints = false
        return coastLabel
    }()
    
    private lazy var likedB: UIButton = {
        let likedB = UIButton()
        likedB.translatesAutoresizingMaskIntoConstraints = false
        likedB.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        likedB.tintColor = .black
        likedB.addTarget(self, action: #selector(like), for: .touchUpInside)
        return likedB
    }()
    
    private lazy var textLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Планировка: кухня-гостиная с обеденной зоной, две спальни (одна из них со своим с/у с душевой кабиной), ванная комната. Квартира меблирована, укомплектована всей необходимой для жизни бытовой техникой. Полная звукоизоляция во всех комнатах, использованы экологичные материалы отделки. Приточно-вытяжная вентиляция, подогрев полов, кабельное ТВ, высокоскоростной интернет.Планировка: кухня-гостиная с обеденной зоной, две спальни (одна из них со своим с/у с душевой кабиной), ванная комната. Квартира меблирована, укомплектована всей необходимой для жизни бытовой техникой. Полная звукоизоляция во всех комнатах, использованы экологичные материалы отделки. Приточно-вытяжная вентиляция, подогрев полов, кабельное ТВ, высокоскоростной интернет.Планировка: кухня-гостиная с обеденной зоной, две спальни (одна из них со своим с/у с душевой кабиной), ванная комната. Квартира меблирована, укомплектована всей необходимой для жизни бытовой техникой. Полная звукоизоляция во всех комнатах, использованы экологичные материалы отделки. Приточно-вытяжная вентиляция, подогрев полов, кабельное ТВ, высокоскоростной интернет."
        text.font = .systemFont(ofSize: 15)
        text.numberOfLines = 0
        return text
    }()
    
    //телефон
    private lazy var phoneLabel: UILabel = {
        let phone = UILabel()
        phone.font = .systemFont(ofSize: 25)
        phone.textColor = .black
        phone.text = "8(985)152-81-71"
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScrollContentSize() {
        scrollView.contentSize = CGSize(width: contentView.bounds.width, height: contentView.bounds.height)
        print("test contentView.bounds.height = \(contentView.bounds.height) bounds.height = \(bounds.height)")
    }
    
    @objc func like() {
        likeAction?()
        
    }
    
    func setModel(model: ApartmentModel) {
        imageView.image = UIImage(named: model.imageNames.first!)
        nameLabel.text = model.shortDescription
        coastLabel.text = "\(model.price)"
        textLabel.text = model.fullDescription
        phoneLabel.text = model.phoneNumber
        
        (model.isLiked) ? likedB.setBackgroundImage(.Home.heartFill, for: .normal) : likedB.setBackgroundImage(.Home.heart, for: .normal)
        coastLabel.text = (formatter.string(from: NSNumber(value: model.price)) ?? "") + " ₽"
    }
    
    private func setupView() {
        backgroundColor = .white
        contentView.addSubviews(imageView, coastLabel, nameLabel, likedB, textLabel, phoneLabel)
//        contentView.addSubviews(imageView, coastLabel, nameLabel, likedB, phoneLabel)
        scrollView.addSubview(contentView)
        addSubview(scrollView)
        
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            
            coastLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            coastLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            coastLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            phoneLabel.heightAnchor.constraint(equalToConstant: 50),
            phoneLabel.topAnchor.constraint(equalTo: coastLabel.bottomAnchor, constant: 8),
            
            likedB.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likedB.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            likedB.widthAnchor.constraint(equalToConstant: 55),
            likedB.heightAnchor.constraint(equalToConstant: 50),
            
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 0),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
        
        
        
    }
}
