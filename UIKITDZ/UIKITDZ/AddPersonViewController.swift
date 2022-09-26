//
//  AddPersonViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 26.09.2022.
//

import UIKit

extension AddPersonViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return 90
        case 1:
            return sex.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return "\(row)"
        case 1:
            return sex[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            ageTextField.text = "\(row)"
        case 1:
            sexTextField.text = sex[row]
        default:
            break
        }
    }
}

final class AddPersonViewController: UIViewController {
    
    private let dataPicker = UIDatePicker()
    private let agePicker = UIPickerView()
    private let sexPicker = UIPickerView()
    private let sex = ["Мужчина", "Женщина"]
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.frame = CGRect(x: 0, y: 20, width: 100, height: 20)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchDown)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.frame = CGRect(x: 280, y: 20, width: 100, height: 20)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(saveInformation), for: .touchDown)
        return button
    }()
    
    private lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.frame = CGRect(x: 135, y: 20, width: 130, height: 130)
        imageView.tintColor = .gray
        return imageView
    }()
    
    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 135, y: 150, width: 130, height: 20)
       // button.center.x = view.center.x
        button.setTitle("Изменить фото", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(changeFotoAction), for: .touchDown)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Имя"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 20, y: 200, width: 100, height: 15)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(x: 20, y: 220, width: 320, height: 30)
        textField.placeholder = "Введите имя"
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    
    private lazy var dataLabel: UILabel = {
        var label = UILabel()
        label.text = "Дата"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 20, y: 280, width: 100, height: 15)
        return label
    }()
    
    private lazy var dataTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(x: 20, y: 300, width: 320, height: 30)
        textField.placeholder = "Введите дату"
        textField.setBottomBorder(color: .systemGray5)
        textField.inputView = dataPicker
        return textField
    }()
    
    private lazy var ageLabel: UILabel = {
        var label = UILabel()
        label.text = "Возраст"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 20, y: 360, width: 100, height: 15)
        return label
    }()
    
    private lazy var ageTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(x: 20, y: 380, width: 320, height: 30)
        textField.placeholder = "Добавить"
        textField.setBottomBorder(color: .systemGray5)
        textField.inputView = agePicker
        return textField
    }()
    
    private lazy var sexLabel: UILabel = {
        var label = UILabel()
        label.text = "Пол"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 20, y: 440, width: 100, height: 15)
        return label
    }()
    
    private lazy var sexTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(x: 20, y: 460, width: 320, height: 30)
        textField.placeholder = "Добавить"
        textField.setBottomBorder(color: .systemGray5)
        textField.inputView = sexPicker
        return textField
    }()
    
    private lazy var instagramLabel: UILabel = {
        var label = UILabel()
        label.text = "Инстаграм"
        label.textColor = #colorLiteral(red: 0.4902775884, green: 0.6610349417, blue: 0.9130681157, alpha: 1)
        label.font = UIFont(name: "Arial Bold", size: 15)
        label.frame = CGRect(x: 20, y: 520, width: 100, height: 15)
        return label
    }()
    
    private lazy var instagramTextField: UITextField = {
        var textField = UITextField()
        textField.frame = CGRect(x: 20, y: 540, width: 320, height: 30)
        textField.placeholder = "Добавить"
        textField.setBottomBorder(color: .systemGray5)
        textField.addTarget(self, action: #selector(instagramAlertAction), for: .allEditingEvents)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        createDatePicker()
        configureAgePickerView()
        configureSexPickerView()
        configureSelfView()
    }
    
    private func configureSelfView() {
        view.addSubview(self.cancelButton)
        view.addSubview(self.addButton)
        view.addSubview(self.photoImage)
        view.addSubview(self.changePhotoButton)
        view.addSubview(self.nameLabel)
        view.addSubview(self.nameTextField)
        view.addSubview(self.dataLabel)
        view.addSubview(self.dataTextField)
        view.addSubview(self.ageLabel)
        view.addSubview(self.ageTextField)
        view.addSubview(self.sexLabel)
        view.addSubview(self.sexTextField)
        view.addSubview(self.instagramLabel)
        view.addSubview(self.instagramTextField)
        view.backgroundColor = .white
    }
    
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc private func saveInformation() {
        nameTextField.text = ""
        dataTextField.text = ""
        ageTextField.text = ""
        sexTextField.text = ""
        instagramTextField.text = ""
        let alertController = UIAlertController(title: "Карточка заполнена",
                                                message: "Информация успешно сохранена",
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        self.present(alertController, animated: true)
    }
    
    @objc private func changeFotoAction() {
    }
    
    @objc private func datePickerButtonAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        dataTextField.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    @objc private func instagramAlertAction() {
        let alertController = UIAlertController(title: "Введите логин", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            guard let text = text else { return }
            self.instagramTextField.text = text
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addTextField()
        alertController.textFields?.first?.placeholder = "Например yadurachek2022"
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.present(alertController, animated: true)
    }
    
    private func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let buttonToolBar = UIBarButtonItem(barButtonSystemItem: .done, target: nil,
                                            action: #selector(datePickerButtonAction))
        toolBar.setItems([buttonToolBar], animated: true)
        dataTextField.inputAccessoryView = toolBar
        dataTextField.inputView = dataPicker
        dataPicker.datePickerMode = .dateAndTime
        dataPicker.locale = .init(identifier: "English")
        dataPicker.preferredDatePickerStyle = .wheels
    }
    
    private func configureAgePickerView() {
        agePicker.tag = 0
        agePicker.delegate = self
        agePicker.dataSource = self
    }
    
    private func configureSexPickerView() {
        sexPicker.tag = 1
        sexPicker.delegate = self
        sexPicker.dataSource = self
    }
    
}
