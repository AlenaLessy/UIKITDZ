//
//  AdditionalIngredientsViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 29.09.2022.
//

import UIKit

/// protocol popRootVC для перехода экранов

protocol PopToRootDelegate: AnyObject {
    func goToBack()
}
/// Экран выбора доп ингридиентов
final class AdditionalIngredientsViewController: UIViewController {
    
    enum Ingridients {
        case cheese(Bool)
        case hum(Bool)
        case olive(Bool)
        case chicken(Bool)
        case mushrooms(Bool)
    }
    
    // MARK: - Public Properties
    var currentIndex = 0
    var pizzaInfo: [PizzaInfo]? = []
    
    // MARK: - Private Properties
    private var size = ["25 см", "30 см", "35 см"]
    private var orders: [String] = []
    
    private lazy var addCheeseSwitch = makeSwitch(yValue: 400)
    private lazy var addmushroomsSwitch = makeSwitch(yValue: 450)
    private lazy var addHumSwitch = makeSwitch(yValue: 500)
    private lazy var addChickenSwitch = makeSwitch(yValue: 550)
    private lazy var addOlivesSwitch = makeSwitch(yValue: 600)
    
    private lazy var addCheeseLabel = makeLabel(yValue: 400, text: "Сыр")
    private lazy var addmushroomsLabel = makeLabel(yValue: 450, text: "Грибы")
    private lazy var addHumLabel = makeLabel(yValue: 500, text: "Ветчина")
    private lazy var addChickenLabel = makeLabel(yValue: 550, text: "Курица")
    private lazy var addOlivesLabel = makeLabel(yValue: 600, text: "Маслины")
    
    private lazy var infoButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "info.square"), for: .normal)
        btn.frame = CGRect(x: 280, y: 100, width: 50, height: 50)
        btn.tintColor = .darkGray
        btn.addTarget(self, action: #selector(infoButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.frame = CGRect(x: 0,
                             y: 50,
                             width: 200,
                             height: 50)
        label.center.x = view.center.x
        label.font = UIFont(name: "Arial Bold", size: 25)
        return label
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 75,
                             y: 100,
                             width: 250,
                             height: 250)
        return image
    }()
    
    private lazy var plusButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Выбрать", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        btn.tintColor = .white
        btn.frame = CGRect(x: 60, y: 650, width: 290, height: 40)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var sizePizzSegmentControl: UISegmentedControl = {
        var sc = UISegmentedControl()
        sc = UISegmentedControl(items: size)
        sc.frame = CGRect(x: 75, y: 350, width: 250, height: 30)
        sc.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        sc.addTarget(self, action: #selector(sizePizzSegmentControlAction), for: .valueChanged)
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupImageAndLabel()
        
    }
    
    // MARK: - Make UI
    private func makeSwitch(yValue: Int) -> UISwitch {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.frame = CGRect(x: 300, y: yValue, width: 50, height: 50)
        return switcher
    }
    
    private func makeLabel(yValue: Int, text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.frame = CGRect(x: 75,
                             y: yValue,
                             width: 100,
                             height: 30)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }
    
    // MARK: - Action
    @objc private func infoButtonAction() {
        let infopizzaVC = InfoPizzaViewController()
        infopizzaVC.modalPresentationStyle = .pageSheet
        guard let info = pizzaInfo?[currentIndex].info else { return }
        infopizzaVC.pizzaInfo = info
        present(infopizzaVC, animated: true)
    }
    
    @objc private func sizePizzSegmentControlAction(target: UISegmentedControl) {
        guard target == sizePizzSegmentControl else { return }
        let segmentIndex = target.selectedSegmentIndex
        guard let images = pizzaInfo?[currentIndex].imageSizes else { return }
        switch segmentIndex {
        case 0...2:
            pizzaImageView.image = UIImage(named: images[segmentIndex])
        default:
            break
        }
    }
    
    private func checkOrder() {
        if addHumSwitch.isOn {
            orders.append("Ветчина")
        }
        if addOlivesSwitch.isOn {
            orders.append("Маслины")
        }
        if addChickenSwitch.isOn {
            orders.append("Курица")
        }
        if addmushroomsSwitch.isOn {
            orders.append("Грибы")
        }
        if addCheeseSwitch.isOn {
            orders.append("Сыр")
        }
    }
    
    @objc private func plusButtonAction() {
        checkOrder()
        let billPaymentVC = BillPaymentViewController()
        billPaymentVC.delegate = self
        billPaymentVC.orders = orders
        guard let pizzaInfo = pizzaInfo else { return }
        billPaymentVC.pizzaName = pizzaInfo[currentIndex].name
        let navigationControllerTwo = UINavigationController(rootViewController: billPaymentVC)
        navigationControllerTwo.modalPresentationStyle = .fullScreen
        present(navigationControllerTwo, animated: true)
    }
    
    // MARK: Setup UI
    private func setupImageAndLabel() {
        guard let pizzaInfo = pizzaInfo,
              pizzaInfo.count <= 5
        else { return }
        pizzaImageView.image = UIImage(named: pizzaInfo[currentIndex].imageName)
        pizzaNameLabel.text = pizzaInfo[currentIndex].name
    }
    
    private func setupUI() {
        view.addSubview(plusButton)
        view.addSubview(pizzaNameLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(addCheeseSwitch)
        view.addSubview(sizePizzSegmentControl)
        view.addSubview(addmushroomsSwitch)
        view.addSubview(addCheeseSwitch)
        view.addSubview(addHumSwitch)
        view.addSubview(addOlivesSwitch)
        view.addSubview(addChickenSwitch)
        view.addSubview(addCheeseLabel)
        view.addSubview(addmushroomsLabel)
        view.addSubview(addHumLabel)
        view.addSubview(addChickenLabel)
        view.addSubview(addOlivesLabel)
        view.addSubview(infoButton)
    }
}

/// подписание под протокол для перехода назад
extension AdditionalIngredientsViewController: PopToRootDelegate {
    func goToBack() {
        guard let viewController = self.presentingViewController as? UINavigationController else { return }
        
        view.isHidden = true
        dismiss(animated: false)
        viewController.popToRootViewController(animated: false)
    }
}
