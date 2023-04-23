import Foundation

protocol HomeViewModelProtocol {
    var updateView: (([ApartmentModel]) -> ())? { get set }
    var updateModel: (([ApartmentModel]) -> ())? { get set }
    
    func updateModel(state: HomeViewModelState)
    func addLikedApartament(model: ApartmentModel)
    func removeLikedApartament(model: ApartmentModel)
    func goToSearchViewController()
    func showMoreDetails(model: ApartmentModel)
}

enum HomeViewModelState {
    case initial
    case filter(minPrice: Int, maxPrice: Int, roomNumber: Set<Int>)
    case like
}

protocol HomeViewModelDelegate {
    func update(model: [ApartmentModel])
}

final class HomeViewModel: HomeViewModelProtocol {
    var updateView: (([ApartmentModel]) -> ())?
    var updateModel: (([ApartmentModel]) -> ())?
    var output: HomeOutput?
    
    
    func updateModel(state: HomeViewModelState) {
        switch state {
        case .initial:
            getData()
        case .filter(let minPrice, let maxPrice, let roomNumber):
            filterApartaments(minPrice: minPrice, maxPrice: maxPrice, numberOfRooms: roomNumber)
        case .like:
            getData()
        }
        
    }
    
    func addLikedApartament(model: ApartmentModel) {
//        ApartamentData.likedApartaments.append(model)
//        ApartamentData.apartamentWasLiked(apartament: model)
        FirebaseService.shared.updateApartment(model)
        
        updateModel(state: .like)
    }
    
    func removeLikedApartament(model: ApartmentModel) {
//        ApartamentData.likedApartaments.removeAll { foundedModel in
//            model == foundedModel
//        }
    }
    
    func showMoreDetails(model: ApartmentModel) {
        output?.apartamentSelected(apartament: model)
    }
    
    func goToSearchViewController() {
        output?.searchButtonTouched(homeModelDelegate: self)
    }
    
    private func filterApartaments(minPrice: Int, maxPrice: Int, numberOfRooms: Set<Int>) {
        let apartments = FirebaseService.shared.getApartments()
        updateView?(
        apartments.filter { model in
            let numberOfRoomsContainsFive = numberOfRooms.contains(5)
            let roomHasMoreThanOrEqualToFiveRooms = model.numberOfRooms >= 5
            let modelMustHaveAndHas = numberOfRoomsContainsFive && roomHasMoreThanOrEqualToFiveRooms

            return model.price > minPrice && model.price < maxPrice && (numberOfRooms.contains(model.numberOfRooms) || modelMustHaveAndHas)
        })
    }
    
    private func getData() {
        FirebaseService.shared.downloadApartments { result in
            switch result {
            case .success(let apartments): self.updateView?(apartments)
            case .failure(let error): print(error .localizedDescription)
            }
        }
    }
    
}
