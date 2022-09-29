//
//  PlayerViewController.swift
//  UIKITDZ
//
//  Created by Алена Панченко on 24.09.2022.
//

import UIKit

import AVFoundation
///  плеер
final class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageSongPlayer: UIImageView!
    @IBOutlet weak var nameSongLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var lenghtSongSlider: UISlider!
    
    var songs: [Song] = []
    
    var currentIndex = 0
    private var songPaths: [String] = []
    private var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSongs()
        setSongPlayer()
        setupSong()
    }
    
    @IBAction private func volumeSlyderAction(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    @IBAction private func lenghtSonSliderAction(_ sender: UISlider) {
        lenghtSongSlider.addTarget(self, action: #selector(chengeSlider(sender: )), for: .touchUpInside)
    }
    @objc private func chengeSlider(sender: UISlider) {
        guard sender == lenghtSongSlider else { return }
        player.currentTime = TimeInterval(sender.value)
    }
    @IBAction private func closeButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction private func nextSongPlayButtonAction(_ sender: Any) {
        currentIndex = (currentIndex + 1 < songPaths.count) ? currentIndex + 1 : 0
        setupSong()
    }
    @IBAction private func previousSongPlayButtonAction(_ sender: Any) {
        if (currentIndex - 1) >= 0 {
            currentIndex -= 1
        } else {
            currentIndex = songPaths.count - 1
        }
        setupSong()
    }
    @IBAction private func playButtonAction(_ sender: Any) {
        let imageName = player.isPlaying ? "play.fill" : "pause.fill"
        playButton.setImage(UIImage(systemName: imageName), for: .normal)
        guard player.isPlaying else {
            player.play()
            return
        }
            player.pause()
    }
    
    private func addSongs() {
        songs.forEach {
            guard let path = Bundle.main.path(forResource: $0.name, ofType: "mp3") else { return }
            songPaths.append(path)
        }
    }
    private func setSongPlayer() {
        guard songPaths.count > 0 else { return }
        do {
            let song = songPaths[currentIndex]
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: song))
            imageSongPlayer.image = UIImage(named: songs[currentIndex].imageName)
            lenghtSongSlider.maximumValue = Float(player.duration)
            
        } catch {
            print("Error")
        }
    }
    
    private func setupSong() {
        setSongPlayer()
        player.play()
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        nameSongLabel.text = songs[currentIndex].name
    }
}
