import UIKit

protocol AuthOutput {
    func goToProfile()
}


final class AuthCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func show() {
        let vc = AuthFactory.getViewController(output: self)
        navigationController.setViewControllers([vc], animated: true)
    }

    fileprivate func showProfile() {
//        let coordinator = ProfileCoordinator(navigationController: navigationController, viewModel: viewModel)
//        coordinator.show()
        let coordinator = ProfileCoordinator(navigationController: navigationController)
        coordinator.show()
        

        
    }
}

extension AuthCoordinator: AuthOutput {
    func goToProfile() {
        showProfile()
    }
}
