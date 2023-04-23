import UIKit

class AuthViewController: UIViewController {
    
    private lazy var firstTextField: UITextField = {
        let tf1 = UITextField()
        tf1.text = "почта"
        return tf1
    }()
    
    private lazy var secondTextField: UITextField = {
        let tf2 = UITextField()
        return tf2
        
        
    }()

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
    }
    
    
}





