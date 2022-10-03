//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//
        import UIKit

        /// Экран выбора настроек ввода текста
        final class SettingTextOptionsViewController: UIViewController {
            
            // MARK: - Enum
            private enum Constants {
                static let addText = "Введите текст"
                static let chooseSizeText = "Выберите размер шрифта"
                static let currentSizeFontText = "Текущий размер шрифта: "
                static let chooseNumberOfLinesText = "Выберите количество строк"
                static let currentNumberOfLinesText = "Текущее количество строк: "
                static let chooseColorFontText = "Выберите цвет шрифта"
                static let currentSizeFont = 15
                static let lines = Array(0...5)
                static let colors: [UIColor] = [.black, .blue, .red, .green,
                                                .brown, .orange, .purple, .gray, .magenta, .yellow]
            }
            
            private enum PickerKind: String {
                case numberOfLines
                case textColorPickerView
            }
            
            // MARK: - Visual Components
            
            private lazy var addTextLabel: UILabel = {
                let label = UILabel()
                label.frame = CGRect(x: 0,
                                     y: 90,
                                     width: view.frame.width,
                                     height: 200)
                label.backgroundColor = .gray
                label.text = Constants.addText
                label.numberOfLines = Constants.lines.first ?? 1
                label.textAlignment = .center
                label.lineBreakMode = .byWordWrapping
                label.adjustsFontSizeToFitWidth = true
                label.shadowColor = .purple
                label.shadowOffset = CGSize(width: 3, height: 3)
                return label
            }()
            // выбор размера шрифта
            private lazy var chooseFontSizeLabel: UILabel = {
                let label = UILabel()
                label.text = Constants.chooseSizeText
                label.frame = CGRect(x: 0,
                                     y: 300,
                                     width: view.frame.width,
                                     height: 30)
                label.textAlignment = .center
                label.center.x = view.center.x
                return label
            }()
            
            private lazy var fontSizeSlider: UISlider = {
                let slider = UISlider()
                slider.frame = CGRect(x: 0, y: 330, width: 300, height: 30)
                slider.center.x = view.center.x
                slider.minimumValue = 12
                slider.maximumValue = 44
                slider.value = 20
                slider.addTarget(self, action: #selector(changeSizeTextAction), for: .valueChanged)
                return slider
            }()
            
            private lazy var currentFontSizeLabel: UILabel = {
                let label = UILabel()
                label.text = "\(Constants.currentSizeFontText) \(Constants.currentSizeFont)"
                label.frame = CGRect(x: 0,
                                     y: 360,
                                     width: 300,
                                     height: 30)
                label.textAlignment = .center
                label.center.x = view.center.x
                return label
            }()
            // выбор количества строк
            private lazy var chooseCountLinesLabel: UILabel = {
                let label = UILabel()
                label.text = "\(Constants.chooseNumberOfLinesText)"
                label.frame = CGRect(x: 0,
                                     y: 410,
                                     width: view.frame.width,
                                     height: 30)
                label.textAlignment = .center
                return label
            }()
            
            private lazy var numberOfLinesPikerView: UIPickerView = {
                let picker = UIPickerView()
                picker.tag = 1
                picker.accessibilityIdentifier = PickerKind.numberOfLines.rawValue
                picker.delegate = self
                picker.dataSource = self
                picker.backgroundColor = .gray
                picker.frame = CGRect(x: 0, y: 410, width: view.frame.width, height: 120)
                return picker
            }()
            
            private lazy var currentNumberOfLinesLabel: UILabel = {
                let label = UILabel()
                label.text = "\(Constants.currentNumberOfLinesText) 0"
                label.frame = CGRect(x: 0, y: 530, width: view.frame.width, height: 30)
                label.backgroundColor = .gray
                label.textAlignment = .center
                return label
            }()
            
            // выбор цвета текста
            private lazy var chooseColorFontLabel: UILabel = {
                let label = UILabel()
                label.text = Constants.chooseColorFontText
                label.frame = CGRect(x: 0, y: 600, width: view.frame.width, height: 30)
                label.textAlignment = .center
                return label
            }()
            
            private lazy var textColorPickerView: UIPickerView = {
                let picker = UIPickerView()
                picker.accessibilityIdentifier = PickerKind.textColorPickerView.rawValue
                picker.tag = 0
                picker.delegate = self
                picker.dataSource = self
                picker.backgroundColor = .gray
                picker.frame = CGRect(x: 0, y: 600,
                                      width: view.frame.width, height: 120)
                return picker
            }()
            
            // MARK: - Lificycle
            override func viewDidLoad() {
                super.viewDidLoad()
                configureUI()
            }
            
            // MARK: - Action
            @objc private func addTextAction() {
                let alertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
                alertController.addAction(UIAlertAction(title: "Ввод", style: .default, handler: { text in
                    self.addTextLabel.text = alertController.textFields?.first?.text
                }))
                alertController.addTextField()
                present(alertController, animated: true)
            }
            
            @objc private func changeSizeTextAction(_ sender: UISlider) {
                addTextLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
                currentFontSizeLabel.text = "\(Constants.currentSizeFontText) \(Int(sender.value))"
            }
            
            // MARK: - Configure
            private func configureUI() {
                configureView()
                configureNavigationBar()
                configureTabBar()
            }
            
            private func configureView() {
                view.backgroundColor = .systemBackground
                
                view.addSubview(addTextLabel)
                view.addSubview(fontSizeSlider)
                view.addSubview(chooseFontSizeLabel)
                view.addSubview(numberOfLinesPikerView)
                view.addSubview(textColorPickerView)
                view.addSubview(currentFontSizeLabel)
                view.addSubview(chooseColorFontLabel)
                view.addSubview(chooseCountLinesLabel)
                view.addSubview(currentNumberOfLinesLabel)
                
            }
            
            private func configureNavigationBar() {
                navigationItem.title = "Добавьте текст"
                navigationController?.navigationBar.backgroundColor = .systemGray
                let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                    target: self,
                                                    action: #selector(addTextAction))
                addButtonItem.tintColor = .white
                navigationItem.rightBarButtonItem = addButtonItem
            }
            
            private func configureTabBar() {
                tabBarController?.tabBar.backgroundColor = .systemGray
                tabBarController?.tabBarItem.standardAppearance?.backgroundColor = .black
                let tabBarItem = UITabBarItem(title: "text settings",
                                              image: UIImage(systemName: "text.badge.checkmark"),
                                              selectedImage: nil)
                tabBarController?.tabBar.tintColor = .black
                self.tabBarItem = tabBarItem
            }
        }

        /// Расширение для пикера UIPickerViewDelegate
        extension SettingTextOptionsViewController: UIPickerViewDelegate {
            func numberOfComponents(in pickerView: UIPickerView) -> Int {
                1
            }
            
            func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                switch pickerView.accessibilityIdentifier {
                case PickerKind.numberOfLines.rawValue:
                    return Constants.lines.count
                case PickerKind.textColorPickerView.rawValue:
                    return Constants.colors.count
                default:
                    return 0
                }
            }
            
            func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                switch pickerView.accessibilityIdentifier {
                case PickerKind.numberOfLines.rawValue:
                    return "\(Constants.lines[row])"
                case PickerKind.textColorPickerView.rawValue:
                    return Constants.colors[row].accessibilityName
                default:
                    return ""
                }
            }
        }
        /// Расширение для пикера UIPickerViewDataSource
        extension SettingTextOptionsViewController: UIPickerViewDataSource {
            
            func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                switch pickerView.tag {
                case 0:
                    chooseColorFontLabel.tintColor = Constants.colors[row]
                    addTextLabel.textColor = Constants.colors[row]
                    view.endEditing(true)
                case 1:
                    addTextLabel.numberOfLines = row
                    currentNumberOfLinesLabel.text = "\(Constants.currentNumberOfLinesText) \(row)"
                    view.endEditing(true)
                default:
                    break
                }
            }
        }
