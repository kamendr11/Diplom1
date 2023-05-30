import Foundation

struct AuthInspector {
    private let login = "Kamendr11"
    private let password = "12345"

    static let shared = AuthInspector()
    private init() {}

    func isLoginAndPasswordCorrect( login: String,  password: String) -> Bool {
        self.login == login && self.password == password ? true : false
    }
}
