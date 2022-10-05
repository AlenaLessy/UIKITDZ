//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Экран секундомера
final class StopwatchViewController: UIViewController {
    
    // MARK: - Private Outlets
    
    @IBOutlet weak var startBackground: UIView!
    @IBOutlet weak var resetBackground: UIView!
    @IBOutlet weak var stopBackground: UIView!
    @IBOutlet weak var lapBackground: UIView!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var lapButton: UIButton!
    
    // MARK: - Private properties
    
    private let hours = Array(0...23)
    private let minutes = Array(0...59)
    private let seconds = Array(0...59)
    private var timer: Timer?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBorders()
    }
    
    // MARK: - Private Action
    @IBAction func startButtonAction(_ sender: Any) {
        startButton.isHidden = true
        resetButton.isHidden = true
        
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        stopButton.isHidden = true
        startButton.isHidden = false
    }
    
    @IBAction func lapButtonAction(_ sender: Any) {
    }
    //    @IBAction private func startWatchAction(_ sender: Any) {
//        scheduleTimer()
//    }
    
//    @IBAction private func stopWatchAction(_ sender: Any) {
//        if let minsFirst = self.minutes.first,
//           let secondsFirst = self.seconds.first,
//           let hoursFirst = self.hours.first {
//            self.pickerView.selectRow(hoursFirst, inComponent: 0, animated: true)
//            self.pickerView.selectRow(minsFirst, inComponent: 1, animated: true)
//            self.pickerView.selectRow(secondsFirst, inComponent: 2, animated: true)
//            timer?.invalidate()
//        }
//    }
    
    // MARK: - Private method
//    private func scheduleTimer() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
//            guard let self = self else { return }
//            let hour = self.pickerView.selectedRow(inComponent: 0)
//            let mins = self.pickerView.selectedRow(inComponent: 1)
//            let secs = self.pickerView.selectedRow(inComponent: 2)
//            self.pickerView.selectRow(secs + 1, inComponent: 2, animated: true)
//            switch (hour, mins, secs) {
//            case (0, 0, 0):
//                self.timer?.invalidate()
//            case (0...23, 59, 59):
//                if let minsFirst = self.minutes.first,
//                   let secondsFirst = self.seconds.first {
//                    self.pickerView.selectRow(minsFirst, inComponent: 1, animated: true)
//                    self.pickerView.selectRow(secondsFirst, inComponent: 2, animated: true)
//                    self.pickerView.selectRow(hour + 1, inComponent: 0, animated: true)
//                }
//            case (0...23, 0...59, 59):
//                if let secondsFirst = self.seconds.first {
//                    self.pickerView.selectRow(secondsFirst, inComponent: 2, animated: true)
//                    self.pickerView.selectRow(mins + 1, inComponent: 1, animated: true)
//                }
//            default: break
//            }
//        }
//    }
    
    private func setupBorders() {
        startBackground.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.6).cgColor
        resetBackground.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.6).cgColor
        stopBackground.layer.borderColor = UIColor.systemRed.withAlphaComponent(0.6).cgColor
        lapBackground.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.6).cgColor
    }
}
