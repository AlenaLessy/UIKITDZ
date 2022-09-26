//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Экран игры составь слово
final class GameViewController: UIViewController {
    
     let checksTheWords = ChecksTheWords()
   
    private lazy var gameLabel: UILabel = {
             let label = UILabel()
             label.frame = CGRect(x: 75, y: 150, width: 250, height: 80)
             label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
             label.textColor = .black
             label.font = UIFont(name: "Demi Bold", size: 14)
             label.textAlignment = .center
             return label
         }()
    
    private lazy var hiButton: UIButton = {
             let button = UIButton()
             button.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
             button.setTitle("Вход", for: .normal)
             button.setTitleColor(.black, for: .normal)
             button.frame = CGRect(x: 150, y: 450, width: 100, height: 70)
             button.addTarget(self, action: #selector(hiButtonAction), for: .touchUpInside)
             return button
         }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubView()
        
    }
    
    @objc private func hiButtonAction() {
        let alertController = UIAlertController(title: "Здравствуйте", message: "Введите слово", preferredStyle: .alert)
               let action = UIAlertAction(title: "OK", style: .default) { _ in
                   guard let text = alertController.textFields?.first?.text  else { return }
                   self.gameLabel.text = self.checksTheWords.returnText(text)
               }
               alertController.addTextField()
               alertController.addAction(action)
               self.present(alertController, animated: true)
           }
    
    private func configureSubView() {
        self.view.addSubview(hiButton)
        self.view.addSubview(gameLabel)
    }
 }
