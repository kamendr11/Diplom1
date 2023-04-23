import UIKit

final class PriceTextFieldView: UIStackView {
    private lazy var title = UILabel()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.borderStyle = .none
//        textField.delegate = self
        textField.adjustsFontSizeToFitWidth = true
        return textField
    }()

    private lazy var rubleLabel: UILabel = {
        let label = UILabel()
        label.text = "₽"
        return label
    }()

    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(title: String) {
        super.init(frame: .zero)
        setupView(title: title)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getText() -> String {
        textField.text!
    }

    
    func reset() {
        textField.text = ""
    }

    private func setupView(title: String) {
        self.title.text = title
        axis = .horizontal
        spacing = 10
        addSubview(bottomLine)
        addArrangedSubviews(self.title, textField, rubleLabel)
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 90),

            bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
}
