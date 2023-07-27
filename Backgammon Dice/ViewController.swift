//
//  ViewController.swift
//  Backgammon Dice
//
//  Created by Тимур on 26.07.2023.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    let images = ["1", "2", "3", "4", "5", "6"]
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let jackpotView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "jackpot")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceOne: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 229/255, green: 153/255, blue: 59/255, alpha: 1)
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func rollButtonPressed() {
        diceOne.image = UIImage(named: images.randomElement()!)
        diceTwo.image = UIImage(named: images.randomElement()!)
        
        if diceOne.image == diceTwo.image {
            playSoundWin()
            showImage()
            hideImage()
        } else {
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "dice_sound" , withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playSoundWin() {
        let url = Bundle.main.url(forResource: "win_sound" , withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func showImage() {
        jackpotView.isHidden = false
        UIView.animate(withDuration: 3.0, animations: {
            self.jackpotView.alpha = 1.0
        })
    }
    
    func hideImage() {
        UIView.animate(withDuration: 3.0, animations: {
            self.jackpotView.alpha = 0.0
        }) { _ in
            self.jackpotView.isHidden = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        view.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        view.addSubview(jackpotView)
        jackpotView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15).isActive = true
        jackpotView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        jackpotView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        jackpotView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        jackpotView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        jackpotView.isHidden = true
        
        
        view.addSubview(diceOne)
        diceOne.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        diceOne.heightAnchor.constraint(equalToConstant: 120).isActive = true
        diceOne.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        view.addSubview(diceTwo)
        diceTwo.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        diceTwo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        diceTwo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(rollButton)
        rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rollButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        rollButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        rollButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    
}

