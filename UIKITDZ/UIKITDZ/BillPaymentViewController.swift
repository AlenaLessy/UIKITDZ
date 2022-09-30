//
//  BillPaymentViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 30.09.2022.
//

import UIKit
/// Экран оплаты
final class BillPaymentViewController: UIViewController {

    // MARK: - Public Properties
    var orders: [String] = []
    var pizzaName = ""
    
    weak var delegate: PopToRootDelegate?
    
    // MARK: - Private Properties
    private lazy var cardPaymentLabel = makeLabel(yValue: 500, text: "Оплата картой")
    private lazy var cashPaymentLabel = makeLabel(yValue: 550, text: "Оплата наличными")
    
    private lazy var cardPaymentSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.frame = CGRect(x: 300, y: 500, width: 50, height: 50)
        switcher.addTarget(self, action: #selector(paySwitchAction(target:)), for: .valueChanged)
        return switcher
    }()
    
    private lazy var cashPaymentSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.frame = CGRect(x: 300, y: 550, width: 50, height: 50)
        switcher.addTarget(self, action: #selector(paySwitchAction(target:)), for: .valueChanged)
        return switcher
    }()
    
    private lazy var payButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(" Pay", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        btn.tintColor = .white
        btn.frame = CGRect(x: 60, y: 650, width: 290, height: 40)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var additionalIngredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Дополнительные ингридиенты:"
        label.numberOfLines = 2
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.frame = CGRect(x: 50,
                             y: 180,
                             width: 300,
                             height: 300)
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    private lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.text = """
Вы заказали пиццу:

\(pizzaName)

"""
        label.numberOfLines = 5
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.frame = CGRect(x: 50,
                             y: 100,
                             width: 300,
                             height: 300)
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    private lazy var addIngredientsNameLabel: UILabel = {
        let label = UILabel()
        var textOrder = ""
        for index in 0 ..< orders.count {
            textOrder += String(index + 1) + " " + orders[index] + "\n"
        }
        label.text = textOrder
        label.numberOfLines = 7
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.frame = CGRect(x: 50,
                             y: 250,
                             width: 200,
                             height: 300)
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Оплата"
        setupSubview()
        cardPaymentSwitch.isOn = true
    }
    
    // MARK: - Action
    @objc private func payButtonAction() {
        let alert = UIAlertController(title: "Заказ оплачен",
                                      message: "Ваш заказ доставят в течение 15 минут",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: false)
            self.delegate?.goToBack()
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    @objc private func paySwitchAction(target: UISwitch) {
             if cashPaymentSwitch === target {
                 cardPaymentSwitch.isOn.toggle()
             } else {
                 cashPaymentSwitch.isOn.toggle()
             }
         }
    
    func setupSubview() {
        view.addSubview(payButton)
        view.addSubview(addIngredientsNameLabel)
        view.addSubview(additionalIngredientsLabel)
        view.addSubview(pizzaNameLabel)
        view.addSubview(cardPaymentSwitch)
        view.addSubview(cashPaymentSwitch)
        view.addSubview(cashPaymentLabel)
        view.addSubview(cardPaymentLabel)
    }
}

// MARK: - Private Methods
private func makeLabel(yValue: Int, text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = UIColor.darkGray
    label.textAlignment = .left
    label.frame = CGRect(x: 75,
                         y: yValue,
                         width: 170,
                         height: 30)
    label.font = UIFont(name: "Arial Bold", size: 17)
    return label
}
