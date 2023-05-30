import UIKit

class ProfileViewController: UIViewController {
    
    private let mainView: ProfileView
    
    private var viewModel: ProfileViewModel?
    
    init(mainView: ProfileView) {
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
        setUpNavigationBar()
    }
    
    func setViewModel(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        
    }
    
    private func setUpNavigationBar() {
        let item = UIBarButtonItem(title: "Выйти", style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = item
        
        let item2 = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(settingsB))
        navigationItem.rightBarButtonItem = item2
    }
    
    
    
    @objc private func signOut() {
        viewModel?.signOut()
        }
    
    @objc private func settingsB() {
        viewModel?.goToSetVC()
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


   

