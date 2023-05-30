import UIKit

class SettingsView: UIView {
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "free-icon-user-483361")
        return image
    }()
    
    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Фотография профиля"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let name = UITextField()
        name.layer.borderWidth = 0.3
        name.placeholder = "Имя"
        name.layer.borderColor = UIColor.black.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let name = UITextField()
        name.layer.borderWidth = 0.3
        name.placeholder = "Фамилия"
        name.layer.borderColor = UIColor.black.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var dadNameTextField: UITextField = {
        let name = UITextField()
        name.layer.borderWidth = 0.3
        name.placeholder = "Отчество"
        name.layer.borderColor = UIColor.black.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var phoneTextField: UITextField = {
        let name = UITextField()
        name.layer.borderWidth = 0.3
        name.placeholder = "Телефон"
        name.layer.borderColor = UIColor.black.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailTextField: UITextField = {
        let name = UITextField()
        name.layer.borderWidth = 0.3
        name.placeholder = "Электронная почта"
        name.layer.borderColor = UIColor.black.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        backgroundColor = .white
        addSubview(profileImage)
        addSubview(imageLabel)
        addSubview(nameTextField)
        addSubview(lastNameTextField)
        addSubview(dadNameTextField)
        addSubview(phoneTextField)
        addSubview(emailTextField)
        
        
        
        
        NSLayoutConstraint.activate([
            
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 170),
            profileImage.heightAnchor.constraint(equalToConstant: 170),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            
            imageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            imageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            imageLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15),
            
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            nameTextField.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 25),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            dadNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            dadNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            dadNameTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 25),
            dadNameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            phoneTextField.topAnchor.constraint(equalTo: dadNameTextField.bottomAnchor, constant: 25),
            phoneTextField.heightAnchor.constraint(equalToConstant: 30),
            
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 25),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
        
            
            ])
        
        
    }
    
    
    
}

