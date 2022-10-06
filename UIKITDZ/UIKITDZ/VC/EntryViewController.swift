//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Экран входа
class EntryViewController: UIViewController {

    // MARK: - Private Outlets
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    // MARK: Private Action
    
    @IBAction private func entryButtonAction(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              !login.isEmpty,
              !password.isEmpty
        else {
            showAlert(title: "Error", message: "Поля не заполены")
            return
        }
        let users = CommonUserDefaults.users
        
        guard let user = users.first(where: { $0.login.lowercased() == login.lowercased() }),
              user.password == password
        else {
            showAlert(title: "Error", message: "Неверный логин или пароль")
            return
        }
        guard let catalogBooksVC = storyboard?.instantiateViewController(withIdentifier: "catalog") as?
                         CatalogBooksViewController else { return }
                 navigationController?.pushViewController(catalogBooksVC, animated: true)
    }
    
    @IBAction private func registrationButtonAction(_ sender: Any) {
        guard let registrationVC = storyboard?.instantiateViewController(withIdentifier: "registration")
                as? RegistrationViewController else { return }
        navigationController?.pushViewController(registrationVC, animated: true)
    }
                
    // Private Method
    private func showAlert(title: String, message: String) {
             let loginFailedAlertController = UIAlertController(title: title,
                                                      message: message,
                                                      preferredStyle: .alert)
             let loginFailedAlertAction = UIAlertAction(title: "OK",
                                                        style: .cancel)
             loginFailedAlertController.addAction(loginFailedAlertAction)
             present(loginFailedAlertController, animated: true)
         }
}
