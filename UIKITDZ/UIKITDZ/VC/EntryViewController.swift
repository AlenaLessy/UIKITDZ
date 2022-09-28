//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Экран входа в приложение
class EntryViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var backGroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "candyBarphoto.jpeg")
        image.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        return image
    }()
    
    private lazy var backGroundLoginImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.frame = CGRect(x: 80, y: 230, width: 240, height: 240)
        image.layer.cornerRadius = 15
        return image
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Войти", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.red, for: .normal)
        btn.frame = CGRect(x: 100, y: 380, width: 200, height: 40)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var registrationButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 140, y: 430, width: 120, height: 20)
        btn.setTitle("Регистрация", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(registrationButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var candyBarLabel: UILabel = {
        let label = UILabel()
        label.text = "Candy Bar"
        label.textColor = .red
        label.frame = CGRect(x: 160, y: 240, width: 150, height: 30)
        label.font = UIFont(name: "System Italic", size: 20)
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.frame = CGRect(x: 100, y: 270, width: 200, height: 40)
        login.placeholder = "Введите логин"
        login.borderStyle = .roundedRect
        return login
    }()
    
    private lazy var passwordTextField: UITextField = {
        let pass = UITextField()
        pass.frame = CGRect(x: 100, y: 320, width: 200, height: 40)
        pass.placeholder = "Введите пароль"
        pass.borderStyle = .roundedRect
        pass.isSecureTextEntry = true
        return pass
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubview()
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Action
    
    @objc func loginButtonAction() {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              !login.isEmpty,
              !password.isEmpty
        else {
            showAlert(title: "Error", message: "Поля не заполены")
            return
        }
        let buyers = CommonUserDefaults.buyers
        
        guard let buyer = buyers.first(where: { $0.login.lowercased() == login.lowercased() }),
               buyer.password == password
        else {
            showAlert(title: "Error", message: "Неверный логин или пароль")
            return
        }
        let candyStoreVC = CandyStoreViewController()
        candyStoreVC.welcomeName = buyer.name
        navigationController?.pushViewController(candyStoreVC, animated: true)
    }
    
    @objc func registrationButtonAction() {
        let regirtrationVC = RegistrationViewController()
        present(regirtrationVC, animated: true)
    }
    
    // MARK: - setup UI
    
    private func configureSubview() {
        view.addSubview(backGroundImage)
        view.addSubview(backGroundLoginImage)
        view.addSubview(loginButton)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(candyBarLabel)
        view.addSubview(registrationButton)
    }
    
    // MARK: - universal alert
    
    private func showAlert(title: String, message: String) {
        let loginFailedAlert = UIAlertController(title: title,
                                                 message: message,
                                                 preferredStyle: .alert)
        let loginFailedAlertAction = UIAlertAction(title: "OK",
                                                   style: .cancel)
        loginFailedAlert.addAction(loginFailedAlertAction)
        present(loginFailedAlert, animated: true)
    }
}
