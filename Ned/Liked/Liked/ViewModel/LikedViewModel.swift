import UIKit

enum LikedViewModelState {
    case willAppear
    case removeFromFavorite
}



final class LikedViewModel {
    var updateView: (([ApartmentModel],  _ scrollToTop: Bool) -> ())?
    
   

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
}
