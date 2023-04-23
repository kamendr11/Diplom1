import UIKit

class ApartamentCell: UICollectionViewCell {
    
    var likeAction: ((ApartmentModel)->())?
    
    private var model: ApartmentModel?
    
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
    
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "depositphotos_45276821-stock-photo-bright-interior-of-living-room")
        return image
    }()
    
    private lazy var likedB: UIButton = {
        let likedB = UIButton()
        likedB.translatesAutoresizingMaskIntoConstraints = false
        likedB.tintColor = .black
        likedB.addTarget(self, action: #selector(likeBTouch), for: .touchUpInside)
        return likedB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addData(data: ApartmentModel) {
        image.image = UIImage(named: data.imageNames[0])
        nameLabel.text = data.shortDescription
        model = data
        model?.isLiked ?? false ? likedB.setBackgroundImage(.Home.heartFill, for: .normal) : likedB.setBackgroundImage(.Home.heart, for: .normal)
        coastLabel.text = (formatter.string(from: NSNumber(value: data.price)) ?? "") + " ₽"
    }
    
    @objc func likeBTouch() {
        guard let model = model else {return}
        likeAction?(model)
        !(model.isLiked) ? likedB.setBackgroundImage(.Home.heartFill, for: .normal) : likedB.setBackgroundImage(.Home.heart, for: .normal)
    }
    
    
    
    private func setupView() {
        backgroundColor = .white
        addSubview(coastLabel)
        addSubview(nameLabel)
        addSubview(likedB)
        
        addSubview(image)
        
        NSLayoutConstraint.activate([
            
            likedB.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            likedB.centerYAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            likedB.widthAnchor.constraint(equalToConstant: 55),  //50
            likedB.heightAnchor.constraint(equalToConstant: 50),  //45
            
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.2),
            
            coastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            coastLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5)
        ])
    }
    
}
