//
//  AnInvoiceForPaymentViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 22.09.2022.
//

import UIKit
/// Класс отвечающий за выставление счета
final class AnInvoiceForPaymentViewController: UIViewController {
    
    @IBOutlet private weak var invoicingLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    @IBOutlet weak var tableNumberLable: UILabel!
    @IBOutlet weak var numberOfGuessLabel: UILabel!
    
    var lastName: String = ""
    var numberOfGuess: String = ""
    var tableNumber: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        invoiceAmountCalculation()
        setTextInLabel()
    }
    
    // Функция вычисления оплаты
    private func invoiceAmountCalculation() {
        if Payment.prepayment == 500 {
            self.invoicingLabel.text = "Итого: 200 руб"
        } else {
            self.invoicingLabel.text = "Итого: 700 руб"
        }
    }
    
    private func setTextInLabel() {
        lastNameLabel.text = lastName
        tableNumberLable.text = tableNumber
        numberOfGuessLabel.text = numberOfGuess
    }
}
