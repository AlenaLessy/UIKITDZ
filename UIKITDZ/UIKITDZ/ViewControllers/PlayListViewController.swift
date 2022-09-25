//
//  ViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 21.09.2022.
//

import UIKit

import AVFoundation

/// Основной экран плеера
final class PlayListViewController: UIViewController {

    @IBOutlet weak private var nameSongOneLabel: UILabel!
    @IBOutlet weak private var nameSongTwoLabel: UILabel!
    @IBOutlet private var durationSongOneLabel: UILabel!
    @IBOutlet private var durationSongTwoLabel: UILabel!
    
    private let songs: [Song] = [
        .init(name: "NЮ 18", imageName: "albomNю", duration: "3:05"),
        .init(name: "Po baram", imageName: "albomAveImage", duration: "3:58")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction private func skipSongOneButtonAction(_ sender: Any) {
        guard let playerVC = storyboard?.instantiateViewController(withIdentifier: "Player")
                as? PlayerViewController
        else { return }
        playerVC.songs = songs
        present(playerVC, animated: true)
    }
    
    @IBAction private func skipSongTwoButtonAction(_ sender: Any) {
        guard let playerVC = storyboard?.instantiateViewController(withIdentifier: "Player")
                as? PlayerViewController
        else { return }
        playerVC.currentIndex = 1
        playerVC.songs = songs
        present(playerVC, animated: true)
    }
    
    func setupUI() {
        nameSongOneLabel.text = songs[0].name
        nameSongTwoLabel.text = songs[1].name
        durationSongOneLabel.text = songs[0].duration
        durationSongTwoLabel.text = songs[1].duration
    }
}
