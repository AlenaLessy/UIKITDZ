//
//  ReaderViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 04.10.2022.
//

import UIKit
/// Экран читалки
final class ReaderViewController: UIViewController {
    // MARK: - Public Properties
    var bookName = ""
    var textBook = ""
    
    // MARK: - Private Properties
   private var settingsTextReader = SettingsTextReader()
   
    // MARK: Private Visual components
    private lazy var settingsButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: view.frame.maxY - 70, width: view.frame.width, height: 70)
        btn.backgroundColor = #colorLiteral(red: 0.4061566591, green: 0.5152949691, blue: 1, alpha: 1)
        btn.setTitle("Настройки", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var readerTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: view.frame.minY + 100, width: view.frame.width, height: 630)
        textView.text = textBook
        return textView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        view.backgroundColor = .systemBackground
        navigationItem.title = bookName
    }
    
    // MARK: - Private Action
    @objc private func settingsButtonAction() {
        let readerSettingsVC = ReaderSettingsViewController()
        readerSettingsVC.modalPresentationStyle = .pageSheet
        if let sheet = readerSettingsVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        readerSettingsVC.settingsTextReader = settingsTextReader
        readerSettingsVC.backHandler = { [weak self ] in
            self?.handleChanges($0)
        }
        present(readerSettingsVC, animated: true)
        
    }
    
    // MARK: - Private Method
    private func handleChanges(_ settings: SettingsTextReader) {
        readerTextView.textColor = settings.color
        readerTextView.font = UIFont(name: settings.nameFont, size: settings.sizeFont)?.withWeight(settings.fontWeight)
        readerTextView.backgroundColor = settings.readerBackground
        
    }
    
    private func addSubview() {
        view.addSubview(settingsButton)
        view.addSubview(readerTextView)
    }
}
