import UIKit


class DetailsCoordinator {
    
    
    
    
    private let navigationController: UINavigationController
    private let apartment: ApartmentModel
    
    init(navigationController: UINavigationController, apartment: ApartmentModel) {
        self.navigationController = navigationController
        self.apartment = apartment
    }
    
    func show() {
        navigationController.pushViewController(DetailsFactory.getViewController(model: apartment), animated: true)
    }
    
}
