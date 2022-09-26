//
//  ViewControllerCafeMario.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 22.09.2022.
//

import UIKit
/// Экран кафе Марио, проверяет есть ли бронь, собирает данные клиента
final class CafeMarioViewController: UIViewController {
    // информация о посетителе
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var numberOfGuessTextField: UITextField!
    @IBOutlet private weak var tableNumberTextField: UITextField!
    @IBOutlet private weak var prepaymentSwitch: UISwitch!
    
    private var payment = Payment()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPrepaymentSwitch()
    }
    
    @IBAction private func invoicePaymentAction(_ sender: Any) {
        invoicingOfPaymentAlert()
    }
    //  конфигурация свича предоплаты
    private func setupPrepaymentSwitch() {
        self.prepaymentSwitch.addTarget(
            self,
            action: #selector(switchPrepaymentAction(paramTarget: )),
            for: .valueChanged
        )
    }
    
    // изменение состояния свича предоплаты
    @objc private func switchPrepaymentAction(paramTarget: UISwitch) {
        if paramTarget.isOn {
            Payment.prepayment = 500
            advancePaymentNotice()
        }
    }
    
    // алерт предоплаты
    private func advancePaymentNotice() {
        let advanceAlert = UIAlertController(title: "Вы вносили предоплату 500 руб",
                                             message: "Счет будет выставлен с учетом предоплаты",
                                             preferredStyle: .alert)
        let addActionOk = UIAlertAction(title: "Ok", style: .cancel)
        advanceAlert.addAction(addActionOk)
        self.present(advanceAlert, animated: true)
    }
    
    // алерт счета
    private func invoicingOfPaymentAlert() {
        let invoicingAlert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        let addActionCancel = UIAlertAction(title: "Cancel", style: .default)
        let addActionOk = UIAlertAction(title: "Ок", style: .cancel) { [weak self] _ in
            guard let self = self,
                  let anInvoiceForPayment = self.storyboard?.instantiateViewController(withIdentifier: "AnInvoice")
                    as? AnInvoiceForPaymentViewController
            else { return }
            print("Контроллер найден")
            anInvoiceForPayment.lastName = self.lastNameTextField.text ?? "Значение не задано"
            anInvoiceForPayment.numberOfGuess = self.numberOfGuessTextField.text ?? "Значение не задано"
            anInvoiceForPayment.tableNumber = self.tableNumberTextField.text ?? "Значение не задано"
            self.navigationController?.pushViewController(anInvoiceForPayment, animated: true)
        }
        invoicingAlert.addAction(addActionOk)
        invoicingAlert.addAction(addActionCancel)
        self.present(invoicingAlert, animated: true)
    }
}
