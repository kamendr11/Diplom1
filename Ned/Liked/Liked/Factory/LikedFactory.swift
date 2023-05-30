import UIKit

enum LikedFactory {
    static func getNavigationController(output: LikedOutput) -> UINavigationController {
        let mainView = HomeView()
        let vc = LikedViewController(mainView: mainView)
        let navigationController = UINavigationController(rootViewController: vc)
        let viewModel = LikedViewModel()
        vc.setUpViewModel(viewModel: viewModel)
        viewModel.output = output
        
        return navigationController
    }
    
    
}
