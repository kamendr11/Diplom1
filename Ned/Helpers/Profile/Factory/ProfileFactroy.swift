import UIKit



enum ProfileFactory {
    
    static func getViewController(output: ProfileOutput) -> UIViewController {
        let mainView = ProfileView()
        let vc = ProfileViewController(mainView: mainView)
        
        let viewModel = ProfileViewModel()
        viewModel.output = output
        vc.setViewModel(viewModel: viewModel)
        
        
        return vc
    }
}
//enum ProfileFactory {
//    static func getNavigationController() -> UIViewController {
//        let mainView = ProfileView()
//        let vc = ProfileViewController(mainView: mainView)
//        let navigationController = UINavigationController(rootViewController: vc)
//        let coordinator = ProfileCoordinator(navigationController: navigationController)
//        let viewModel = ProfileViewModel()
//        viewModel.output = coordinator
//        vc.setViewModel(viewModel: viewModel)
//        return navigationController
//    }
//
//    static func getViewController(output: ProfileOutput) -> UIViewController {
//        let mainView = ProfileView()
//        let vc = ProfileViewController(mainView: mainView)
//        let viewModel = ProfileViewModel()
//        viewModel.output = output
//        vc.setViewModel(viewModel: viewModel)
//        return vc
//    }
//
//}

