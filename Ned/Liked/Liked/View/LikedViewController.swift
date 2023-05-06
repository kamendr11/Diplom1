import UIKit

class LikedViewController: UIViewController {
    
    private let mainView: HomeView
    
    private var viewModel: LikedViewModel?
    
    
    init(mainView: HomeView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.updateModel(state: .willAppear)
    }
    
    func setUpViewModel(viewModel: LikedViewModel) {
        self.viewModel = viewModel
        mainView.likeAction = viewModel.removeFromFavorite(apartment:)
        self.viewModel?.updateView = { data, scrollToTop in
            self.mainView.updateCollectionView(data: data)
            
        }
        
    }
    
}
