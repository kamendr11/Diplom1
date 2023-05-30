import UIKit

protocol ProfileOutput {
    
    func goToLoginVC()
    
    func goToSettingsVC()
        
    
}


final class ProfileCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func show() {
        navigationController.pushViewController(ProfileFactory.getViewController(output: self), animated: true)
    }
    
    func showLoginController() {
        let coordinator = AuthCoordinator(navigationController: navigationController)
        coordinator.show()
    }
    
    
}

extension ProfileCoordinator: ProfileOutput {
    
    func goToSettingsVC() {
        let coordinator = SettingsCoordinator(navigationController: navigationController)
        coordinator.show()
    }
    
    
    func goToLoginVC() {
        showLoginController()
    }
    
    
    
}
