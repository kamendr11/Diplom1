import UIKit

protocol SettingsOutput {
    
}

final class SettingsCoordinator: SettingsOutput {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func show() {
        navigationController.pushViewController(SettingsFactory.getViewController(output: self), animated: true)
    }
    
}
