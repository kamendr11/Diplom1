import UIKit


class ApartamentDetailsViewController: UIViewController {
    
    private let mainView: ApartametsDetailsView
    
    private var viewModel: DetailsViewModel?
    

    
    init(mainView: ApartametsDetailsView) {
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
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.setScrollContentSize()
    }
//    override func () {
//        super.viewWillLayoutSubviews()
//        mainView.setScrollContentSize()
    func setViewModel(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        mainView.likeAction = viewModel.like
        viewModel.updateView = mainView.setModel(model:)
        viewModel.update()
      
    }
    
    

}
