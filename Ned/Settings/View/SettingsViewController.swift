import UIKit

class SettingsViewController: UIViewController {
    
    private let mainView: SettingsView
    
    private var viewModel: SettingsViewModel?
    
    init(mainView: SettingsView) {
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
    
    func setViewModel(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
    func setUpNavigationBar() {
        let item = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(doneB))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc private func doneB() {
        
    }
}
