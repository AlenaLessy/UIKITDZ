//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

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

/// Экран регистрации пользователей
class RegistrationViewController: UIViewController {

    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Войти", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        btn.frame = CGRect(x: 60, y: 570, width: 290, height: 40)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = #colorLiteral(red: 0.1175499335, green: 0.1175499335, blue: 0.1175499335, alpha: 1)
        label.frame = CGRect(x: 60, y: 250, width: 80, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 22)
        return label
    }()
    
    private lazy var eMailLabel: UILabel = {
       let label = UILabel()
        label.text = "Email"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.frame = CGRect(x: 60, y: 300, width: 50, height: 30)
        label.font = UIFont(name: "Arial Bold", size: 15)
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
       let label = UILabel()
        label.text = "Password"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.frame = CGRect(x: 60, y: 400, width: 80, height: 30)
        label.font = UIFont(name: "Arial Bold", size: 15)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Введите ваш eMail"
        textField.frame = CGRect(x: 60, y: 320, width: 270, height: 50)
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Введите ваш eMail"
        textField.frame = CGRect(x: 60, y: 420, width: 270, height: 50)
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    
    private lazy var faceIDLoginLabel: UILabel = {
       let label = UILabel()
        label.text = "Вход по Face ID"
        label.textColor = #colorLiteral(red: 0.1997019649, green: 0.1997019649, blue: 0.1997019649, alpha: 1)
        label.frame = CGRect(x: 190, y: 500, width: 100, height: 30)
        label.font = UIFont(name: "Arial Bold", size: 12)
        return label
    }()
    
    private lazy var faceIdSwith: UISwitch = {
        var switcher = UISwitch()
        switcher.isOn = true
        switcher.frame = CGRect(x: 300, y: 500, width: 30, height: 30)
        switcher.tintColor = .gray
        return switcher
    }()
    
    private lazy var birthdayReminderLabel: UILabel = {
        var label = UILabel()
        label.text = "Birthday Reminder"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.layer.borderWidth = CGFloat(1)
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: 200, height: 70)
        label.center.x = view.center.x
        return label
    }()
    
    private lazy var hideTextButtonAction: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.frame = CGRect(x: 300, y: 435, width: 30, height: 30)
        button.tintColor = .gray
       button.addTarget(self, action: #selector(hideTextButtonToggleAction), for: .touchDown)
        return button
    }()
    
    @objc private func hideTextButtonToggleAction() {
        guard passwordTextField.isSecureTextEntry else {
            passwordTextField.isSecureTextEntry = true
            hideTextButtonAction.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            return
        }
            passwordTextField.isSecureTextEntry = false
            hideTextButtonAction.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    }
    
    @objc private func loginButtonAction() {
        let birthdayVC = BirthDayViewController()
        navigationController?.pushViewController(birthdayVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubView()
    }
    private func configureSubView() {
        view.addSubview(loginButton)
        view.addSubview(signInLabel)
        view.addSubview(eMailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(faceIDLoginLabel)
        view.addSubview(faceIdSwith)
        view.addSubview(birthdayReminderLabel)
        view.addSubview(hideTextButtonAction)
        view.backgroundColor = .white
    }
}
