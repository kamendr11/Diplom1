import UIKit

class HomeViewController: UIViewController {


    private let mainView: HomeView
    
    private var viewModel: HomeViewModelProtocol?

    
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
        setNavigationBar()
        
        title = "Под крышей"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.updateModel(state: .initial)
    }
    
    
    @objc func searchButtonClicked() {
        viewModel?.goToSearchViewController()
//        let vc = SeachViewController(mainView: SearchView())
//        present(vc, animated: true)
    }
    
    func setViewModel(viewModel: HomeViewModelProtocol) {
            self.viewModel = viewModel
        mainView.likeAction = viewModel.addLikedApartament(model:)
        mainView.didSelectApartament = { apartment in
            viewModel.showMoreDetails(model: apartment)
        }
            updateView()
        }
    
    private func updateView() {
        viewModel!.updateView = mainView.updateCollectionView(data:)
//            self.viewModel?.updateView = mainView.updateCollectionView(with:)
            viewModel?.updateModel(state: .initial)
//            self.viewModel?.updateModel = mainView.updateModel(model:)
        }
    
    private func setNavigationBar() {
            let searchButton = UIBarButtonItem(image: .Home.magnifyingglass, style: .plain, target: self, action: #selector(searchButtonClicked))
            searchButton.tintColor = .black
            navigationItem.rightBarButtonItem = searchButton
            navigationItem.rightBarButtonItem?.tintColor = .black
        }
    
    
    


}
