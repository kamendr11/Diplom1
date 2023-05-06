import UIKit


class DetailsViewModel {
    
    var updateView: ((_ model: ApartmentModel) -> ())?
    
    private var model: ApartmentModel
    
    init(model: ApartmentModel) {
        self.model = model
    }
    
    func update() {
        updateView?(model)
    }
    
    func like() {
        model = FirebaseService.shared.updateApartment(model)
        update()
    }
    
    
}
