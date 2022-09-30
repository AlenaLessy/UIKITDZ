//
//  PizzaViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 29.09.2022.
//

import UIKit
/// Экран выбора пиццы
final class PizzaViewController: UIViewController {
    
    // MARK: - private properties
    private var pizzaInfo: [PizzaInfo] = [.init(name: "Ветчина и сыр",
                                                imageName: "bigHamAndMushrooms.jpeg",
                                                compound: "Ветчина, моцарелла, фирменный соус Альфредо",
                                                calories: "276.3 ккал",
                                                imageSizes: ["litleHamAndMushrooms.jpeg",
                                                            "midleHamAndMushrooms.jpeg",
                                                            "bigHamAndMushrooms.jpeg"],
                                                info: """
Cостав: Ветчина, моцарелла, фирменный соус альфредо
Пищевая ценность на 100 г
Энерг. ценность
276,3 ккал
Белки
10,3 г
Жиры
9,9 г
Углеводы
34,7 г
Вес
500 г
"""),
                                          .init(name: "Пепперони",
                                                imageName: "bigPipperoni.jpeg",
                                                compound: "Пепперони, моцарелла, томаты, фирменный томатный соус",
                                                calories: "242 ккал",
                                                imageSizes: ["littlePipperoni.jpeg",
                                                            "midlePipperoni.jpeg",
                                                            "bigPipperoni.jpeg"],
                                               info: """
Состав: Пикантная пепперони , увеличенная порция моцареллы, томаты , фирменный томатный соус
Пищевая ценность на 100 г
Энерг. ценность
246 ккал
Белки
10 г
Жиры
9,4 г
Углеводы
28,7 г
Вес
620 г
"""),
                                          .init(name: "Домашняя",
                                                imageName: "bigHomemade.jpeg",
                                                compound: "Пепперони, ветчина, огурчики, томаты, моцарелла, соус",
                                                calories: "184 ккал",
                                                imageSizes: ["littleHomemade.jpeg",
                                                            "midleHomemade.jpeg",
                                                            "bigHomemade.jpeg"],
                                               info: """
Состав: Пикантная пепперони , ветчина , маринованные огурчики , томаты , моцарелла, фирменный томатный соус
Энерг. ценность
195,9 ккал
Белки
7,3 г
Жиры
5,4 г
Углеводы
28,2 г
Вес
630 г
"""),
                                          .init(name: "Цыпленок",
                                                imageName: "bigCheeseСhicken.jpeg",
                                                compound: "Цыпленок, моцарелла, сыр чеддер, пармезан, томаты, чеснок",
                                                calories: "235 ккал",
                                                imageSizes: ["littleCheeseСhicken.jpeg",
                                                            "midleCheeseСhicken.jpeg",
                                                            "bigCheeseСhicken.jpeg"],
                                               info: """
Состав: Цыпленок , моцарелла, сыры чеддер и пармезан , сырный соус, томаты , фирменный соус альфредо, чеснок
Пищевая ценность на 100 г
Энерг. ценность
243,9 ккал
Белки
11 г
Жиры
8,9 г
Углеводы
28,3 г
Вес
620 г
"""),
                                          .init(name: "Гавайская",
                                                imageName: "bigHawaiian.jpeg",
                                                compound: "Ветчина, ананасы, моцарелла, фирменный томатный соус",
                                                calories: "206 ккал",
                                                imageSizes: ["littleHawaiian.jpeg",
                                                            "midleHawaiian.jpeg",
                                                            "bigHawaiian.jpeg"],
                                               info: """
Состав: Ветчина , ананасы , моцарелла, фирменный томатный соус
Пищевая ценность на 100 г
Энерг. ценность
209,2 ккал
Белки
8,1 г
Жиры
5,7 г
Углеводы
30 г
Вес
650 г
""")]
   
    private lazy var pizzaHamCheeseImage = makePizzaImageView(yCoordinate: 150)
    private lazy var pizzaPipperoniImage = makePizzaImageView(yCoordinate: 270)
    private lazy var pizzaHomemadeImage = makePizzaImageView(yCoordinate: 390)
    private lazy var pizzaChickenCheeseImage = makePizzaImageView(yCoordinate: 510)
    private lazy var pizzaHawaiianImage = makePizzaImageView(yCoordinate: 630)
    
    private lazy var pizzaHamCheeseLabel = makeNamePizzaLabel(yCoordinate: 200)
    private lazy var pizzaPipperoniLabel = makeNamePizzaLabel(yCoordinate: 320)
    private lazy var pizzaHomemadeLabel = makeNamePizzaLabel(yCoordinate: 440)
    private lazy var pizzaChickenCheeseLabel = makeNamePizzaLabel(yCoordinate: 560)
    private lazy var pizzaHawaiianLabel = makeNamePizzaLabel(yCoordinate: 680)
    
    private lazy var pizzaHamCheeseButton = makeButton(yCoordinate: 200)
    private lazy var pizzaPipperoniButton = makeButton(yCoordinate: 320)
    private lazy var pizzaHomemadeButton = makeButton(yCoordinate: 440)
    private lazy var pizzaChickenCheeseButton = makeButton(yCoordinate: 560)
    private lazy var pizzaHawaiianButton = makeButton(yCoordinate: 680)
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        btn.tintColor = .darkGray
        btn.setTitleColor(.white, for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return btn
    }()
    
    // MARK: Life сycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backVCButton()
        configureUI()
        setupImageAndLabel()
        addTargetButton()
    }
    
    // MARK: - Private Methods
    private func makePizzaImageView(yCoordinate: Int) -> UIImageView {
        let image = UIImageView()
        image.frame = CGRect(x: 10, y: yCoordinate, width: 135, height: 135)
        return image
    }
    
    private func makeNamePizzaLabel(yCoordinate: Int) -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.frame = CGRect(x: 160,
                             y: yCoordinate,
                             width: 150,
                             height: 30)
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }
    
    private func makeButton(yCoordinate: Int) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        btn.tintColor = .white
        btn.frame = CGRect(x: 330, y: yCoordinate, width: 40, height: 40)
        btn.layer.cornerRadius = 7
        return btn
    }
    
    // MARK: Action
    private func addTargetButton() {
        pizzaHamCheeseButton.addTarget(self, action: #selector(pizzaHamCheeseButtonAction), for: .touchUpInside)
        pizzaPipperoniButton.addTarget(self, action: #selector(pizzaPipperoniButtonAction), for: .touchUpInside)
        pizzaHomemadeButton.addTarget(self, action: #selector(pizzaHomemadeButtonAction), for: .touchUpInside)
        pizzaChickenCheeseButton.addTarget(self, action: #selector(pizzaChickenCheeseButtonAction), for: .touchUpInside)
        pizzaHawaiianButton.addTarget(self, action: #selector(pizzaHawaiianButtonAction), for: .touchUpInside)
    }
    
    @objc private func pizzaHamCheeseButtonAction() {
        let additionalIngredientsVC = AdditionalIngredientsViewController()
        additionalIngredientsVC.currentIndex = 0
        additionalIngredientsVC.pizzaInfo = pizzaInfo
        present(additionalIngredientsVC, animated: true)
    }
    
    @objc private func pizzaPipperoniButtonAction() {
        let additionalIngredientsVC = AdditionalIngredientsViewController()
        additionalIngredientsVC.currentIndex = 1
        additionalIngredientsVC.pizzaInfo = pizzaInfo
        present(additionalIngredientsVC, animated: true)
    }
    
    @objc private func pizzaHomemadeButtonAction() {
        let additionalIngredientsVC = AdditionalIngredientsViewController()
        additionalIngredientsVC.currentIndex = 2
        additionalIngredientsVC.pizzaInfo = pizzaInfo
        present(additionalIngredientsVC, animated: true)
    }
    
    @objc private func pizzaChickenCheeseButtonAction() {
        let additionalIngredientsVC = AdditionalIngredientsViewController()
        additionalIngredientsVC.currentIndex = 3
        additionalIngredientsVC.pizzaInfo = pizzaInfo
        present(additionalIngredientsVC, animated: true)
    }
    
    @objc private func pizzaHawaiianButtonAction() {
        let additionalIngredientsVC = AdditionalIngredientsViewController()
        additionalIngredientsVC.currentIndex = 4
        additionalIngredientsVC.pizzaInfo = pizzaInfo
        present(additionalIngredientsVC, animated: true)
    }
    
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    private func setupImageAndLabel() {
        guard pizzaInfo.count <= 5 else { return }
        pizzaHamCheeseImage.image = UIImage(named: pizzaInfo[0].imageName)
        pizzaPipperoniImage.image = UIImage(named: pizzaInfo[1].imageName)
        pizzaHomemadeImage.image = UIImage(named: pizzaInfo[2].imageName)
        pizzaChickenCheeseImage.image = UIImage(named: pizzaInfo[3].imageName)
        pizzaHawaiianImage.image = UIImage(named: pizzaInfo[4].imageName)
        
        pizzaHamCheeseLabel.text = pizzaInfo[0].name
        pizzaPipperoniLabel.text = pizzaInfo[1].name
        pizzaHomemadeLabel.text = pizzaInfo[2].name
        pizzaChickenCheeseLabel.text = pizzaInfo[3].name
        pizzaHawaiianLabel.text = pizzaInfo[4].name
        
    }
    
    private func backVCButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    // MARK: configure
    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Pizza"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        view.addSubview(pizzaHamCheeseImage)
        view.addSubview(pizzaHawaiianImage)
        view.addSubview(pizzaHomemadeImage)
        view.addSubview(pizzaPipperoniImage)
        view.addSubview(pizzaChickenCheeseImage)
        
        view.addSubview(pizzaHamCheeseLabel)
        view.addSubview(pizzaHawaiianLabel)
        view.addSubview(pizzaHomemadeLabel)
        view.addSubview(pizzaPipperoniLabel)
        view.addSubview(pizzaChickenCheeseLabel)
        
        view.addSubview(pizzaHamCheeseButton)
        view.addSubview(pizzaHawaiianButton)
        view.addSubview(pizzaHomemadeButton)
        view.addSubview(pizzaPipperoniButton)
        view.addSubview(pizzaChickenCheeseButton)
    }
    
}
