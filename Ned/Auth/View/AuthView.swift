import UIKit

class AuthView: UIView {
    
    var loginAction: (( _ login: String?,  _ password: String?) -> ())?
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var firstTextField: UITextField = {
        let tf1 = UITextField()
        tf1.layer.borderWidth = 0.3
        tf1.layer.borderColor = UIColor.black.cgColor
        tf1.translatesAutoresizingMaskIntoConstraints = false
        tf1.placeholder = "Логин"
        return tf1
    }()
    
    private lazy var secondTextField: UITextField = {
        let tf2 = UITextField()
        tf2.placeholder = "Пароль"
        tf2.layer.borderWidth = 0.3
        tf2.layer.borderColor = UIColor.black.cgColor
        tf2.translatesAutoresizingMaskIntoConstraints = false
        return tf2
        
        
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(logInB), for: .touchUpInside)
        return button
    }()

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func logInB() {
        loginAction?(firstTextField.text, secondTextField.text)
    }
    
    
    private func setUpView() {
        backgroundColor = .white
        addSubview(firstTextField)
        addSubview(secondTextField)
        addSubview(button)
        addSubview(image)
        
        
        NSLayoutConstraint.activate([
            
            firstTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            firstTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            firstTextField.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 45),
            firstTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstTextField.heightAnchor.constraint(equalToConstant: 30),
            
            secondTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            secondTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 25),
            secondTextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button.topAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 25),
            
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100)
//            image.bottomAnchor.constraint(equalTo: firstTextField.topAnchor, constant: 5),
//            image.heightAnchor.constraint(equalToConstant: 10),
//            image.widthAnchor.constraint(equalToConstant: 2)
            
            
            
            
            
            
            
            
            ])
    }
  
    
    
    
    
    
    }
