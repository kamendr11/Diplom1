import UIKit

enum LikedViewModelState {
    case willAppear
    case removeFromFavorite
}



final class LikedViewModel {
    var updateView: (([ApartmentModel],  _ scrollToTop: Bool) -> ())?
    
    var output: LikedOutput?

    func updateModel(state: LikedViewModelState) {
        let favoriteApartments = FirebaseService.shared.getFavoriteApartments()
        print(favoriteApartments)


        switch state {
        case .willAppear:
            self.updateView?(favoriteApartments, true)

        case .removeFromFavorite:
            self.updateView?(favoriteApartments, false)
        }
    }

    func removeFromFavorite(apartment: ApartmentModel) {
        _ = FirebaseService.shared.updateApartment(apartment)
        updateModel(state: .removeFromFavorite)
    }
    func didSelectApartment(apartment: ApartmentModel) {
            output?.apartamentSelected(apartament: apartment)
        }
}
