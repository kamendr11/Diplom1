import UIKit

enum AuthFactory {
    static func getNavigationController() -> UIViewController {
        let mainView = AuthView()
        let vc = AuthViewController(mainView: mainView)
        let navigationController = UINavigationController(rootViewController: vc)
        let coordinator = AuthCoordinator(navigationController: navigationController)
        let viewModel = AuthViewModel()
        viewModel.output = coordinator
        vc.setViewModel(viewModel: viewModel)
        return navigationController
    }

    static func getViewController(output: AuthOutput) -> UIViewController {
        let mainView = AuthView()
        let vc = AuthViewController(mainView: mainView)
        let viewModel = AuthViewModel()
        viewModel.output = output
        vc.setViewModel(viewModel: viewModel)
        return vc
    }
}
