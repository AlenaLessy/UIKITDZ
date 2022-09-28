//
//  PaymentViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 28.09.2022.
//

import UIKit
/// Экран оформления заказа
final class PaymentViewController: UIViewController {
    
    // MARK: - Public properties
    
    var currentIndex = Int()
    
    // MARK: - Private properties
    
    private var priceArray = [65, 45, 49, 75, 38]
    
    private lazy var backGroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fonPayment.jpeg")
        image.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        return image
    }()
    private lazy var numberCandiesSlider: UISlider = {
        var slider = UISlider()
        slider.backgroundColor = .red
        slider.frame = CGRect(x: 50, y: chooseAmountSweetsLabel.frame.maxY, width: 300, height: 30)
        slider.minimumValue = 0
        slider.maximumValue = 20
        slider.value = 0
        slider.addTarget(self, action: #selector(numberCandiesSliderAction), for: .valueChanged)
        return slider
    }()
    private lazy var deliverySwith: UISwitch = {
        var switcher = UISwitch()
        switcher.isOn = false
        switcher.frame = CGRect(x: 300, y: 500, width: 30, height: 30)
        switcher.backgroundColor = .red
        return switcher
    }()
    private lazy var paymentButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Оплатить", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.frame = CGRect(x: 60, y: 570, width: 290, height: 40)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(paymentButtonAction), for: .touchUpInside)
        return btn
    }()
    private lazy var chooseAmountSweetsLabel: UILabel = {
        var label = UILabel()
        label.text = "Выберите необходимое количество конфет"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 16)
        label.frame = CGRect(x: 0, y: 150, width: 350, height: 40)
        label.center.x = view.center.x
        return label
    }()
    private lazy var totalPurchaseAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "Общая сумма покупки составила:"
        label.textColor = .white
        label.frame = CGRect(x: 20, y: 230, width: 350, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 14)
        return label
    }()
    private lazy var numberCandiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество конфет:"
        label.textColor = .white
        label.frame = CGRect(x: 20, y: 260, width: 350, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 14)
        return label
    }()
    private lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.frame = CGRect(x: 300, y: totalPurchaseAmountLabel.frame.minY, width: 350, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 14)
        return label
    }()
    private lazy var numberOfCandiesLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.frame = CGRect(x: 300, y: numberCandiesLabel.frame.minY, width: 350, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 14)
        return label
    }()
    private lazy var deliveryLabel: UILabel = {
        var label = UILabel()
        label.text = "Доставка до двери"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 17)
        label.frame = CGRect(x: 50, y: 495, width: 200, height: 40)
        label.center.x = view.center.x
        return label
    }()
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя получателя"
        textField.frame = CGRect(x: 60, y: 330, width: 270, height: 50)
        textField.borderStyle = .roundedRect
        return textField
    }()
    private lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите адрес получателя"
        textField.frame = CGRect(x: 60, y: 420, width: 270, height: 50)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        configureSubview()
    }
    
    // MARK: - Action
    
    @objc private func paymentButtonAction() {
        let paymentAlert = UIAlertController(title: nil,
                                             message: "Заказ оформлен",
                                             preferredStyle: .alert)
        let paymentAlertAction = UIAlertAction(title: "OK", style: .cancel)
        paymentAlert.addAction(paymentAlertAction)
        self.present(paymentAlert, animated: true)
        nameTextField.text = ""
        addressTextField.text = ""
        numberCandiesSlider.value = 0
    }
    @objc private func numberCandiesSliderAction() {
        let price = Int(priceArray[currentIndex] * Int(numberCandiesSlider.value))
        sumLabel.text = String(price)
        let nubmerOfCandies = Int(numberCandiesSlider.value)
        numberOfCandiesLabel.text = String(nubmerOfCandies)
    }
    
    // MARK: - setupUI
    
    private func configureSubview() {
        view.addSubview(backGroundImage)
        view.addSubview(deliverySwith)
        view.addSubview(deliveryLabel)
        view.addSubview(chooseAmountSweetsLabel)
        view.addSubview(numberCandiesSlider)
        view.addSubview(totalPurchaseAmountLabel)
        view.addSubview(sumLabel)
        view.addSubview(nameTextField)
        view.addSubview(addressTextField)
        view.addSubview(paymentButton)
        view.addSubview(numberCandiesLabel)
        view.addSubview(numberOfCandiesLabel)
    }
}
