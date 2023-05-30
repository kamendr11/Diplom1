import UIKit

protocol LikedOutput {
    func apartamentSelected(apartament: ApartmentModel)
}

final class LikedCoordinator {
    private var navigationController: UINavigationController?

    func getNavigationController() -> UINavigationController {
        let navigationController = LikedFactory.getNavigationController(output: self)
        self.navigationController = navigationController
        return navigationController
    }

    fileprivate func showFullDescriptionViewController(apartament: ApartmentModel) {
        guard let navigationController = navigationController else { return }

        let coordinator = DetailsCoordinator(navigationController: navigationController, apartment: apartament)
        coordinator.show()
    }
}

extension LikedCoordinator: LikedOutput {
    func apartamentSelected(apartament: ApartmentModel) {
        showFullDescriptionViewController(apartament: apartament)
    }
}

