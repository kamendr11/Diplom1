import UIKit

class SearchView: UIView {
    
    var searchAction: (( _ minPrice: Int, _ maxPrice: Int, _ roomNumber: Set<Int>) -> ())?
    var resetAction: (() -> ())?
    
    private var roomsSelected: Set<Int> = []
    
    private lazy var roomCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Комнат в квартире"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var oneRoomButton = NumberOfRoomsButton(title: "1", size: 40, color: .black)
    
    private lazy var twoRoomButton = NumberOfRoomsButton(title: "2", size: 40, color: .black)
    
    private lazy var threeRoomButton = NumberOfRoomsButton(title: "3", size: 40, color: .black)
    
    private lazy var fourRoomButton = NumberOfRoomsButton(title: "4", size: 40, color: .black)
    
    private lazy var fiveRoomButton = NumberOfRoomsButton(title: "5+", size: 40, color: .black)
    
    private lazy var roomsButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubviews(oneRoomButton, twoRoomButton, threeRoomButton, fourRoomButton, fiveRoomButton)
        return stackView
    }()
    
    private lazy var coastLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Цена"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var fromPriceView: PriceTextFieldView = {
        let textField = PriceTextFieldView(title: "От")
        return textField
    }()
    
    
    private lazy var toPriceView: PriceTextFieldView = {
        let textField = PriceTextFieldView(title: "До")
        return textField
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.addArrangedSubviews(fromPriceView, toPriceView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .black
        button.setTitle("Поиск", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(searchBT), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .black
        button.setTitle("Сброс фильтров", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetBT), for: .touchUpInside)
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        backgroundColor = .white
        addSubviews(coastLabel, roomCountLabel, roomsButtonStackView, priceStackView, searchButton, resetButton)
        
        NSLayoutConstraint.activate([
            
            roomCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            roomCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            roomCountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            roomsButtonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            roomsButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            roomsButtonStackView.topAnchor.constraint(equalTo: roomCountLabel.bottomAnchor, constant: 20),
            
            coastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            coastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            coastLabel.topAnchor.constraint(equalTo: roomsButtonStackView.bottomAnchor, constant: 50),
            
            priceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceStackView.topAnchor.constraint(equalTo: coastLabel.bottomAnchor, constant: 20),
            
            searchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            searchButton.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 50),
            
            resetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            resetButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor,constant: 8)
            
            
        ])
        
        oneRoomButton.action = {
            if self.roomsSelected.contains(1) {
                self.roomsSelected.remove(1)
            } else {
                self.roomsSelected.insert(1)
            }
        }
        
        twoRoomButton.action = {
            if self.roomsSelected.contains(2) {
                self.roomsSelected.remove(2)
            } else {
                self.roomsSelected.insert(2)
            }
        }
        
        threeRoomButton.action = {
            if self.roomsSelected.contains(3) {
                self.roomsSelected.remove(3)
            } else {
                self.roomsSelected.insert(3)
            }
        }
        
        fourRoomButton.action = {
            if self.roomsSelected.contains(4) {
                self.roomsSelected.remove(4)
            } else {
                self.roomsSelected.insert(4)
            }
        }
        
        fiveRoomButton.action = {
            if self.roomsSelected.contains(5) {
                self.roomsSelected.remove(5)
            } else {
                self.roomsSelected.insert(5)
            }
        }
    }
    @objc func searchBT() {
        let fromPrice = Int(fromPriceView.getText()) ?? 0
        let toPrice = Int(toPriceView.getText()) ?? Int.max
        
        if toPrice < fromPrice {
            //                    priceErrorAction?()
            return
        }
        if roomsSelected.isEmpty {
            roomsSelected = [1, 2, 3, 4, 5]
        }
        searchAction?(fromPrice, toPrice, roomsSelected)
    }
    
    @objc func resetBT() {
        
        oneRoomButton.reset()
        twoRoomButton.reset()
        threeRoomButton.reset()
        fourRoomButton.reset()
        fiveRoomButton.reset()
        resetAction?()
        
    }
}
