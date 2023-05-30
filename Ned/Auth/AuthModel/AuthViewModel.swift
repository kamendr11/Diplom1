import UIKit

class AuthViewModel {
    
    var output: AuthOutput?
    
    
    
    
    
    func login(login: String?, password: String?) {
        guard let login = login, let password = password, !login.isEmpty, !password.isEmpty else {
            return
        }
        if AuthInspector.shared.isLoginAndPasswordCorrect(login: login, password: password) {
            output?.goToProfile()
        }
        
    }
}
