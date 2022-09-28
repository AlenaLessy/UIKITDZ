//
//  CandyStoreViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 26.09.2022.
//

import UIKit
/// Экран магазина
final class CandyStoreViewController: UIViewController {
   
    // MARK: - Public properties
    
    var welcomeName = ""
    
    // MARK: - Private properties
    
    private var candyImages = [UIImage(named: "candyOne.jpeg"),
                                   UIImage(named: "candyTwo.jpeg"),
                                   UIImage(named: "candyThree.jpeg"),
                                   UIImage(named: "candyFour.jpeg"),
                                   UIImage(named: "candyFive.jpeg")]
    private var candyNames = ["Трюфель", "Шоко", "Малина", "Лимон", "Халва"]
    private var descriptionCandies = ["Премиальный шоколад и терпкий трюфель",
                                         "Горький шоколад с вишней",
                                         "Малиновое пралине с кокосовой начинкой",
                                         "Лимонный мусс и белый шоколад",
                                         "Миндальная халва в молочном шоколаде"]
    private var priceCandyForLabel = ["65 рублей",
                                   "45 рублей",
                                   "49 рублей",
                                   "75 рублей",
                                   "38 рублей"]
    private var currentIndexCandy = Int()
    private var totalAmount = Int()
    
    private lazy var backGroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "candyBarFon.jpeg")
        image.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        return image
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Здравствуйте \(welcomeName)!"
        label.textColor = .red
        label.frame = CGRect(x: 100, y: 120, width: 250, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    private lazy var chokolateCandiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Конфеты ручной работы"
        label.textColor = .red
        label.frame = CGRect(x: 100, y: 185, width: 250, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 17)
        return label
    }()
    
    private lazy var descriptionCandyLabel: UILabel = {
        let label = UILabel()
        label.text = "С любовью к шоколаду"
        label.textColor = .red
        label.frame = CGRect(x: 20, y: candySegmentControl.frame.maxY + 10, width: 350, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 16)
        return label
    }()
    
    private lazy var priceCandyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        label.frame = CGRect(x: 150, y: descriptionCandyLabel.frame.maxY, width: 150, height: 40)
        label.font = UIFont(name: "Arial Bold", size: 16)
        return label
    }()
    private lazy var candyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "candyOne.jpeg")
        image.frame = CGRect(x: 70, y: chokolateCandiesLabel.frame.maxY, width: 270, height: 270)
        return image
    }()
    private lazy var candySegmentControl: UISegmentedControl = {
        var sc = UISegmentedControl()
        sc = UISegmentedControl(items: candyNames)
        sc.frame = CGRect(x: 10, y: candyImage.frame.maxY, width: 370, height: 40)
        sc.backgroundColor = #colorLiteral(red: 0.8695957065, green: 0.4091776013, blue: 0.6098342538, alpha: 1)
        sc.addTarget(self, action: #selector(candySegmentControlAction), for: .valueChanged)
        return sc
    }()
    private lazy var buyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Купить", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.red, for: .normal)
        btn.frame = CGRect(x: 100, y: 650, width: 200, height: 40)
        btn.layer.cornerRadius = 7
        btn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        confirugeSubview()
    }
    
    // MARK: - Action
    
    @objc func loginButtonAction() {
        let paymentVC = PaymentViewController()
        paymentVC.currentIndex = currentIndexCandy
        navigationController?.pushViewController(paymentVC, animated: true)
        }
    
    @objc private func candySegmentControlAction(target: UISegmentedControl) {
        guard target == candySegmentControl else { return }
        let segmentIndex = target.selectedSegmentIndex
        candyImage.image = candyImages[segmentIndex]
        descriptionCandyLabel.text = descriptionCandies[segmentIndex]
        priceCandyLabel.text = priceCandyForLabel[segmentIndex]
        currentIndexCandy = segmentIndex
    }
    
    // MARK: - setup UI
    
    private func confirugeSubview() {
        view.addSubview(backGroundImage)
        view.addSubview(welcomeLabel)
        view.addSubview(chokolateCandiesLabel)
        view.addSubview(candyImage)
        view.addSubview(candySegmentControl)
        view.addSubview(descriptionCandyLabel)
        view.addSubview(priceCandyLabel)
        view.addSubview(buyButton)
    }
}
