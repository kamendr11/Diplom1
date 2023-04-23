import UIKit

class SearchViewController: UIViewController {
    
    var output: SearchOutput?
    
    private let mainView: SearchView
    
    init(mainView: SearchView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mainView.searchAction = output?.searchButtonTouched(minPrice:maxPrice:roomNumber:)
        mainView.resetAction = output?.resetButtonTouched
    }
    private func setupView() {
        view.backgroundColor = .clear
        view.addSubview(mainView)
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2)
            
        
        
        
        
        ])
    }
}


