import UIKit

enum LikedFactory {
    static func getNavigationController() -> UINavigationController {
        let mainView = HomeView()
        let vc = LikedViewController(mainView: mainView)
        let navigationController = UINavigationController(rootViewController: vc)
        let viewModel = LikedViewModel()
        vc.setUpViewModel(viewModel: viewModel)
        
        return navigationController
    }
    
    
}
