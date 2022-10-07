//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

/// Экран секундомера
final class StopwatchViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let countZero = 0
        static let count = 60
        static let formatter = "%02d"
        static let start = "Старт"
        static let stop = "Стоп"
        static let reset = "Сброс"
    }
    
    // MARK: - Private Outlets
    
    @IBOutlet weak var startBackground: UIView!
    @IBOutlet weak var resetBackground: UIView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var watchLabel: UILabel!
    // MARK: - Private properties
     
    private var timer = Timer()
    private var tapped = false
    private var count = Constants.countZero
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBorders()
    }
    
    // MARK: - Private IBAction
    @IBAction private func startStopAction(_ sender: Any) {
        tapped.toggle()
        guard tapped == true else {
            startStopButton.setTitle(Constants.start, for: .normal)
            timer.invalidate()
            return
        }
        startStopButton.setTitle(Constants.stop, for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(updateValueAction),
                                     userInfo: nil, repeats: true)
    }
    
    @IBAction private func resetAction(_ sender: UIButton) {
        watchLabel.text = makeTimeString(Constants.countZero, Constants.countZero, Constants.countZero)
        count = Constants.countZero
        startStopButton.setTitle(Constants.start, for: .normal)
        tapped = false
        timer.invalidate()
    }
    
    @objc private func updateValueAction() {
        count += 1
        let time = convert(count)
        let timeString = makeTimeString(time.0, time.1, time.2)
        watchLabel.text = timeString
    }
    
    // MARK: - Private Properties
    private func convert(_ seconds: Int) -> (Int, Int, Int) {
        return ((seconds / Constants.count * Constants.count),
                ((seconds % (Constants.count * Constants.count)) / Constants.count),
                ((seconds % (Constants.count * Constants.count)) % Constants.count))
    }
    
    private func makeTimeString(_ hour: Int, _ minutes: Int, _ seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: Constants.formatter, hour)
        timeString += ":"
        timeString += String(format: Constants.formatter, minutes)
        timeString += ":"
        timeString += String(format: Constants.formatter, seconds)
        return timeString
    }
    
    private func setupBorders() {
        startBackground.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.6).cgColor
        resetBackground.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.6).cgColor
    }
}
