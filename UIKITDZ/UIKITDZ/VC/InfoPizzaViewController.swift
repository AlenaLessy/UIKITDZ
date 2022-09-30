//
//  InfoPizzaViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 30.09.2022.
//

import UIKit
/// экран информации о пицце
final class InfoPizzaViewController: UIViewController {

    // MARK: Public Properties
    var pizzaInfo: String = ""

    // MARK: Private Properties
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = pizzaInfo
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.textAlignment = .left
        label.numberOfLines = 20
        label.frame = CGRect(x: 20,
                             y: 50,
                             width: 300,
                             height: 300)
        label.font = UIFont(name: "Arial Bold", size: 15)
        return label
    }()
    
    private lazy var cancelButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
        btn.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    // MARK: - Action
    @objc private func cancelButtonAction() {
        dismiss(animated: true)
    }
    
    // MARK: - Private Method
    private func configureUI() {
        view.addSubview(cancelButton)
        view.addSubview(infoLabel)
    }
    
}
