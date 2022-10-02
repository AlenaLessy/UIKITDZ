//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit
/// расширение текстфилда для подчеркивания
extension UITextField {
    func setBottomBorder(color: UIColor) {
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
}

/// Экран входа
final class LoginScreenViewController: UIViewController {
    
    // MARK: - private properties
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        image.image = UIImage(named: "pizza.jpeg")
        return image
    }()
    
    private lazy var phoneLabel: UILabel = {
            let label = UILabel()
             label.text = "Phone"
             label.textColor = #colorLiteral(red: 0.5607666373, green: 0.6618699431, blue: 0.8427301049, alpha: 1)
             label.frame = CGRect(x: 60, y: 350, width: 80, height: 20)
             label.font = UIFont(name: "Arial Bold", size: 15)
             return label
         }()

    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 60, y: phoneLabel.frame.maxY, width: 300, height: 30)
        textField.setBottomBorder(color: .systemGray5)
        textField.placeholder = "Введите телефон"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
            let label = UILabel()
             label.text = "Password"
             label.textColor = #colorLiteral(red: 0.5607666373, green: 0.6618699431, blue: 0.8427301049, alpha: 1)
             label.frame = CGRect(x: 60, y: 420, width: 80, height: 20)
             label.font = UIFont(name: "Arial Bold", size: 15)
             return label
         }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 60, y: passwordLabel.frame.maxY, width: 300, height: 30)
        textField.setBottomBorder(color: .systemGray5)
        textField.placeholder = "Введите пароль"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
             let btn = UIButton()
             btn.setTitle("Войти", for: .normal)
             btn.setTitleColor(.white, for: .normal)
             btn.backgroundColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
             btn.frame = CGRect(x: 60, y: 500, width: 290, height: 40)
             btn.layer.cornerRadius = 7
             btn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
             return btn
         }()
    
    // MARK: - Action
    @objc private func loginButtonAction() {
             let choiceDishVC = ChoiceDishViewController()
        let navigationController = UINavigationController(rootViewController: choiceDishVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
         }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubview()
    }
    
    // MARK: - setup UI
    private func addSubview() {
        view.addSubview(phoneNumberTextField)
        view.addSubview(iconImageView)
        view.addSubview(phoneNumberTextField)
        view.addSubview(phoneLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
}
