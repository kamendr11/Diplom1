import UIKit

class AuthViewController: UIViewController {
    
    private let mainView: AuthView
    
    private var viewModel: AuthViewModel?
    
    init(mainView: AuthView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        
        title = "Профиль"
    }
    
    
    func setViewModel(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        mainView.loginAction = viewModel.login(login:password:)
    }
    
    
}





