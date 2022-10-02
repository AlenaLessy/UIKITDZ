//
//  choiceDishViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 29.09.2022.
//

import UIKit
/// Экран выбора блюда
final class ChoiceDishViewController: UIViewController {
    
    // MARK: - private properties
    private lazy var pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 150, width: 100, height: 100)
        image.image = UIImage(named: "pizz.jpeg")
        return image
    }()
    
    private lazy var pizzaButton: UIButton = {
             let btn = UIButton()
             btn.setTitle("Пицца", for: .normal)
             btn.setTitleColor(.black, for: .normal)
             btn.frame = CGRect(x: 20, y: 150, width: 300, height: 100)
             btn.layer.cornerRadius = 7
             btn.addTarget(self, action: #selector(pizzaButtonAction), for: .touchUpInside)
             return btn
         }()
    
    private lazy var rollImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: pizzaImageView.frame.minX, y: pizzaImageView.frame.maxY, width: 100, height: 100)
        image.image = UIImage(named: "roll.jpeg")
        return image
    }()
    
    private lazy var rollButton: UIButton = {
             let btn = UIButton()
             btn.setTitle("Роллы", for: .normal)
             btn.setTitleColor(.black, for: .normal)
        btn.frame = CGRect(x: pizzaImageView.frame.minX, y: pizzaImageView.frame.maxY, width: 300, height: 100)
             btn.layer.cornerRadius = 7
             btn.addTarget(self, action: #selector(rollButtonAction), for: .touchUpInside)
             return btn
         }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Action
    @objc private func pizzaButtonAction() {
        let pizzaVC = PizzaViewController()
        navigationController?.pushViewController(pizzaVC, animated: true)
    }
    
    @objc private func rollButtonAction() { }

    // MARK: - Private Methods
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem()
       title = "Food"
        view.addSubview(rollButton)
        view.addSubview(pizzaImageView)
        view.addSubview(rollImageView)
        view.addSubview(pizzaButton)
        
    }
}
