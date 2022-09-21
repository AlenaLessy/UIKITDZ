//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {
    // переменные для игры угадай число
    var numberInt = 0
    var randomNumber = 0
    
    // конфигуция лейбла приветствия
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 75, y: 150, width: 250, height: 80)
        label.backgroundColor = #colorLiteral(red: 0.6962381005, green: 0.5543535352, blue: 0.9161047339, alpha: 1)
        label.textColor = .black
        label.font = UIFont(name: "Demi Bold", size: 14)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    // конфигурация кнопки игры "Сложение"
    private lazy var additionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        button.setTitle("Cложение", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 50, y: 450, width: 100, height: 70)
        button.addTarget(self, action: #selector(actionsAdditionButton), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    // конфигурация кнопки игры "Угадай число"
    
    private lazy var guessTheNumberButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Угадай число", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.frame = CGRect(x: 200, y: 450, width: 150, height: 70)
        btn.addTarget(self, action: #selector(guessTheNumberButtonAction), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        // Do any additional setup after loading the view.
        //  self.view.addSubview(welcomeLabel)
    }
    
    // Алерт приветствия с именем и проверкой, есть ли имя + появление на экране кнопок игры и алерта
    func welcomeAlert() {
        let welcomeAlert = UIAlertController(title: nil, message: "Введите имя", preferredStyle: .alert)
        let welcomeAlertAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = welcomeAlert.textFields?.first?.text,
                  !text.isEmpty else {
                self.welcomeLabel.text = "Привет незнакомец!"
                self.welcomeLabel.isHidden = false
                self.additionButton.isHidden = false
                self.guessTheNumberButton.isHidden = false
                return
            }
            self.welcomeLabel.text = "Привет \(text)!"
            self.welcomeLabel.isHidden = false
            self.additionButton.isHidden = false
            self.guessTheNumberButton.isHidden = false
        }
        welcomeAlert.addTextField(configurationHandler: nil)
        welcomeAlert.addAction(welcomeAlertAction)
        self.present(welcomeAlert, animated: true, completion: nil)
    }
    // алерт стандартный
    func alert(title: String, message: String, style: UIAlertController.Style, textField: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        if textField {
            alertController.addTextField()
        }
    }
    // алерт кнопки сложения с двумя числами
    func additionGameAlert() {
        let additionGameAlert = UIAlertController(title: "Сложение", message: "Введите 2 числа", preferredStyle: .alert)
        let additionGameAlertAction = UIAlertAction(title: "Ок", style: .default) { _ in
            guard let numberOne = Int(additionGameAlert.textFields?[0].text ?? ""),
                  let numberTwo = Int(additionGameAlert.textFields?[1].text ?? "") else {
                self.alert(title: "Ой!", message: "Вы ввели некорректное значение", style: .alert, textField: false)
                return
            }
            self.alert(title: "Отлично", message: "Cумма равна \(numberOne + numberTwo)",
                       style: .alert, textField: false)
        }
        additionGameAlert.addTextField { texField in
            texField.placeholder = "Число 1"
        }
        additionGameAlert.addTextField { texField in
            texField.placeholder = "Число 2"
        }
        additionGameAlert.addAction(additionGameAlertAction)
        self.present(additionGameAlert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        welcomeAlert()
        
    }
    // действие при нажатии кнопки сложение
    @objc private func actionsAdditionButton() {
        additionGameAlert()
    }
    
    // действие при нататии кнопки угадай число
    @objc private func guessTheNumberButtonAction() {
      game(number: nil)
    }
    // игра угадай число
    // функция алертов для игры угадай число
    func showAlert (title: String, text: String, textfield: Bool) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.game(number: alert.textFields?.first?.text)
        }
        alert.addAction(alertAction)
        if textfield { alert.addTextField(configurationHandler: nil)
        }
        present(alert, animated: true, completion: nil)
    }
    
    // логика игры угадай число
    func game (number: String?) {
        if randomNumber == 0 {
            randomNumber = Int.random(in: 1...10)
            showAlert(title: "Привет", text: "Я загадал для вас число от 1 до 10, попробуй угадать", textfield: true)
        }
        
        if let numberOfInt = number {
            numberInt = Int(numberOfInt) ?? 0
            switch numberInt {
            case randomNumber:
                randomNumber = 0
                let alertWin = UIAlertController(title: "Вы победили!", message: nil, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default)
                alertWin.addAction(alertAction)
                present(alertWin, animated: true, completion: nil)
            case 1...randomNumber:
                showAlert(title: "Число не угадано(",
                          text: "Я загадал число побольше, попробуйте еще раз", textfield: true)
            case randomNumber...10:
                showAlert(title: "Число не угадано(",
                          text: "Я загадал число поменьше, попробуйте еще раз", textfield: true)
            default:
                showAlert(title: "Ошибка", text: "Введите число от 1 до 10", textfield: true)
            }
        }
    }

        // добавление элементов на вью
        private func configureSubviews() {
            view.addSubview(welcomeLabel)
            view.addSubview(additionButton)
            view.addSubview(guessTheNumberButton)
            view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            
        }
}
