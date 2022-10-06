//
//  RegistrationViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 05.10.2022.
//

import UIKit
/// Экран регистрации приложения
final class RegistrationViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let alertTitle = "Ошибка"
        static let alertMessageEmptyTextField = "Не все поля заполнены"
        static let okAlertAction = "OK"
    }
    // MARK: - Private Outlets
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var eMailTextField: UITextField!
    @IBOutlet weak private var phoneNumberTextField: UITextField!
    
    // MARK: - Private Properties
    
    var userInfo = UserInfo()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationCenter()
        configureTextFields()
        setTapView()
    }
    
    // MARK: - Action
    
    @objc private func tappView() {
        view.endEditing(true)
    }
    
    @IBAction  private func registrationButtonAction(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              let name = nameTextField.text,
              let eMail = eMailTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              !login.isEmpty,
              !password.isEmpty,
              !name.isEmpty,
              !eMail.isEmpty,
              !phoneNumber.isEmpty
        else {
            let loginFailedAlert = UIAlertController(title: Constants.alertTitle,
                                                     message: Constants.alertMessageEmptyTextField,
                                                     preferredStyle: .alert)
            let loginFailedAlertAction = UIAlertAction(title: Constants.okAlertAction,
                                                       style: .cancel)
            loginFailedAlert.addAction(loginFailedAlertAction)
            self.present(loginFailedAlert, animated: true)
            return
        }
        userInfo.login = login
        userInfo.password = password
        userInfo.name = name
        CommonUserDefaults.addUser(userInfo)
        navigationController?.popToRootViewController(animated: true)
    }
    // MARK: - Private Method
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = 0
        }
    }
    
    private func setTapView() {
        let theTap = UITapGestureRecognizer(target: self, action: #selector(tappView))
        view.addGestureRecognizer(theTap)
    }
    
    private func configureTextFields() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        eMailTextField.delegate = self
        phoneNumberTextField.delegate = self
        loginTextField.keyboardType = .default
        passwordTextField.keyboardType = .default
        nameTextField.keyboardType = .default
        eMailTextField.keyboardType = .emailAddress
        phoneNumberTextField.keyboardType = .namePhonePad
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
