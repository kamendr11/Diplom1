import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "free-icon-user-483361")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 55)
        nameLabel.textColor = .black
        nameLabel.text = "Игорь"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    private lazy var telLabel: UILabel = {
        let telLabel = UILabel()
        telLabel.font = .systemFont(ofSize: 23)
        telLabel.textColor = .black
        telLabel.text = "Телефон: 8(985)152-81-71"
        telLabel.translatesAutoresizingMaskIntoConstraints = false
        return telLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.font = .systemFont(ofSize: 23)
        emailLabel.textColor = .black
        emailLabel.text = "Почта: ikam495@icloud.com"
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private lazy var nextB: UIButton = {
        let nextB = UIButton()
        nextB.setBackgroundImage(UIImage(named: "icons8-больше-чем-30"), for: .normal)
        nextB.tintColor = .black
        nextB.translatesAutoresizingMaskIntoConstraints = false
        return nextB
    }()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        view.addSubview(telLabel)
        view.addSubview(emailLabel)
        view.addSubview(nextB)
        
       
        
        NSLayoutConstraint.activate([
            
            
            
            profileImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            nameLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            
            telLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            telLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            telLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            telLabel.heightAnchor.constraint(equalToConstant: 100),
            
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            emailLabel.topAnchor.constraint(equalTo: telLabel.bottomAnchor, constant: 8),
            
            nextB.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
//            nextB.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nextB.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
        ])
        
       

    }
    
    
    
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


   
