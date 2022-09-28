//
//  ShareViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 28.09.2022.
//

import UIKit
/// Экран мемов
final class MemViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var memImage: UIImageView!
    @IBOutlet weak var memSegmentControl: UISegmentedControl!
    
    // MARK: - Private properties
    
    private var activityViewController: UIActivityViewController?
    private var imageArray = [UIImage(named: "mem1"),
                              UIImage(named: "mem2"),
                              UIImage(named: "mem3"),
                              UIImage(named: "mem4")]
    private var someText = ["some text one", "some text two", "some text three"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    // MARK: - Action
    
    @IBAction func shareAction(_ sender: Any) {
        shareButton()
    }
    @IBAction func memSegmentControlAction(_ sender: UISegmentedControl) {
        guard sender == memSegmentControl else { return }
        memSegmentControl.addTarget(self, action: #selector(memSegmenrControlImageAction), for: .valueChanged)
    }
    @IBAction func shareButtonImageAction(_ sender: UIButton) {
    let selectedIndex = memSegmentControl.selectedSegmentIndex
            guard let image = imageArray[selectedIndex] else { return }
            let activity = UIActivityViewController(
                activityItems: [image],
                applicationActivities: .none
            )
            present(activity, animated: true, completion: .none)
        }
    
    @objc private func memSegmenrControlImageAction() {
        let segmentIndex = memSegmentControl.selectedSegmentIndex
        memImage.image = imageArray[segmentIndex]
    }
    @objc private func shareButton() {
        guard let item = memImage.image else { return }
        let activityViewController = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
    
    private func sharingPickerAction() {
        guard let link = URL(string: "https://lisica.com"),
              let text = infoLabel.text
        else { return }
        activityViewController = UIActivityViewController(activityItems: [text, link], applicationActivities: nil)
        infoLabel.text = "\(link)"
        guard let activityViewController = self.activityViewController else { return }
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - SetupUI
    private func configure() {
        memSegmentControl.selectedSegmentIndex = 0
        memImage.image = UIImage(named: "mem1")
        myPicker.delegate = self
        myPicker.dataSource = self
    }
        }

// MARK: - extension picker

extension MemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return someText[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0, 1:
            infoLabel.text = someText[row]
        case 2:
            sharingPickerAction()
        default:
            break
        }
    }
}
