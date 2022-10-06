//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Экран секундомера
final class StopwatchViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak private var startBackground: UIView!
    @IBOutlet weak private var pickerView: UIPickerView!
    @IBOutlet weak private var cancelBackground: UIView!
    // MARK: - Private properties
    
    private let hours = Array(0...23)
    private let minutes = Array(0...59)
    private let seconds = Array(0...59)
    private var timer: Timer?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewDelegate()
        setupBorders()
    }
    
    // MARK: - Private Action
    
    @IBAction private func startWatchAction(_ sender: Any) {
        scheduleTimer()
    }
    
    @IBAction private func stopWatchAction(_ sender: Any) {
        if let minsFirst = self.minutes.first,
           let secondsFirst = self.seconds.first,
           let hoursFirst = self.hours.first {
            self.pickerView.selectRow(hoursFirst, inComponent: 0, animated: true)
            self.pickerView.selectRow(minsFirst, inComponent: 1, animated: true)
            self.pickerView.selectRow(secondsFirst, inComponent: 2, animated: true)
            timer?.invalidate()
        }
    }
    
    // MARK: - Private method
    private func scheduleTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let hour = self.pickerView.selectedRow(inComponent: 0)
            let mins = self.pickerView.selectedRow(inComponent: 1)
            let secs = self.pickerView.selectedRow(inComponent: 2)
            self.pickerView.selectRow(secs + 1, inComponent: 2, animated: true)
            switch (hour, mins, secs) {
            case (0, 0, 0):
                self.timer?.invalidate()
            case (0...23, 59, 59):
                if let minsFirst = self.minutes.first,
                   let secondsFirst = self.seconds.first {
                    self.pickerView.selectRow(minsFirst, inComponent: 1, animated: true)
                    self.pickerView.selectRow(secondsFirst, inComponent: 2, animated: true)
                    self.pickerView.selectRow(hour + 1, inComponent: 0, animated: true)
                }
            case (0...23, 0...59, 59):
                if let secondsFirst = self.seconds.first {
                    self.pickerView.selectRow(secondsFirst, inComponent: 2, animated: true)
                    self.pickerView.selectRow(mins + 1, inComponent: 1, animated: true)
                }
            default: break
            }
        }
    }
    
    private func setupBorders() {
        startBackground.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.6).cgColor
        cancelBackground.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.6).cgColor
    }
    
    private func pickerViewDelegate() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
}

/// UIPickerViewDelegate
extension StopwatchViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutes.count
        case 2:
            return seconds.count
        default:
            return 0
        }
    }
}
/// UIPickerViewDataSource
extension StopwatchViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return hours[row].description
        case 1:
            return minutes[row].description
        case 2:
            return seconds[row].description
        default:
            return nil
        }
    }
}
