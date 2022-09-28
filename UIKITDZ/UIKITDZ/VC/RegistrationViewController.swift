//
//  RegistrationViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 27.09.2022.
//

import UIKit
/// Экран регистрации
final class RegistrationViewController: UIViewController {
    
    // MARK: - Public properties
    
    var buyerInformation = BuyerInformation()
    
    // MARK: - Private properties
    
    private lazy var datePicker = UIDatePicker()
    private lazy var candyBarLabel: UILabel = {
        let label = UILabel()
        label.text = "Candy Bar"
        label.textColor = .red
        label.frame = CGRect(x: 150, y: 80, width: 150, height: 50)
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.textColor = .red
        label.frame = CGRect(x: 80, y: 145, width: 80, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = .red
        label.frame = CGRect(x: loginTextField.frame.minX,
                             y: loginTextField.frame.maxY + 10,
                             width: 250,
                             height: 30)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .red
        label.frame = CGRect(x: passwordTextField.frame.minX,
                             y: passwordTextField.frame.maxY + 10,
                             width: 250,
                             height: 30)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    
    private lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
        label.textColor = .red
        label.frame = CGRect(x: nameTextField.frame.minX,
                             y: nameTextField.frame.maxY + 10,
                             width: 150,
                             height: 40)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.textColor = .red
        label.frame = CGRect(x: birthdayTextField.frame.minX,
                             y: birthdayTextField.frame.maxY + 10,
                             width: 150,
                             height: 40)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: loginLabel.frame.minX,
                            y: loginLabel.frame.maxY,
                            width: 250,
                            height: 30)
        text.borderStyle = .roundedRect
        text.placeholder = "Введите ваш логин"
        return text
    }()
    
    private lazy var passwordTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: passwordLabel.frame.minX,
                            y: passwordLabel.frame.maxY,
                            width: 250,
                            height: 30)
        text.borderStyle = .roundedRect
        text.placeholder = "Введите ваш пароль"
        return text
    }()
    
    private lazy var nameTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: nameLabel.frame.minX,
                            y: nameLabel.frame.maxY,
                            width: 250,
                            height: 30)
        text.borderStyle = .roundedRect
        text.placeholder = "Введите ваше имя"
        return text
    }()
    
    private lazy var birthdayTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: birthdayLabel.frame.minX,
                            y: birthdayLabel.frame.maxY,
                            width: 250,
                            height: 30)
        text.borderStyle = .roundedRect
        text.placeholder = "Введите дату рождения"
        text.inputView = datePicker
        return text
    }()
    
    private lazy var phoneNumberTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: phoneNumberLabel.frame.minX,
                            y: phoneNumberLabel.frame.maxY,
                            width: 250,
                            height: 30)
        text.borderStyle = .roundedRect
        text.placeholder = "Например 89673241414"
        return text
    }()
    
    private func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let buttonToolBar = UIBarButtonItem(barButtonSystemItem: .done,
                                            target: nil,
                                            action: #selector(datePickerButtonAction))
        toolBar.setItems([buttonToolBar], animated: true)
        birthdayTextField.inputAccessoryView = toolBar
        birthdayTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    private lazy var registrationButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Зарегистрироваться", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.frame = CGRect(x: 110,
                           y: phoneNumberTextField.frame.maxY + 40,
                           width: 200,
                           height: 40)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(registrationButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.frame = CGRect(x: 0, y: 20, width: 100, height: 20)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchDown)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubView()
    }
    
    // MARK: - Action
    
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc private func datePickerButtonAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        birthdayTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc private func registrationButtonAction() {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              let name = nameTextField.text,
              let birthday = birthdayTextField.text,
              let phoneNumber = phoneNumberTextField.text,
                !login.isEmpty,
              !password.isEmpty,
              !name.isEmpty,
              !birthday.isEmpty,
              !phoneNumber.isEmpty
        else {
            let loginFailedAlert = UIAlertController(title: "Ошибка",
                                                     message: "Не все поля заполнены",
                                                     preferredStyle: .alert)
            let loginFailedAlertAction = UIAlertAction(title: "OK",
                                                       style: .cancel)
            loginFailedAlert.addAction(loginFailedAlertAction)
            self.present(loginFailedAlert, animated: true)
            return
        }
        buyerInformation.login = login
        buyerInformation.password = password
        buyerInformation.name = name
        CommonUserDefaults.addBuyer(buyerInformation)
        dismiss(animated: true)
    }
    
    // MARK: - setupUI
   
    private func configureSubView() {
        view.backgroundColor = .white
        view.addSubview(candyBarLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(registrationButton)
        view.addSubview(cancelButton)
        createDatePicker()
    }
}
