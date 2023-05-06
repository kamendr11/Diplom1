import UIKit

class HomeView: UIView {
    
    var likeAction: ((ApartmentModel)->())?
    
    var didSelectApartament: ((_ apartment: ApartmentModel) -> ())?
    
    private var apartments: [ApartmentModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(ApartamentCell.self, forCellWithReuseIdentifier: "ApartametCell")
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
        
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCollectionView(data: [ApartmentModel]) {      //будет обновлять страницу
        apartments = data
        collectionView.reloadData()
    }
    
    
    private func setupView() {
        backgroundColor = .white
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}



extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 16, height: UIScreen.main.bounds.height / 1.8)
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        apartments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApartametCell", for: indexPath) as? ApartamentCell else {
            return UICollectionViewCell()
        }
        cell.likeAction = likeAction
        cell.addData(data: apartments[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectApartament?(apartments[indexPath.row])
    
    }
    
    
}
