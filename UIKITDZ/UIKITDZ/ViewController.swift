//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Контроллер входа , проверяет имя и логин, если корректны - открывает экран кафемарио
final class ViewController: UIViewController {
    @IBOutlet private weak var enterEmailTextField: UITextField!
    @IBOutlet private weak var enretPasswordTextField: UITextField!
    
    private var visitors = Payment()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func showPasswordClickButton(_ sender: Any) {
        if enretPasswordTextField.isSecureTextEntry {
            enretPasswordTextField.isSecureTextEntry = false
        } else {
            enretPasswordTextField.isSecureTextEntry = true
        }
    }
    // кнопка войти + проверка логина и пароля
    @IBAction private func applicationLoginButton(_ sender: Any) {
        print("Нажатие")
        guard let user = enterEmailTextField.text,
              let pass = enretPasswordTextField.text,
              visitors.visitorList[user] == pass else {
            return loginAndPasswordVerificationAlert(text: "Логин или пароль введен неверно")
        }
        print("дошел до перехода")
        if let transitionForCafeMario = storyboard?.instantiateViewController(withIdentifier: "CafeMario")
            as? ViewControllerCafeMario {
            print("Контроллер найден")
            navigationController?.pushViewController(transitionForCafeMario, animated: true)
        }
    }
    
    // функция алерта с возможностью выдавать любой текст сообщения
    private func loginAndPasswordVerificationAlert(text: String) {
        let alertController = UIAlertController(title: "Внимание!", message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
