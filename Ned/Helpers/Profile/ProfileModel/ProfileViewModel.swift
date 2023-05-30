import UIKit

class ProfileViewModel {
    
    var output: ProfileOutput?
    
    func signOut() {
        output?.goToLoginVC()
    }
   
    func goToSetVC() {
        output?.goToSettingsVC()
    }
    
}
