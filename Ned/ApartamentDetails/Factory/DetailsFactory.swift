import UIKit

enum DetailsFactory {
    
    static func getViewController(model: ApartmentModel) -> UIViewController {
        let mainView = ApartametsDetailsView()
        let vc = ApartamentDetailsViewController(mainView: mainView)
        
        let viewModel = DetailsViewModel(model: model)
        vc.setViewModel(viewModel: viewModel)
        
        return vc
        
    }
}
