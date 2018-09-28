//
//  ViewController.swift
//  MusicWireFrame
//
//  Created by macbook on 14/07/18.
//  Copyright © 2018 Ingenieros Unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ///Is playing
    var isPlaying: Bool = true {
        didSet {
            if isPlaying == true {
                playPauseButton.setImage(UIImage(named: "pause")!, for: .normal)
            }
            else {
                playPauseButton.setImage(UIImage(named: "play")!, for: .normal)
            }
        }
    }

    ///Outlets
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackGround: UIView!
    @IBOutlet weak var playPauseBackGround: UIView!
    @IBOutlet weak var forwardBackGround: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Volviendo circulares los botones
        reverseBackGround.layer.cornerRadius = 35.0
        reverseBackGround.clipsToBounds = true
        reverseBackGround.alpha = 0.0
        
        playPauseBackGround.layer.cornerRadius = 35.0
        playPauseBackGround.clipsToBounds = true
        playPauseBackGround.alpha = 0.0
        
        forwardBackGround.layer.cornerRadius = 35.0
        forwardBackGround.clipsToBounds = true
        forwardBackGround.alpha = 0.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    ///Acciones
    @IBAction func playPauseButtonTapped(_ sender: Any) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform =  CGAffineTransform.identity
            }
        }
        isPlaying = !isPlaying
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
        let buttonBackGround: UIView
        
        switch sender {
        case reverseButton:
            buttonBackGround = reverseBackGround
        case playPauseButton:
            buttonBackGround = playPauseBackGround
        case forwardButton:
            buttonBackGround = forwardBackGround
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackGround.alpha = 0.0
            buttonBackGround.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackGround.transform = CGAffineTransform.identity
        }
        
    }
    
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackGround: UIView
        
        switch sender {
        case reverseButton:
            buttonBackGround = reverseBackGround
        case playPauseButton:
            buttonBackGround = playPauseBackGround
        case forwardButton:
            buttonBackGround = forwardBackGround
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackGround.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
    }
    

    
}

